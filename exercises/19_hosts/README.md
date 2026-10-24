# Hosts and native dependency injection

Beskid builds the object graph of an application from a declaration:

```
host AppHost() {
    registry {
        single PoliteGreeter for Greeter;
        single Reception;
    }
}
```

- `single X for C;` - one `X`, given to everyone who needs a `C`.
- `transient X for C;` - a new `X` each time.
- `single X;` - register `X` as itself.
- `inject C name;` - a field that the host fills in.
- `launch AppHost();` - start the host; one launch per program.

The compiler resolves the whole graph: an `inject` with no registration is a
compile error, so a missing service never surprises you at run time.

Hosts also have `startup(...)`, named `scope`s with `init(...)`/`dispose(...)`,
and `with Scope(...) { ... }` to activate a scope. In Beskid 0.6.6 those hooks
do not run yet; the compiler checks them.
