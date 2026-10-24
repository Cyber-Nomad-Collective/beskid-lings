# Move

Beskid sorts every type into a transfer class. Arrays and lists are **Moved**:
they have one owner at a time. Numbers, `bool` and `string` are **Shared** and
can go anywhere.

In ordinary code you never think about this. It matters only when a value
crosses to another isolate, for example when a parallel task captures it:

```
Task<i64> task = s.Spawn(() => Total(move scores));
```

`move scores` hands the array over to the task. From then on it belongs to
the task, and using `scores` again in the caller is an error. Read what you
need from it first, then hand it over. If you forget `move`, the compiler
tells you to write it.

The array must have only one name when it crosses: declare it inside the
`Parallel.Scope` body, next to the task that takes it.
