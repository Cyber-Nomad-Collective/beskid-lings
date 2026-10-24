# Lists

`List<T>` (`use Core.Collections.List;`) is a list that grows. Make one with
`List.New<T>()` and declare it `mut`, because adding items changes it:

```
mut List<string> items = List.New<string>();
items.Push("bread");
items.Push("milk");
```

`items.Count()` gives the number of items; `items.Get(index)` returns a
`Result`, because the index may be out of range.

Assigning or passing a list gives the new name its own copy of the items, so
changing one list never changes another by surprise.
