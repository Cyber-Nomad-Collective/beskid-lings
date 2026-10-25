# Exchange

`exchange(place, value)` puts `value` into a field or an array element and
returns what was there, in one step:

```
string[] old = exchange(this.messages, empty);
```

It is the clean way to empty a field and keep its old content, for example to
drain an inbox or swap a buffer.

A method that changes its object declares `mut this` as its first parameter.
