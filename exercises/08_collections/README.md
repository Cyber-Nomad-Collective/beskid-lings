# Collections: arrays

`i32[]` is an array of `i32`. Write one as `[1, 2, 3]`.

- `values[0]` reads the first element.
- `Array.Len<i32>(values)` returns the length as an `i64` (add
  `use Core.Collections.Array;`).
- `for value in values { ... }` visits every element in order.

Beskid 0.6.6 does not handle compound assignment yet: write
`total = total + value;`, not `total += value;`. The short forms (`+=`, `-=`,
`*=`, `/=`, `%=`) arrive in 0.6.7.
