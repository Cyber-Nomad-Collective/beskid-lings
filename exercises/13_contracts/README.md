# Contracts

A `contract` lists members that a type must have:

```
contract Shape {
    i32 Area();
}
```

A type promises to meet it with `type Square : Shape { ... }`. The compiler
checks the promise: every member of the contract must exist with the same
signature, and it must be `pub`. A function that takes a `Shape` then works
with every conforming type.
