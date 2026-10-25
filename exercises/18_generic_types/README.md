# Generic types

Types take type parameters too:

```
type Pair<A, B> {
    A first;
    B second;
}

Pair<string, i32> age = Pair<string, i32> { first: "age", second: 42 };
```

Inside the type, `A` and `B` name the types the user chose; methods use them
in parameters and return types. A method that changes the value declares
`mut this`.
