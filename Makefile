#################################################################
# Makefile (use GNU-Make)
# ---------------------------------------------------------------
# ---------------------------------------------------------------
# $* file name part of the current dependent with suffix deleted
#    (only for suffix rules)
# $@ full target name
# $< out-of-date module (only for suffix rules)
# $? list of components to be rebuilt
#
#################################################################

.DEFAULT:
	  @echo "This target needs remaking: default = [$<]"
	  @echo "Do you really use GNU-Make?"

MAINFILE       := thesis
TITLEPAGE      := titelseite
TEXSOURCES     := $(wildcard *.tex)
BIBSRCFILES    := $(wildcard *.bib) 
BBLFILES       := $(subst bib,bbl,$(BIBSRCFILES))
AUXFILES       := $(subst tex,aux,$(TEXSOURCES))

$(MAINFILE).dvi: $(MAINFILE).tex  \
		 wissdoc.cls $(TEXSOURCES) $(BBLFILES)
	   - makeindex -g -s thesis.ist thesis.idx
	   - latex $(MAINFILE)


$(BBLFILES): %.bbl: %.bib
	- latex $(MAINFILE)
	bibtex $(MAINFILE)

double: $(MAINFILE).tex
	 - latex $(MAINFILE)
	 - latex $(MAINFILE)

complete: $(MAINFILE).dvi
	 - latex $(MAINFILE)
	 - latex $(MAINFILE)

index: $(MAINFILE).ind

#makeindex kann keine 8-bit Umlaute richtig sortieren! :-(
#deswegen setzen wir sie für makeindex einfach nochmal um
$(MAINFILE).ind: $(MAINFILE).idx $(MAINFILE).ist
	- mv $(MAINFILE).idx $(MAINFILE).idx.orig
	- $(SCRIPTDIR)/recodetexumlaut <$(MAINFILE).idx.orig >$(MAINFILE).idx
	- makeindex -g -s $(MAINFILE).ist $(MAINFILE)
	- mv $(MAINFILE).idx.orig $(MAINFILE).idx


finalpdf: pdf
	- thumbpdf $(MAINFILE)
	- pdflatex $(MAINFILE)

pdf: 
	- pdflatex $(MAINFILE)

$(MAINFILE).pdf: $(MAINFILE).tex $(TEXSOURCES)
	- rm $(MAINFILE).aux $(MAINFILE).ind
	- pdflatex $(MAINFILE)
	- make bbls
	- pdflatex $(MAINFILE)
	- $(MAKE) index
	- pdflatex $(MAINFILE)


bbls: $(BBLFILES)

rmbbls:
	- rm $(BBLFILES)

clean:
	- find . | egrep ".*((\.(aux|idx|ind|ilg|log|blg|bbl|toc|lof|lot|dvi|tlf|tlt))|~)$$" | xargs rm
	- rm $(MAINFILE).out thumb???.png thumbdta.tex thumbpdf.*

#end of Makefile
