FILES=title.md acknowledgements.md trademarks.md intro.md chapter-01.md chapter-02.md chapter-03.md chapter-04.md chapter-05.md chapter-06.md chapter-07.md chapter-08.md chapter-09.md chapter-10.md chapter-11.md chapter-12.md chapter-13.md chapter-14.md chapter-15.md chapter-16.md listings.md appendix-a.md appendix-b.md about-this-version.md

.PHONY: html epub

all: html epub mobi

html:
	rm -rf out/html && mkdir -p out/html
	cp html/book.css out/html/
	cd src && pandoc -S --to html5 -o ../out/html/zen-of-asm.html --section-divs --toc --toc-depth=2 --standalone --template=../html/template.html --ascii $(FILES)

epub:
	mkdir -p out
	rm -f out/zen-of-asm.epub
	cd src && pandoc -S --to epub3 -o ../out/zen-of-asm.epub --epub-cover-image ../images/cover.png --toc --toc-depth=2 --epub-chapter-level=2 --data-dir=epub --template=../epub/template.html $(FILES)

mobi:
	rm -f out/zen-of-asm.mobi
	kindlegen out/zen-of-asm.epub -c2
