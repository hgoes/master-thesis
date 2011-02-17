SOURCES=gals.tex language.tex translation-c.tex translation-scade.tex ltl-translation.tex error-refinement.tex

thesis.pdf: thesis.tex ${SOURCES} lit.bib
	pdflatex thesis.tex
	bibtex thesis.aux
	pdflatex thesis.tex > /dev/null
	pdflatex thesis.tex > /dev/null