TARGET=main
LATEX_BUILD_CMD=xelatex -synctex=1 -shell-escape -interaction=nonstopmode

default: build

build:
	$(LATEX_BUILD_CMD) $(TARGET).tex
	bibtex main.aux || true
	$(LATEX_BUILD_CMD) $(TARGET).tex
	$(LATEX_BUILD_CMD) $(TARGET).tex | grep 'Warning\|pages'
clean:
	rm -rf *.aux *.log *.gz *.bbl *.blg *.lof *.lot *.toc *.out
