# beskid-lings

Small broken Beskid programs. Fix each one until it compiles and its tests
pass. Inspired by rustlings.

## Requirements

- Beskid 0.6.6 or later on `PATH` (`beskid --version`).

## Start

From this folder:

```
beskid -q run --project Runner
```

The runner checks the exercises in order, shows what is wrong with the
current one, and checks it again each time you save. Each exercise is a Beskid
project under `exercises/`. Open its `Src/Main.bd`, read the comments, and fix
the line marked `TODO`.

While it runs, type a letter and press Enter:

| Key | Action |
| --- | --- |
| `h` | hint for the current exercise |
| `l` | every exercise and its status |
| `r` | check the current exercise again |
| `q` | quit; progress stays in `.lings-state` |

`-q` keeps beskid from printing every build step before the course output.

You can also check one exercise by hand:

```
beskid -q test --project exercises/01_intro/intro1
```

## Layout

- `lings.json` - the exercise order, hints and messages.
- `exercises/` - one Beskid project per exercise, grouped by topic.
- `solutions/` - reference answers. Try not to look.
- `Runner/` - the runner, written in Beskid. Watch mode uses fibers: one reads
  your keys, one watches the exercise file, one runs the session.
