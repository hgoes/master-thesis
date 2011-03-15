SOURCES=gals.tex language.tex translation-c.tex translation-scade.tex ltl-translation.tex\
        error-refinement.tex translation-correctness.tex implementation.tex bdd.tex

BDDS=top.pdf bot.pdf con.pdf example1.pdf example2.pdf example3.pdf example4.pdf

thesis.pdf: thesis.tex $(SOURCES) lit.bib $(BDDS)
	pdflatex thesis.tex
	bibtex thesis.aux
	pdflatex thesis.tex > /dev/null
	pdflatex thesis.tex > /dev/null

$(BDDS): %.pdf: %.dot
	dot -Tpdf $< -o $@

clean:
	rm -f $(BDDS)
	rm -f thesis.aux thesis.out thesis.log thesis.blg thesis.bbl missfont.log