HOST	=	nalab.mind.meiji.ac.jp
DIR	=	labo/text
DEST	=	$(HOST):Sites/$(DIR)
PUSH	=	bin/pushtosakura
FILES	=	heat-fdm-0.dvi heat-fdm-0.pdf
#FILES	=	heat-fdm-0.dvi heat-fdm-0.pdf heat-fdm-0.ps.gz

default: all
all: $(PROGS) $(FILES)

heat-fdm-0.dvi: heat-fdm-0.tex eps/*.eps reference.bib
	uplatex heat-fdm-0.tex
	upbibtex heat-fdm-0
	uplatex heat-fdm-0.tex
	uplatex heat-fdm-0.tex

heat-fdm-0.pdf: heat-fdm-0.dvi
	dvipdfmx -d 5 -O 2 heat-fdm-0.dvi

heat-fdm-0.ps.gz: heat-fdm-0.dvi
	dvips -f heat-fdm-0.dvi | gzip -9 > $@

#copy0: $(FILES)
copy: $(FILES)
	scp -p $(FILES) $(DEST)
	ssh $(HOST) $(PUSH) $(DIR)

heat-fdm-0/index.html: heat-fdm-0.tex eps/*.eps
	latex2html heat-fdm-0.tex

#copy: $(FILES) heat-fdm-0/index.html
copyall: $(FILES) heat-fdm-0/index.html
	scp -pr $(FILES) heat-fdm-0 $(DEST)

clean:
	rm -f $(FILES)
