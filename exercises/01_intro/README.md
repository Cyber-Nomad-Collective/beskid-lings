# Intro

A Beskid project is a folder with a `.bproj` manifest and a `Src/` folder.
Each exercise here has one target of kind `Test`; the runner checks it with
`beskid test`.

Further reading: the Beskid Book, <https://beskid-lang.org/book/>.

Tests use assertions such as `Testing.Assert.Equal(actual, expected)`. When
one fails, the runner shows what it expected and what it found. A third
argument adds an explanation: `Testing.Assert.Equal(Answer(), 42, "Answer()
should return 42")`.
