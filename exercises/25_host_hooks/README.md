# Host hooks

A host can run code at fixed points of its life:

- `startup(...)` runs once, during `launch`, after the registry is built;
- a named `scope Name(...) { ... }` has `init(...)` and `dispose(...)`, which
  run when `with Name(...) { ... }` enters and leaves the scope.

Hook parameters are services: the host fills them in from the registry, like
`inject` fields. Ask for the type the registry provides. After
`single PoliteGreeter for Greeter;` that type is the contract `Greeter`; the
host never hands out `PoliteGreeter` by that name.
