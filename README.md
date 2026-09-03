# lecturenotes - LaTeX Class for Lecture Notes

Desiment's class for lecture notes.

## Usage

```latex
\documentclass{lecturenotes}
```

## Requirements

- LuaLaTeX.
- Shell escape for examples that use `minted` and memoization.
- Biber and MakeIndex for the reference and index example.
- Local dependencies under `.dependencies/`: `flsuite`, `tssuite`, `xamsmath`, and `refsuite`.

## Examples

Build examples from `examples/`:

```sh
latexmk example.tex
```

The example writes auxiliary files to `examples/.build/` and keeps the final PDF in `examples/`.

## Repository Layout

- `lecturenotes.cls` is the public class entrypoint.
- `code/lecturenotes.*.tex` contains localization, layout, theorem, math, and reference setup.
- `examples/` contains runnable documentation covering references, bibliographies, indexes, theorem lists, and listings.
- `.dependencies/` contains local package dependencies used by the example build.
- `RULES.md` documents repository conventions for future changes.
