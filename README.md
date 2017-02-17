# 交通大學碩博士論文 XeLaTeX 模板

[nctu-thesis](https://github.com/borting/nctu-thesis) template is developed based on XeLaTeX + xeCJK.

## 下載
  你可以 clone 這個 repos, 或是到[這裡](https://github.com/borting/nctu-thesis/tags)下載最新版本

## 快速上手
* Use command line

  ```
  $ make
  ```

* Change the xelatex option in IDE, then build main.tex

  ```
  xelatex -synctex=1 -shell-escape -interaction=nonstopmode %.tex
  ```
  * thesis.cls 會根據你目前使用的作業系統選擇要使用的中文字型, 請設定 -shell-escape 開啟這個功能.

    (這樣你和你的指導教授用不同作業系統寫論文時, 就不用每次重新設定中文字型啦)

## 說明
   進階的使用教學請參考 [README.pdf](https://github.com/borting/nctu-thesis/blob/master/README.pdf)

## Tested Environment
* Windows
  * Windows 7 + MikTeX 2.9.6069
* Linux
  * Ubuntu 14.04.1 + TeX Live 2013/Debian
* Mac OS X
  * Mac OS 10.9 + MacTeX 2016

## Known Issues
* 在編譯完英文版後, (在未清空編譯中繼檔的情況下)第一次執行 XeLaTeX 編譯中文版會出錯, 但是只要再跑一次 XeLaTeX 就可以了.

## Acknowledgement
   此模板的前身是實驗室 Watil 與 CE 兩位學長姐留下的 NCTU thesis template.

   在撰寫此模板時, 我也參考了以下幾位的模板. Thank you.
* 台科大 hdj 與 saiba 兩位學長的 [ntust-thesis template](https://code.google.com/archive/p/ntust-thesis/downloads)
* 交大 Po-hao Huang 同學的 [nctu-thesis template](https://github.com/Po-haoHuang/nctu-thesis)
* 台大 [qcl](https://github.com/qcl/qcl-master-thesis) 與 [tzhuan](https://github.com/tzhuan/ntu-thesis) 兩位同學的 ntu-thesis template

## License
   此模板係採用[創用 CC 姓名標示-非商業性-相同方式分享 3.0 台灣 授權條款](https://creativecommons.org/licenses/by-nc-sa/3.0/tw/legalcode)授權.
