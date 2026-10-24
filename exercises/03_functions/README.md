# Functions

A function starts with its return type, then its name and typed parameters:

```
i32 Add(i32 left, i32 right) {
    return left + right;
}
```

A function that returns nothing has the return type `unit`. Every call must
pass exactly the parameters the function declares.
