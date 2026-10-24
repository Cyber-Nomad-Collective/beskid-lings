# Results

Beskid has no exceptions. A function that can fail returns `Result<T, E>`,
which is either `Result::Ok(value)` or `Result::Error(error)`. Add
`use Core.Results;` to use it.

The caller decides what to do: `match` on the result, or write `?` after the
call. `?` gives the `Ok` value, or returns the `Error` from the current
function at once. The current function must itself return a `Result` with the
same error type.
