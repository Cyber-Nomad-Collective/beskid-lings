# Variables

Beskid declares the type before the name: `i32 count = 0;`. When the type is
obvious, `let count = 0;` asks the compiler to infer it.

Bindings are immutable by default. Add `mut` when a value must change:
`mut i32 count = 0;` or `let mut count = 0;`. The compiler rejects an
assignment to an immutable binding, so you see the mistake before the program
runs.

Further reading: <https://beskid-lang.org/book/>.
