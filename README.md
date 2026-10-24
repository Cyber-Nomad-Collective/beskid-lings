# beskid-lings

Small broken Beskid programs. Fix each one until it compiles and its tests
pass. Inspired by rustlings.

## Requirements

- Beskid 0.6.6 or later on `PATH` (`beskid --version`).

## Start

```
beskid -q run --project Runner
```

The runner checks the exercises in order and tells you which one to fix next.
Each exercise is a Beskid project under `exercises/`. Open its `Src/Main.bd`,
read the comments, and fix the line marked `TODO`.

You can also check one exercise by hand:

```
beskid -q test --project exercises/01_intro/intro1
```

## Layout

- `lings.json` - the exercise order, hints and messages.
- `exercises/` - one Beskid project per exercise, grouped by topic.
- `solutions/` - reference answers. Try not to look.
- `Runner/` - the runner, written in Beskid.
