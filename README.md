a mini [pandoc](https://pandoc.org/index.html) [luafilter](https://pandoc.org/lua-filters.html) that add [thin space](https://en.wikipedia.org/wiki/Thin_space) (narrow non-breaking space) after some punctuation `?!:;`, according to french typographic rules.

usage
=====

```bash
pandoc input-files.md -o out.pdf \
    --lua-filter pandoc-french-typography.lua
```
