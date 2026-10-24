# beskid-lings

Small broken Beskid programs. Fix each one until it compiles and its tests
pass. Inspired by rustlings.

## Requirements

- Beskid 0.6.6 or later on `PATH` (`beskid --version`).

## Start

From this folder:

```
./lings
```

The runner starts in watch mode. It checks the exercises in order, shows what
is wrong with the current one, and checks it again each time you save. Each
exercise is a Beskid project under `exercises/`. Open its `Src/Main.bd`, read
the comments, and fix the line marked `TODO`. Press Ctrl+C to stop; your
progress is kept in `.lings-state`.

Other commands, in a second terminal:

```
./lings hint     # hint for the current exercise
./lings list     # every exercise and its status
./lings verify   # check everything from the start
```

`./lings` is a short script for `beskid -q run --project Runner -- <command>`.
Without `-q`, beskid prints every build step before the course output.

You can also check one exercise by hand:

```
beskid -q test --project exercises/01_intro/intro1
```

## Layout

- `lings.json` - the exercise order, hints and messages.
- `exercises/` - one Beskid project per exercise, grouped by topic.
- `solutions/` - reference answers. Try not to look.
- `Runner/` - the runner, written in Beskid.
