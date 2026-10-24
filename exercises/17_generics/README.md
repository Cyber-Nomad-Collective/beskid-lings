# Generic functions

A generic function declares type parameters after its name:

```
T FirstOr<T>(T[] values, T fallback) { ... }
```

`T` is a placeholder. Each call fills it in, usually by inference from the
arguments: `FirstOr(numbers, 0)` with `i32[] numbers` makes `T` an `i32`. You
can also write it: `FirstOr<string>([], "none")`.

Inside the function you know nothing about `T` except what a bound says.
`where T: Named` admits only types that conform to the contract `Named`, so
the body may call the members of `Named` on a `T`.

Known issues in Beskid 0.6.6: inferring `T` from an array literal of plain
numbers (`FirstOr([7, 8], 0)`) is an internal compiler error, so put the
array in a typed variable first; and inside a generic function, compare
elements with an index loop (`values[i] == target`) rather than a
`for value in values` loop.
