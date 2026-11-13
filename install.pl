#!/usr/bin/env perl
# install.pl -- TEMPORARY install script for MDGN bundle
# Copyright (C) 2026  Sophia Elizabeth Shapira
#
# This library is free software; you can redistribute it and/or
# modify it under the terms of the GNU Lesser General Public
# License as published by the Free Software Foundation; either
# version 2.1 of the License, or (at your option) any later version.
#
# This library is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public
# License along with this library; if not, see <https://www.gnu.org/licenses/>.


use strict;
use warnings;
use FindBin qw($RealBin);
use JSON::PP ();

# Select the MDGN installation prefix according to
# which of the two supported bin directories appears
# first in the user's PATH.

my $home;
my $path;
my $each;
my $prefix;
my $packd;
my $pknom;

# Obtain the home directory and executable search path.
$home = $ENV{'HOME'};
$path = $ENV{'PATH'} // '';
$prefix = undef;

if ( !defined($home) || $home eq '' )
{
  die "Cannot select MDGN installation prefix: HOME is not set.\n";
}

# Search PATH in order, stopping at the first match.
foreach $each (split(/:/,$path))
{
  if ( $each eq "$home/.local/bin" )
  {
    $prefix = "$home/.local/mdgn";
    last;
  }

  if ( $each eq "$home/local/bin" )
  {
    $prefix = "$home/local/mdgn";
    last;
  }
}

# Failure to find either directory is fatal.
if ( !defined($prefix) )
{
  die "Cannot select MDGN installation prefix: neither "
    . "$home/.local/bin nor $home/local/bin "
    . "was found in PATH.\n";
}

if ( !(chdir($RealBin)) )
{
  die "\nInstall script couldn't enter its own home directory!!!\n\n";
}

# Report the selected prefix.
#print "$prefix\n";

system('rm','-rf','build');
if( ( -d 'build') || ( -f 'build' ) )
{
  die "\nCouldn't delete old `build` directory.\n\n";
}
system('mkdir','build');
if( !( -d 'build' ) )
{
  die "\nCouldn't create new `build` directory.\n\n";
}


{
  # Load the package information from JSON.
  my $lc_fh;
  my $lc_json;

  open($lc_fh,'<:raw','cont/pack-data.json')
    or die "Cannot open 'cont/pack-data.json': $!\n";

  # Read the entire file.
  local $/;
  $lc_json = <$lc_fh>;

  close($lc_fh)
    or die "Cannot close pack-data.json: $!\n";

  # Decode the JSON into our package data variable.
  $packd = JSON::PP->new->utf8->decode($lc_json);
}

$pknom = $packd->{'name'};
if ( ( !(defined($pknom)) ) || ( ref($pknom) ne '' ) || ( $pknom eq '' ) )
{
  die "\nPACKAGE HAS NO NAME TO SPEAK OF!!!!!\n\n";
}

system('cp','-r','cont',('build/' . $pknom));
system('rm','-rf',($prefix . '/'. $pknom));
system('mkdir','-p',$prefix);
system('cp','-r',('build/' . $pknom),($prefix . '/.'));


