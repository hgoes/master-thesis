thesis.pdf: thesis.tex gals.tex language.tex
	pdflatex thesis.tex
	pdflatex thesis.tex > /dev/null