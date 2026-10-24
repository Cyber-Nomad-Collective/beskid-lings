# JSON

`use Core.Json;` gives:

- `Json.Parse(text)` - `Result<JsonValue, JsonError>`;
- `Json.Get(object, "key")` - `Option<JsonValue>`, because a key may be missing;
- `Json.AsText(value)`, `Json.AsNumber(value)`, `Json.AsBool(value)` -
  `Option`, because the value may have another type;
- `Json.EmptyObject()`, `Json.With(object, "key", value)`,
  `Json.EmptyList()`, `Json.Push(list, value)` - build JSON;
- `Json.Stringify(value)` - compact text; `Json.Pretty(value)` - indented.

A `JsonValue` is an enum: `Null`, `Bool`, `Number` (always `f64`), `Text`,
`List` and `Object`.
