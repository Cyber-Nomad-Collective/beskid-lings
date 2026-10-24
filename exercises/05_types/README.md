# Types (records)

`type` declares a record: named fields, each with a type, separated by commas.

```
type Point {
    i32 x,
    i32 y,

    i32 Sum() {
        return this.x + this.y;
    }
}
```

Create a value with `Point { x: 1, y: 2 }` and read a field with `point.x`.
Methods are functions inside the type body; they reach the fields through
`this`.
