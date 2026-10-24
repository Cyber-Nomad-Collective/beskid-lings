# Strings

A `string` literal can contain `${expression}`; the value of the expression is
written into the text: `"Hello, ${name}"`. `+` joins two strings.

`use Core.String;` gives helpers that take the string as their first argument:

- `String.Len(text)` - length in bytes, as `i64`;
- `String.Trim(text)` - the text without spaces at either end;
- `String.Contains(text, part)` - whether `part` occurs in `text`.

Text without `${...}` is printed as it is, so `"Hello, name"` prints the word
"name", not its value.
