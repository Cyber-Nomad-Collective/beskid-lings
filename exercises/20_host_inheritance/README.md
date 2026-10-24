# Host inheritance and lifetimes

`host AppHost() : BaseHost { ... }` starts from `BaseHost`'s registrations and
adds its own. A registration in the child for a contract the parent already
registered replaces the parent's: this is how an application swaps one
service (a fixed clock in tests, a real database in production).

The child may change the implementation, not the lifetime. If the parent
registered `single SystemClock for Clock;`, the child must also use `single`.
