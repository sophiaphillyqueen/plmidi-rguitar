# Chord Naming Conventions

## 1. Abstractions and Terminology

Throughout this document, the following symbols are used as
abstractions rather than literal chord or note names:

- `X` represents a chord name, including any chord-quality
  designation, such as `C`, `Cm`, `C7`, `Cm7`, or `Cmaj7`
- `Y` represents an individual note name, such as `C`, `E`,
  `F#`, or `Bb`
- `n` represents a positive integer identifying a numbered
  version of a chord

For example, when `X` is `Cmaj7` and `Y` is `E`:

- `X/Y` becomes `Cmaj7/E`
- `X//Y` becomes `Cmaj7//E`
- `2X/Y` becomes `2Cmaj7/E`
- `2X//Y` becomes `2Cmaj7//E`

## 2. Numbered Chord Versions

A chord may have multiple versions located at different
positions along the instrument's neck.

These versions are numbered according to their positions,
progressing from the headstock toward the body of the
instrument:

- `X` or `1X`: The version closest to the headstock,
  and therefore the version most likely to contain
  open strings
- `2X`: The version second-closest to the headstock
- `3X`: The version third-closest to the headstock
- `4X`, `5X`, etc.: Subsequent versions, continuing
  toward the body of the instrument

The number is part of the chord's identity and remains
associated with that version when constructing its variants.

The number `1` may always be omitted, making `X` and `1X`
synonymous.

## 3. Bass Notes and Slash Notation

For guitar types where the musician has a reasonable choice
of which note of a chord is played as its bass note, a chord
name without a slash separator always identifies a chord
whose bass note is the root note of that chord.

For these guitar types, `X` and `X/X` are synonymous,
identifying the same chord configuration.

The notation `X/Y` identifies the chord `X` with `Y`
as its bass note.

However, for guitar types where the musician does not
have a reasonable choice of which note serves as the
bass note, such as a standard reentrant-tuned ukulele,
the requirement that `X` have its root note as its bass
note does not apply.

Consequently, for these guitar types, `X` and `X/X`
are not necessarily synonymous.

Examples:

- `C/E`: C major with E as its bass note
- `Cm/Eb`: C minor with Eb as its bass note
- `Cmaj7/E`: C major seventh with E as its bass note
- `D7/F#`: D dominant seventh with F# as its bass note

### 3.1. Constructing Slash-Chord Variants

A slash-chord variant is derived from an existing numbered
version of the original chord.

There are three permitted methods:

1. **Remove the original bass string:** Stop playing the
   original bass string, allowing the lowest-pitched
   remaining played string to become the new bass

2. **Add a lower bass string:** Start playing an additional
   string whose pitch is lower than the original bass,
   without changing the original played strings

3. **Change the bass string's fret:** Retain the same set
   of played strings, but change the fret position of the
   original bass string, leaving the fret positions of
   every other string unchanged

For example, `2C` can be modified into `2C/E` by adding
the open low E string.

### 3.2. Numbering Slash-Chord Variants

The number of a slash-chord variant identifies the original
numbered chord version from which it was derived.

Consequently:

- `X/Y` or `1X/Y` is a variant of `X` or `1X`
- `2X/Y` is a variant of `2X`
- `3X/Y` is a variant of `3X`

**Important:** The numbering of slash-chord variants is
NOT independently determined by their positions along
the neck.

For example, `2X/Y` retains its name even if it happens
to be the closest available `X/Y` configuration to the
headstock.

If the original `1X` cannot be modified to produce the
required bass note, then `X/Y` and `1X/Y` do not exist,
even if `2X/Y` does exist.

## 4. Double-Slash Notation

The notation `X//Y` identifies a version of `X` whose
fret positions and played strings are identical to `X`,
but whose finger assignments are optimized for an easy
transition to `X/Y`.

In particular, the fingering is chosen so that transitioning
from `X//Y` to `X/Y` does not require changing the finger
assignments on any strings whose fret positions remain
unchanged.

Unlike `X/Y`, **the bass note of `X//Y` remains the root
note of `X`**.

For example:

- `Cmaj7`: An ordinary C major seventh chord
- `Cmaj7//E`: The same chord and fret configuration,
  fingered for an easy transition to `Cmaj7/E`
- `Cmaj7/E`: C major seventh with E as its bass note

The same convention applies to numbered versions:

- `2C//E`: A fingering of `2C` optimized for `2C/E`
- `2C/E`: The corresponding slash-chord variant

Double-slash notation applies regardless of which of
the three methods described in Section 3.1 is used to
construct the destination slash-chord variant.

## 5. Multiple Names for the Same Configuration

The chord catalog format allows a single chord
configuration to have multiple names.

In particular, the `nomx` list can contain multiple
names associated with the same `neck` configuration.

This avoids unnecessarily duplicating configurations
whose played strings, fret positions, and finger
assignments are all identical.

For example, when the ordinary fingering of `X` is
already optimal for transitioning to `X/Y`, both `X`
and `X//Y` can be names of the same configuration.

Similarly, `X` and `1X` are synonymous names for the
same numbered chord version.

However, when `X` and `X//Y` require different finger
assignments, they must be represented by separate
configurations, even though their played strings and
fret positions are identical.

## 6. Summary of Naming Patterns

| Pattern | Meaning |
|---|---|
| `X` | First version of chord X |
| `1X` | Synonym for X |
| `2X` | Second version of chord X |
| `nX` | Numbered version n of chord X |
| `X/Y` | First version of X, modified to use Y as bass |
| `1X/Y` | Synonym for X/Y |
| `nX/Y` | Variant of numbered version n with Y as bass |
| `X//Y` | First version of X, fingered for transition to X/Y |
| `1X//Y` | Synonym for X//Y |
| `nX//Y` | Version n of X, fingered for transition to nX/Y |

The distinction to remember is that a single slash
identifies a change in the bass note, whereas a double
slash identifies a fingering selected to facilitate
a transition to the corresponding single-slash chord.


