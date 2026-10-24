# Enums and match

An `enum` lists every form a value can have. A variant can carry data:

```
enum Shape {
    Square(i32 side),
    Rectangle(i32 width, i32 height),
}
```

`match` chooses the arm for the variant and binds its data to names. The
compiler checks that the arms cover every variant, so adding a variant later
shows you every `match` you must update.
