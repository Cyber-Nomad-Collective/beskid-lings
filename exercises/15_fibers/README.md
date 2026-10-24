# Fibers and channels

A fiber is a lightweight task. `spawn (() => Work(x))` starts one and returns a
`Fiber<T>` (`use Concurrency.Fiber;`). `Join()` waits until it finishes and
returns `Result<T, FiberError>`.

Fibers exchange values through a `Channel<T>` (`use Concurrency.Channel;`):

- `Channel.Create<T>()` makes one;
- `Channel.Send<T>(channel, value)` puts a value in;
- `Channel.Receive<T>(channel)` waits for a value;
- `Channel.TryReceive<T>(channel)` takes a value if there is one, without waiting.

Values come out in the order they went in.
