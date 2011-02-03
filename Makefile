thesis.pdf: thesis.tex gals.tex
	pdflatex thesis.tex
	pdflatex thesis.tex > /dev/null