# Attributes

An attribute is written in square brackets before an item: `[Copyable]`. It
gives the compiler a fact it checks and uses.

The transfer markers decide whether a value may go to another isolate:

| Marker | Transfer class | Meaning |
| --- | --- | --- |
| `[Copyable]` | Copied | Plain data, copied when it crosses |
| `[Immutable]` | Shared | Never changes, so isolates may share it |
| `[Isolated]` | Moved | One owner, handed over when it crosses |
| (none) | Never | Stays where it was made |

A type without a marker cannot be captured by a parallel task.
