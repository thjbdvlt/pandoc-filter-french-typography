all:
	pandoc -i test.md -o test.pdf \
		-L pandoc-french-typography.lua \
		-L ~/uni/pandoc/quotes.lua \
		--pdf-engine=typst
	zathura test.pdf 1>/dev/null 2>/dev/null &
