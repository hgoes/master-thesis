SOURCES=gals.tex language.tex translation-c.tex translation-scade.tex ltl-translation.tex\
        error-refinement.tex translation-correctness.tex implementation.tex bdd.tex spin.tex

BDDS=top.pdf bot.pdf con.pdf example1.pdf example2.pdf example3.pdf example4.pdf\
     example_set1.pdf plus1_lhs.pdf plus1_rhs.pdf plus1_res.pdf plus2_res.pdf plus3_rhs.pdf\
     plus3_res.pdf

thesis.pdf: thesis.tex $(SOURCES) lit.bib $(BDDS)
	pdflatex thesis.tex
	bibtex thesis.aux
	pdflatex thesis.tex > /dev/null
	pdflatex thesis.tex > /dev/null

$(BDDS): %.pdf: %.dot
	dot -Tsvg $< -o $*.svg
	inkscape -z -f $*.svg -A $@
	pdfcrop $@ $@

clean:
	rm -f $(BDDS)
	rm -f thesis.aux thesis.out thesis.log thesis.blg thesis.bbl missfont.log