# Find all week*.tex files and generate corresponding PDF targets
WEEKS = $(patsubst %.tex,%.pdf,$(wildcard week*.tex))

all: $(WEEKS)

week%.pdf: week%.aux week%.tex
	pdflatex -shell-escape week$*

week%.aux: week%.tex
	pdflatex -shell-escape week$*

.PHONY: clean

clean:
	@rm -f *.out *.aux *.log *.bbl *.blg *.nav *.snm *.toc *.vrb *~ *.synctex.gz *.pyg
	@rm -rf _minted-*
