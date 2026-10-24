# Move

Beskid sorts every type into a transfer class. Arrays and lists are **Moved**:
they have one owner at a time. Numbers, `bool` and `string` are **Shared** and
can be used freely.

A function that keeps a Moved value declares the parameter with `move`:
`Archive Store(move i32[] scores)`. The caller hands the value over with
`Store(move scores)`. From then on, `scores` belongs to the function, and
using it again in the caller is an error. Use the value first, then hand it over.
