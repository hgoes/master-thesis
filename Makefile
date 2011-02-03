SOURCES=gals.tex language.tex translation-c.tex

thesis.pdf: thesis.tex ${SOURCES}
	pdflatex thesis.tex
	pdflatex thesis.tex > /dev/null