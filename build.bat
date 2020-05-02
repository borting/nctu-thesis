set sTARGET=main
set LATEX_BUILD_CMD=xelatex "-synctex=1 -shell-escape -interaction=nonstopmode -file-line-error -output-driver='xdvipdfmx -z0 -pdf"

%LATEX_BUILD_CMD% %sTARGET%.tex
bibtex main.aux || true
%LATEX_BUILD_CMD% %sTARGET%.tex
%LATEX_BUILD_CMD% %sTARGET%.tex
