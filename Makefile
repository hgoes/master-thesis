SOURCES=gals.tex language.tex translation-c.tex translation-scade.tex ltl-translation.tex\
        error-refinement.tex translation-correctness.tex implementation.tex bdd.tex spin.tex\
        scade.tex motivation.tex ltl.tex buchi.tex translation-static-bdd.tex\
	translation-dynamic-bdd.tex sos.tex grammar.tex installation.tex sourcedoc.tex\
        structure.tex mealy.tex mealy2.tex mealy3.tex mealy4.tex case-studies.tex conclusion.tex

BDDS=top.pdf bot.pdf con.pdf example1.pdf example2.pdf example3.pdf example4.pdf\
     example_set1.pdf plus1_lhs.pdf plus1_rhs.pdf plus1_res.pdf plus2_res.pdf plus3_rhs.pdf\
     plus3_res.pdf async.pdf minus1_res.pdf minus2_res.pdf minus3_res.pdf

GENERATED=generated/*.tex generated/haddock.sty

thesis.pdf: thesis.tex $(SOURCES) lit.bib $(BDDS) $(GENERATED) iti.pdf
	pdflatex thesis.tex
	bibtex thesis.aux
	pdflatex thesis.tex > /dev/null
	pdflatex thesis.tex > /dev/null

$(BDDS): %.pdf: %.dot
	dot -Tsvg $< -o $*.svg
	inkscape -z -f $*.svg -A $@
	pdfcrop $@ $@

iti.pdf: iti.svg
	inkscape -z -f iti.svg -A iti.pdf

overview.pdf: overview.tex grammar.tex
	pdflatex overview.tex

clean:
	rm -f $(BDDS)
	rm -f thesis.aux thesis.out thesis.log thesis.blg thesis.bbl missfont.log