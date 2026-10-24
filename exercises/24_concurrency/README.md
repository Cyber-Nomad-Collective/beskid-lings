# Concurrency: fan-out and fan-in

Start one fiber per job (fan-out), let every fiber send its result to one
channel, then collect the results (fan-in).

Fibers are cooperative: a new fiber runs only when the current one waits, for
example in `Join`, `Channel.Receive` or `Time.Sleep`. `Channel.TryReceive`
does not wait. So collect with `TryReceive` only after you `Join` every
worker; then every result is already in the channel.

For CPU-heavy work across cores, use isolates instead (`Parallel.Scope`,
`.Parallel()`), as in exercise 16.
