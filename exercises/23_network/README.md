# Networking with fibers

`Network.Tcp` has `TcpListener` and `TcpStream`; both return `Result` with a
`NetworkError`.

- `TcpListener.Bind(address, backlog)` - listen; port 0 means "any free port".
- `listener.LocalAddress()` - the address and port actually used.
- `listener.Accept(deadline)` - wait for one client.
- `TcpStream.Connect(address, options, deadline)` - connect to a server.
- `IO.WriteAll(stream, bytes, offset, count)` and
  `IO.ReadExact(stream, bytes, offset, count)` - send and receive bytes.

A server and its client in one program run in different fibers: `Accept`
waits, and while it waits the scheduler runs the client. Network waits must
happen inside a spawned fiber, so the test starts the whole scenario with
`spawn` and `Join`s it.
