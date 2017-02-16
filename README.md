# LaTeX template for NCTU thesis

This thesis is built based on XeLaTeX + xeCJK, please use xelatex instead of pdftex.

## Execution
* Use command line

  ```
  $ make
  ```
* Change the xelatex option in IDE

  ```
  xelatex -synctex=1 -shell-escape -interaction=nonstopmode %.tex
  ```
  * thesis.cls 會根據目前你的作業系統環境選擇要使用的中文字型, 請設定 -shell-escape 開啟這個功能.
    (這樣你和你的指導教授用不同作業系統寫論文時, 就不用每次重新設定中文字型啦)

## 說明
   請參考 [README.pdf](https://github.com/borting/nctu-thesis/blob/master/README.md)

## Tested Environment
* Windows
  * Windows 7 + MikTeX 2.9.6069
* Linux
  * Ubuntu 14.04.1 + TeX Live 2013/Debian
* Mac OS X
  * Mac OS 10.9 + MacTeX 2016
