a mini [pandoc](https://pandoc.org/index.html) [lua filter](https://pandoc.org/lua-filters.html) that add [thin space](https://en.wikipedia.org/wiki/Thin_space) (narrow non-breaking space) after some punctuations (`?!:;`), according to french typographic rules.

- there is no __magic__ at all. it only add thin spaces in `Inline` elements (not in code block, for instance), and if there is already a space, it still add a thin space.
- it does nothing for quotes, because lua filter for quotes already exists.
- yet only tested for PDF produced with typst

usage
=====

```bash
pandoc input-files.md -o out.pdf \
    --lua-filter pandoc-french-typography.lua
```
