

#PDFS = $(CV).pdf Bethel-Bio.pdf $(CV2).pdf $(CP).pdf $(CV-nb).pdf $(RESUME).pdf
#PDFS = $(CV).pdf  
THESIS = thesis
PDFS = $(THESIS).pdf  

PDFLATEX_CMD = pdflatex
BIBTEX_CMD = biber

all: $(PDFS)

LATEX_FILES = thesis.tex abstract.tex appendix.tex introduction.tex preface.tex chap1.tex chap2.tex chap3.tex chap4.tex
BIB_FILES = references.bib

$(THESIS).pdf: $(LATEX_FILES) $(BIB_FILES)
	#echo $(basename $@)
	$(PDFLATEX_CMD) $(basename $@)
	$(BIBTEX_CMD) $(basename $@)
	$(PDFLATEX_CMD) $(basename $@)
	$(PDFLATEX_CMD) $(basename $@)

clean:
	if (rm $(PDFS) *.lof *.lot *.toc *.run.xml *.bcf *.aux *.bbl *.blg *.log *.bak *# *~ *.out) then :; fi 
