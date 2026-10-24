# Exchange

A field that owns a Moved value is replaced with `exchange`:

```
string[] old = exchange(this.messages, move replacement);
```

`exchange` puts `replacement` into the field and returns what was there, in one
step, so the old value always has exactly one owner. `move this.messages`
takes the value out and leaves an empty one behind.

A method that changes its object declares `mut this` as its first parameter.
