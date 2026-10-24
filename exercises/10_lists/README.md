# Lists

`List<T>` (`use Core.Collections.List;`) is a list that grows. Make one with
`List.New<T>()`.

A list has exactly one owner. `Push` takes the list, adds the item and gives
the list back, so you write:

```
items = items.Push("milk");
```

If you call `items.Push("milk");` alone, the old `items` is gone and the new
one is thrown away. The compiler reports that `items` was moved.

`items.Count()` gives the number of items; `items.Get(index)` returns a
`Result`, because the index may be out of range.
