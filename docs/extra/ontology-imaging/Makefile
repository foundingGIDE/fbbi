all: presentation clean


# Graphic files

PNGS = svgs/ccbysa.png svgs/gerbi-logo.png

INKSCAPE = inkscape

.PRECIOUS: $(PNGS)

%.png: %.svg
	$(INKSCAPE) --export-type=png --export-filename=$@ $<


# Presentation

presentation: screen.pdf handout.pdf notes.pdf

PRESENTATION_SOURCES = presentation.tex revision.tex

%.pdf: %.tex $(PRESENTATION_SOURCES) $(PNGS)
	latexmk -lualatex $*


# Helper targets

revision.tex:
	git show -s --format='%aD %H' > revision.tex

.PHONY: clean mrproper
clean:
	rm -f {screen,handout,notes}.{aux,bbl,bcf,blg,fdb_latexmk,fls,log,nav,out,run.xml,snm,toc,vrb}

mrproper: clean
	rm -f {screen,handout,notes}.pdf revision.tex
