# Isolates and parallel sequences

An isolate runs work on its own processor core with its own heap. The simplest
way to use them is a parallel sequence:

```
i64 total = numbers
    .Parallel()
    .Where((x) => x > 0_i64)
    .Map((x) => x * x)
    .Reduce(0_i64, SumI64 { });
```

`Parallel()` splits the list; `Where` keeps items; `Map` transforms them;
`Reduce` folds the results with a combiner such as `SumI64 { }`
(`use Core.Parallel.Combiners;`).

The steps run at the same time on different isolates, so a step cannot change
a variable of the caller. Express counting and summing as a reduction instead.

Number literals take their type from where they are used. In `Map` and
`Reduce`, write the type out (`1_i64`, `0_i64`) so the results match the
`SumI64` combiner.
