# Serialization

`[Serialize]` on a type or enum makes the compiler generate its encoder and
decoder. The generated code is checked like your own, so a field type that
cannot be serialized is a compile error, not a runtime surprise.

Writing goes through a shape registry, which records the shapes involved:

```
Registry.ShapeRegistry table = Registry.Create();
Registry.RegisterCompiled<Point>(table, 1048576_i64, 8388608_i64, 100000_i64);
Serialization.WriteTyped<Point>(value, Descriptors.CompiledShape<Point>().id, table, Limits.DefaultLimits());
```

Reading needs only the target type: `Serialization.Read<Point>(text, Limits.DefaultLimits())`.
The text format is BSOL, Beskid's structured data format. The numbers in
`RegisterCompiled` are size limits for the output.
