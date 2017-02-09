# LaTeX template for NCTU thesis

This thesis is built based on XeTeX + xeCJK, please use xelatex instead of pdftex.

## Execution
* Use Makefile
  ```
  $ make [TARGET=main.tex]
  ```
* Change the xelatex option in IDE
  ```
  xelatex -synctex=1 -shell-escape -interaction=nonstopmode %.tex
  ```

## Tested Environment
* Windows
  * Windows 7 + MikTeX 2.9.6069
* Linux
  * Ubuntu 14.04.1 + TeX 3.1415926 (TeX Live 2013/Debian)
* Mac OS X
  * Mac OS 10.9 + TeX Live
