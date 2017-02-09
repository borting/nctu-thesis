\ProvidesClass{thesis}[2017/02/09 V1.2 by Borting Chen]
\NeedsTeXFormat{LaTeX2e}

%TODO
% 檢查 twoside 時的版面配置
% \cleardoublepage 後的空白頁不顯示 watermark
% Mac OS X 字型問題
% 自動選擇是否引入 著作權授權書 (authorization) 和 審定書 (approval) 的 pdf 檔
% Table of Contents 的排版問題
% 缺 Notation(Symbol?) page

%-------------------------------------------------------------------------------
% Document Options Declaration
%-------------------------------------------------------------------------------

% Inherent existing options from book document class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}

% Declare options for thesis types: (default: master)
%   thesis(master) or dissertation(phd)
\newif\ifTHESISOPTIONmaster         \THESISOPTIONmastertrue
\newif\ifTHESISOPTIONphd            \THESISOPTIONphdfalse

\DeclareOption{master}{\THESISOPTIONmastertrue\THESISOPTIONphdfalse}
\DeclareOption{phd}{\THESISOPTIONmasterfalse\THESISOPTIONphdtrue}

% Declare options for the language used in thesis: (default: english)
%   en(english) or zh(chinese)
\newif\ifTHESISOPTIONen             \THESISOPTIONentrue
\newif\ifTHESISOPTIONzh             \THESISOPTIONzhfalse

\DeclareOption{en}{\THESISOPTIONentrue\THESISOPTIONzhfalse}
\DeclareOption{zh}{\THESISOPTIONenfalse\THESISOPTIONzhtrue}

% Declare options for print modes: (default: draft)
%   review: for thesis writing (hide all front matters)
%   draft : draft for defence
%   final : print version
\newif\ifTHESISOPTIONreview         \THESISOPTIONreviewfalse
\newif\ifTHESISOPTIONdraft          \THESISOPTIONdrafttrue
\newif\ifTHESISOPTIONfinal          \THESISOPTIONfinalfalse

\DeclareOption{review}{\THESISOPTIONreviewtrue
                      \THESISOPTIONdraftfalse
                      \THESISOPTIONfinalfalse}

\DeclareOption{draft}{\THESISOPTIONreviewfalse
                      \THESISOPTIONdrafttrue
                      \THESISOPTIONfinalfalse}

\DeclareOption{final}{\THESISOPTIONreviewfalse
                      \THESISOPTIONdraftfalse
                      \THESISOPTIONfinaltrue}

% Declare watermark option: (default: disabled)
%   depending on the mode of thesis format:
%     review: never shown
%     draft : print "DRAFT" in the background
%     final : print the watermark specified by \watermark{}
\newif\ifTHESISOPTIONwatermark      \THESISOPTIONwatermarkfalse
\DeclareOption{watermark}{\THESISOPTIONwatermarktrue}

% Load basic options
\ProcessOptions
\LoadClass[a4paper,12pt,oneside]{book}

%-------------------------------------------------------------------------------
% Basic Packages
%-------------------------------------------------------------------------------

\usepackage[BoldFont, SlantFont, CJKchecksingle, CJKmath=true]{xeCJK}
                          % for Chinese typing
\usepackage{fontspec}     % for font selection
\usepackage{ifplatform}   % determine tex is running on which platform/OS
\usepackage{indentfirst}  % indention (Windows need this package)
\usepackage{setspace}     % for \doublespacing & \begin{spacing}
\usepackage{tikz}         % for watermark position configuration
\usepackage{eso-pic}      % for watermark
\usepackage[xetex, hidelinks]{hyperref}  % for index
\usepackage{geometry}     % page margin setting
\usepackage{emptypage}    % clear page number in empty even pages
\usepackage{afterpage}    % adding blank page after cover & title page (twoside)
\usepackage{lipsum}       % generating text for testing
\usepackage{verbatim}     % for \comment command
\usepackage[retainorgcmds]{IEEEtrantools}  % for \bstctlcite
\usepackage{xCJKnumb}     % coverting arabic number to chinese number
\usepackage{titlesec}     % formating titles of sectioning
\usepackage{titletoc}     % formating titles in toc
\usepackage[subfigure]{tocloft}  % centering toc, lof, and lot

%-------------------------------------------------------------------------------
% Page Format
%-------------------------------------------------------------------------------

% Page margin
\ifTHESISOPTIONfinal  % only valid in final mode
  \geometry{left=3 cm, right=2 cm, top=2.5 cm, bottom=2.5 cm}
\else
  \geometry{left=2.5 cm, right=2.5 cm, top=2.5 cm, bottom=2.5 cm}
\fi

% Position of page number
\pagestyle{plain}
\setlength{\footskip}{1.5cm}

% Double spacing
\doublespacing

%-------------------------------------------------------------------------------
% English Font Setting
%-------------------------------------------------------------------------------

% Set English font in order to be consistent with Windows default font settings
\setmainfont[Ligatures=TeX]{Times New Roman}
\setsansfont[Ligatures=TeX]{Arial}
\setmonofont[Ligatures=TeX]{Courier New}

%-------------------------------------------------------------------------------
% Chinese Font Setting
%-------------------------------------------------------------------------------

% Linux
\iflinux
\setCJKmainfont{AR PL UKai TW}           % AR PL UKai TW (AR PL 中楷)
                                         % AR PL UMing TW (AR PL 明體)
\setCJKsansfont{WenQuanYi Zen Hei}       % WenQuanYi Zen Hei (文泉驛正黑)
                                         % WenQuanYi Micro Hei (文泉驛微米黑)
\setCJKmonofont{WenQuanYi Zen Hei Mono}  % WenQuanYi Zen Hei Mono (文泉驛等寬正黑)
                                         % WenQuanYi Micro Hei Mono (文泉驛等寬微米黑)
\newCJKfontfamily{\Ming}{AR PL UMing TW} % 設定切換明體字型
\fi

% Windows
\ifwindows
\setCJKmainfont{DFKai-SB}            % DFKai-SB (標楷體)
                                     % PMingLiU (新細明體)
\setCJKsansfont{Microsoft JhengHei}  % Microsoft JhengHei (微軟正黑體)
                                     % Microsoft YaHei (微軟雅黑)
\newCJKfontfamily{\Ming}{PMingLiU}   % 設定切換明體字型
\fi

% Mac OS X
\ifmacosx
\setCJKmainfont{LiSong Pro}  % LiSong Pro (儷宋 Pro)
                             % Apple LiSung (蘋果儷細宋)
\setCJKsansfont{Heiti TC}    % Heiti TC (黑體-繁 中黑)
                             % LiHei Pro (儷黑 Pro)
\fi

% Enable line break for chinese
\XeTeXlinebreaklocale "zh"
\XeTeXlinebreakskip = 0pt plus 1pt

%-------------------------------------------------------------------------------
% Macros for Front Pages
%-------------------------------------------------------------------------------

% Chinese title of the thesis/dissertation
\def\titlezh#1{\gdef\@titlezh{#1}}

% The year and month the completed thesis is submitted in English
\def\degreeyear#1{\gdef\@degreeyear{#1}}
\def\degreemonth#1{\gdef\@degreemonth{#1}}

% The year and month the completed thesis is submitted in Chinese
\def\degreeyearzh#1{\gdef\@degreeyearzh{#1}}

% The full (unabbreviated) name of the degree
\def\degree#1{\gdef\@degree{#1}}

% The name of your degree's field (e.g. Psychology, Computer Science)
\def\field#1{\gdef\@field{#1}}

% The type of thesis in English
\def\thesistype#1{\gdef\@thesistype{#1}}

% The type of thesis in Chinese
\def\thesistypezh#1{\gdef\@thesistypezh{#1}}

% The name of the institute in English
\def\institute#1{\gdef\@institute{#1}}

% The name of the institute in Chinese
\def\institutezh#1{\gdef\@institutezh{#1}}

% The name of college in English
\def\college#1{\gdef\@college{#1}}

% The name of university in English
\def\university#1{\gdef\@university{#1}}

% The name of university in Chinese
\def\universityzh#1{\gdef\@universityzh{#1}}

% The location of university
\def\location#1{\gdef\@location{#1}}

% The name of advisor in English
\def\advisor#1{\gdef\@advisor{#1}}

% The name of advisor in Chinese
\def\advisorzh#1{\gdef\@advisorzh{#1}}

% The name of the author in Chinese
\def\authorzh#1{\gdef\@authorzh{#1}}

% The path to watermark
\def\watermark#1{\gdef\@watermark{#1}}

% "Draft"
\def\draft#1{\gdef\@draft{#1}}

% "初稿"
\def\draftzh#1{\gdef\@draftzh{#1}}

% Title of Chinese abstract
\def\abszhtitle#1{\gdef\@abszhtitle{#1}}

% Title of English abstract
\def\absentitle#1{\gdef\@absentitle{#1}}

% Title of Acknowledgement
\def\acktitle#1{\gdef\@acktitle{#1}}

% Title of Table of Contents
\def\toctitle#1{\gdef\@toctitle{#1}}

% Title of List of Figures
\def\loftitle#1{\gdef\@loftitle{#1}}

% Title of List of Tables
\def\lottitle#1{\gdef\@lottitle{#1}}

% Title of List of Bibliography
\def\bibtitle#1{\gdef\@bibtitle{#1}}

% Title of Curriculum Vitae
\def\cvtitle#1{\gdef\@cvtitle{#1}}

% Title of List of Publications
\def\loptitle#1{\gdef\@loptitle{#1}}

%-------------------------------------------------------------------------------
% Default Values for Macros
%-------------------------------------------------------------------------------

% Define macros related to degree
\ifTHESISOPTIONmaster  % Master thesis
  \thesistype{Thesis}
  \thesistypezh{碩士論文}
  \degree{Master}
\else                  % PhD dissertation 
  \thesistype{Dissertation}
  \thesistypezh{博士論文}
  \degree{Doctor of Philosophy}
\fi

% Define macros related to print mode
\ifTHESISOPTIONdraft
  \draft{ Draft}
  \draftzh{初稿}
\else
  \draft{}
  \draftzh{}
\fi

% Define language-related macros
\ifTHESISOPTIONzh
  \abszhtitle{中文摘要}
  \absentitle{英文摘要}
  \acktitle{誌謝}
  \toctitle{目錄}
  \loftitle{圖目錄}
  \lottitle{表目錄}
  \bibtitle{參考文獻}
  \cvtitle{自傳}
  \loptitle{著作目錄}
\else
  \abszhtitle{摘要}
  \absentitle{Abstract}
  \acktitle{Acknowledgement}
  \toctitle{Table of Contents}
  \loftitle{List of Figures}
  \lottitle{List of Tables}
  \bibtitle{Bibliography}
  \cvtitle{Curriculum Vitae}
  \loptitle{List of Publications}
\fi

%-------------------------------------------------------------------------------
% ToC, LoF, and LoT Format
%-------------------------------------------------------------------------------

% Place the titles of ToC, LoF, and LoT to center
\renewcommand{\cfttoctitlefont}{\hspace*{\fill}\Huge\bfseries}
\renewcommand{\cftaftertoctitle}{\hspace*{\fill}}
\renewcommand{\cftlottitlefont}{\hspace*{\fill}\Huge\bfseries}
\renewcommand{\cftafterlottitle}{\hspace*{\fill}}
\renewcommand{\cftloftitlefont}{\hfill \Huge\bfseries}
\renewcommand{\cftafterloftitle}{\hspace*{\fill}}

% Set the language used in ToC, LoF, and LoT
\ifTHESISOPTIONzh
\renewcommand{\contentsname}{\textbf{\@toctitle}}
\renewcommand{\listfigurename}{\textbf{\@loftitle}}
\renewcommand{\listtablename}{\textbf{\@lottitle}}
\renewcommand{\tablename}{表}
\renewcommand{\figurename}{圖}
\renewcommand{\bibname}{參考文獻}
\fi

% Set the chapter numbering to chiese number in ToC
\ifTHESISOPTIONzh
  \titlecontents{chapter}[0pt]  % <left>
  {}  % <above>
  {\bfseries\xCJKnumber{\thecontentslabel}、\hspace{0.5em}}  % <above-code>
  {}  % <numbered-entry-format>
  {\cftdotfill{\cftdotsep}\contentspage}  % <filler-page-format>
\else
  \titlecontents{chapter}[0pt]  % <left>
  {}  % <above>
  {\bfseries\makebox[1em][l]{\thecontentslabel}\hspace{0.25em}}  % <above-code>
  {}  % <numbered-entry-format>
  {\cftdotfill{\cftdotsep}\contentspage}  % <filler-page-format>
\fi

% Adjust the position of the title of ToC, LoF, and LoT
\renewcommand\cftbeforetoctitleskip{-0.5cm}
\renewcommand\cftbeforeloftitleskip{-0.5cm}
\renewcommand\cftbeforelottitleskip{-0.5cm}

% Define \maketocs to generate toc, lof, and lot
% Set page numbering to 'arabic'
\def\maketocs{
\ifTHESISOPTIONreview\else
% Table of Contents
  \cleardoublepage
  \phantomsection
  \addcontentsline{toc}{chapter}{\textbf{\@toctitle}}
  \tableofcontents
  \AddToShipoutPictureBG{\BackgroundPicture}
% List of Figures
  \cleardoublepage
  \phantomsection
  \addcontentsline{toc}{chapter}{\textbf{\@loftitle}}
  \listoffigures
% List of Tables
  \cleardoublepage
  \phantomsection
  \addcontentsline{toc}{chapter}{\textbf{\@lottitle}}
  \listoftables
\fi

% Set page numbering to 'arabic' (1, 2, 3, ...)
\mainmatter
}

%-------------------------------------------------------------------------------
% Chapter Format
%-------------------------------------------------------------------------------

% Set the title format for chapter
\ifTHESISOPTIONzh
  \titleformat{\chapter}
  [block]  % shape (label and title body are placed at the same line)
  {\centering\Huge\bfseries}  % format for label and title body
  {\xCJKnumber{\thechapter}、\hspace{0.5em}}  % (X、 ...)
  {0em}  % code preceding the title body
  {}  % code following the title body
\else
  \titleformat{\chapter}
  [display]  % shape (title body is placed at second line)
  {\centering\Huge\bfseries}  % format for label and title body
  {\chaptertitlename\ \thechapter}  % label (Chapter X)
  {0em}  % code preceding the title body
  {}  % code following the title body
\fi

% Set the spacing between chapter title with page top and text body
\titlespacing*{\chapter}
{0em}    % left
{-40pt}  % before seperation
{*6}     % aftet seperation

%-------------------------------------------------------------------------------
% Watermark
%-------------------------------------------------------------------------------

\newcommand\BackgroundPicture{
\ifTHESISOPTIONwatermark
% for draft mode: print "DRAFT"
  \ifTHESISOPTIONdraft
    \setlength{\@tempdimb}{.5\paperwidth}%
    \setlength{\@tempdimc}{.5\paperheight}%
    \setlength{\unitlength}{1pt}%
    \put(\strip@pt\@tempdimb,\strip@pt\@tempdimc){%
    \makebox(0,0){\rotatebox{45}{\textcolor[gray]{0.75}%
      {\fontsize{6cm}{6cm}\selectfont{DRAFT}}}}%
    }%
  \fi
% for final mode: print the watermark specified by \watermark{}
  \ifTHESISOPTIONfinal
    \begin{tikzpicture}
      \node[minimum width=\paperwidth,minimum height=\paperheight,opacity=0.75]
        {\includegraphics[width=0.75\textwidth]{\@watermark}};
    \end{tikzpicture}
  \fi
\fi
}

%-------------------------------------------------------------------------------
% Commands
%-------------------------------------------------------------------------------

% Change margin of a period
%% \changemargin
\def\changemargin#1#2{\list{}{\rightmargin#2\leftmargin#1}\item[]}
%% \endchangemargin
\let\endchangemargin=\endlist 

% Covert 'A' to 1, 'B' to 2, ...
%TODO
%   This is a workaround to show '附錄一' in the chapter label but 'A.1' in the
% section label of an appendix, instead of showing '1.1' which conficts with the
% section label of a chapter. Hope someone can fix this in a smarter way.
\DeclareRobustCommand{\xCJKalphatozhnum}[1]{%
  \ifnum\strcmp{#1}{A} = 0 一 \else
  \ifnum\strcmp{#1}{B} = 0 二 \else
  \ifnum\strcmp{#1}{C} = 0 三 \else
  \ifnum\strcmp{#1}{D} = 0 四 \else
  \ifnum\strcmp{#1}{E} = 0 五 \else
  \ifnum\strcmp{#1}{F} = 0 六 \else
  \ifnum\strcmp{#1}{G} = 0 七 \else
  \ifnum\strcmp{#1}{H} = 0 八 \else
  \ifnum\strcmp{#1}{I} = 0 九 \else
  \ifnum\strcmp{#1}{J} = 0 十 \else
  \ifnum\strcmp{#1}{K} = 0 十一 \else
  \ifnum\strcmp{#1}{L} = 0 十二 \else
  \ifnum\strcmp{#1}{M} = 0 十三 \else
  \ifnum\strcmp{#1}{N} = 0 十四 \else
  \ifnum\strcmp{#1}{O} = 0 十五 \else
  \ifnum\strcmp{#1}{P} = 0 十六 \else
  \ifnum\strcmp{#1}{Q} = 0 十七 \else
  \ifnum\strcmp{#1}{R} = 0 十八 \else
  \ifnum\strcmp{#1}{S} = 0 十九 \else
  \ifnum\strcmp{#1}{T} = 0 二十 \else 零
  \fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi
}

%-------------------------------------------------------------------------------
% Bibliography
%-------------------------------------------------------------------------------

% Add Bibliography to "Table of Contents"
\let\oldbibliography\bibliography
\renewcommand{\bibliography}[1]
{
  \cleardoublepage
  \phantomsection
  \addcontentsline{toc}{chapter}{\textbf{\@bibtitle}}
  \oldbibliography[#1]
}

%-------------------------------------------------------------------------------
% Appendix Format
%-------------------------------------------------------------------------------

% Format the style of appendicies in terms of the language option (en or zh)
\let\oldappendix\appendix
\renewcommand{\appendix}
{
% Start Appendix
\oldappendix

\ifTHESISOPTIONzh
  % Set appendix numbering to chiese style in ToC
  \titlecontents{chapter}[0pt]
  {}  % <left>
  {\bfseries 附錄\xCJKalphatozhnum{\thecontentslabel}\quad}  % <above-code>
  {}  % <numbered-entry-format>
  {\cftdotfill{\cftdotsep}\contentspage}  % <filler-page-format>

  % Set appendix title to chinese style
  \titleformat{\chapter}
  [block]  % shape (label and title body are placed at the same line)
  {\centering\Huge\bfseries}  % format for label and title body
  {附錄\xCJKalphatozhnum{\thechapter}\quad}  % (X、 ...)
  {0em}  % code preceding the title body
  {}  % code following the title body
\fi
}

%-------------------------------------------------------------------------------
% Cover Page
%-------------------------------------------------------------------------------

\def\coverpage
{
  \thispagestyle{empty}
  \begin{center}
    % univerity chinese name
    \fontsize{40}{40}{\Ming{\@universityzh}}\\
    \vspace{0.5in}
    % institute chinese name
    \fontsize{28}{28}{\textbf{\Ming{\@institutezh}}}\\
    \vspace{0.5in}
    % thesis type (\Huge font size)
    \fontsize{24}{24}
    \centerline{\makebox[4.5cm][s]{\textbf{\Ming{\@thesistypezh}}}}    
    % mark "初稿" in 'draft' mode
    \ifTHESISOPTIONdraft
      \vspace{0.5in}
  	    \centerline{\makebox[2cm][s]{\textbf{\Ming{初稿}}}}
  	  \fi
    \vfill
    % set single spacing
    \singlespacing
    \LARGE{\@titlezh}\\  % chinese title
    \vspace{0.25in}
    \LARGE{\@title}\\    % english title
  \end{center}
  \vfill
  % author & andvisor
  \ifTHESISOPTIONdraft
    \vspace{0.25in}
  \else
    \vspace{1in}
  \fi
  \fontsize{18}{18}
  \makebox[0.75cm][s]{}\makebox[2.75cm][s]{研究生}\makebox[0.75cm][s]{：}
    \makebox[3.25cm][s]{\@authorzh}\\
  \vspace{-0.2in}\\
  \makebox[0.75cm][s]{}\makebox[2.75cm][s]{指導教授}\makebox[0.75cm][s]{：}
    \makebox[3.25cm][s]{\@\@advisorzh}\makebox[2cm][c]{教授}\\
  \vspace{1in}
  \vfill
  % submission date
  \centerline{\makebox[15cm][s]{\large\@degreeyearzh}}
}

%-------------------------------------------------------------------------------
% Title Page
%-------------------------------------------------------------------------------

\def\titlepage
{
  \cleardoublepage
  \thispagestyle{empty}
  % chines & english titles
  \begin{center}
    {\singlespacing\Large{\@titlezh \\ \@title}}
  \end{center}
  % author name in chinese and english
  \vspace{0.25in}
  \makebox[2.8cm][s]{\large{研究生：}}
  \makebox[2.4cm][s]{\large{\@authorzh}}
  \hfill
  \makebox[2cm][s]{\large{Student: }}
  \makebox[4cm][l]{\large{\@author}}\\
  % advisor name in chinese and english
  \makebox[2.8cm][s]{\large{指導教授：}}
  \makebox[2.4cm][s]{\large{\@advisorzh}}
  \hfill
  \makebox[2cm][s]{\large{Advisor: }}
  \makebox[4cm][l]{\large{\@advisor}}\\
  % university & institute & thesis type in chinese
  \vfill
  \begin{center}
  \normalsize
  \makebox[5.75cm][s]{\large\@universityzh}\\
  \makebox[5.5cm][s]{\large\@institutezh}\\
  \makebox[4cm][s]{\large\@thesistypezh\@draftzh}\\
  \end{center}
  % english
  \vfill
  \centerline{\normalsize{A \@thesistype \@draft}}
  \centerline{Submitted to {\@institute}}
  \centerline{\@college}
  \centerline{\@university}
  \centerline{in partial Fulfilment of the Requirements}
  \centerline{for the Degree of}
  \centerline{\@degree}
  \centerline{in}
  \centerline{\ }
  \centerline{\@field}
  \centerline{\ }
  % date
  \vfill
  \centerline{{\@degreemonth} {\@degreeyear}}
  \vfill
  \centerline{\@location}
  \vfill
  \centerline{\makebox[8cm][s]{\normalsize\@degreeyearzh}}
}

%-------------------------------------------------------------------------------
% Authorization Page
%-------------------------------------------------------------------------------

\def\authzpage{
  \cleardoublepage
  \thispagestyle{empty}
  \phantomsection
  \null\newpage
}

%-------------------------------------------------------------------------------
% Chinese Approval Page
%-------------------------------------------------------------------------------

\def\approvalzhpage{
  \cleardoublepage
  \thispagestyle{empty}
  \phantomsection
  \null\newpage
}

%-------------------------------------------------------------------------------
% English Approval Page
%-------------------------------------------------------------------------------

\def\approvalenpage{
  \cleardoublepage
  \thispagestyle{empty}
  \phantomsection
  \null\newpage
}

%-------------------------------------------------------------------------------
% Copyright Page
%-------------------------------------------------------------------------------

\def\copyrightpage{
  \cleardoublepage
  \thispagestyle{empty}
  \rule[0pt]{0pt}{0pt} \\
  \vspace{2.5in}
  \rule[0pt]{0pt}{0pt} \\
  \centerline{\copyright {\@degreeyear} - {\@author}}
  \centerline{\ }
  \centerline{All rights reserved.}
}

%-------------------------------------------------------------------------------
% Maketitle Redefinition
%-------------------------------------------------------------------------------

\def\maketitle{{
\ifTHESISOPTIONreview\else
% Cover page
  \coverpage

% Set page numbering to 'roman' (i, ii, iii, ...)
  \frontmatter

% Title page
  \titlepage

% Authorization page
%  \authzpage

% Chinese approval page
%  \approvalzhpage

% English approval page
%  \approvalenpage

% Copyright page (dissertation final mode only)
  \ifTHESISOPTIONphd
    \ifTHESISOPTIONfinal
      \copyrightpage
    \fi
  \fi
\fi
}}

%-------------------------------------------------------------------------------
% Chinese Abstract
%-------------------------------------------------------------------------------

\def\abszhpage %中文摘要頁首
{
  \cleardoublepage
  \phantomsection
  \addcontentsline{toc}{chapter}{\textbf{\@abszhtitle}}
  \AddToShipoutPicture*{\BackgroundPicture}
  \begin{center}
    {\Large \bf \@titlezh}
  \end{center}
  \vspace*{-0.1in}
  \makebox[2.4cm][s]{\large{研究生：}}
  \makebox[2.4cm][s]{\large{\@authorzh}}
  \hfill
  \makebox[2.8cm][s]{\large{指導教授：}}
  \makebox[2.4cm][s]{\large{\@advisorzh}}
  \makebox[1.2cm][r]{\large{博士}}\\
  \centerline{\large{\@universityzh\@institutezh}}
  \vspace*{-0.4in}
}

% New environment for Chinese Abstract
\newenvironment{abstractzh}{
\ifTHESISOPTIONreview\comment\fi  % not be compiled if in review mode
\abszhpage
\vspace*{-0.75in}
\section*{\begin{center}摘要\end{center}}
\vspace*{-0.75in}
\ifTHESISOPTIONreview\endcomment\fi
}

%-------------------------------------------------------------------------------
% English Abstract
%-------------------------------------------------------------------------------

\def\absenpage
{
  \cleardoublepage
  \phantomsection
  \addcontentsline{toc}{chapter}{\textbf{\@absentitle}}
  \AddToShipoutPicture*{\BackgroundPicture}
  \begin{center}
    {\Large \bf \@title} 
  \end{center}
  \vspace*{-0.1in}
  \makebox[2cm][s]{\large{Student: }}
  \makebox[4cm][l]{\large{\@author}}
  \hfill
  \makebox[2cm][s]{\large{Advisor: }}
  \makebox[0.75cm][l]{\large{Dr. }}
  \makebox[4cm][l]{\large{\@advisor}}\\
  \centerline{\large{\@institute}}
  \centerline{\large{\@university}}
  \vspace*{-0.4in}
}

% Renew environment for english abstract, 使其頁碼與目錄其他章節標號一致

\newenvironment{abstract}{
\ifTHESISOPTIONreview\comment\fi  % not be compiled if in review mode
\absenpage
\vspace*{-0.75in}
\section*{\begin{center}Abstract\end{center}}
\vspace*{-0.75in}
\ifTHESISOPTIONreview\endcomment\fi
}

%-------------------------------------------------------------------------------
% Acknowledgement Page
%-------------------------------------------------------------------------------

\def\ackpage
{
  \cleardoublepage
  \phantomsection
  \addcontentsline{toc}{chapter}{\textbf{\@acktitle}}
  \begin{center}
    {\Large \bf \@acktitle}
  \end{center}
}

\newenvironment{acknowledgement}{
\ifTHESISOPTIONfinal\else\comment\fi  % Only be compiled in final mode
\ackpage
\ifTHESISOPTIONfinal\else\endcomment\fi
}

%-------------------------------------------------------------------------------
% Deidication Page
%-------------------------------------------------------------------------------

\newenvironment{dedication}{
% Only be compiled in the final mode of a PhD dissertation
\ifTHESISOPTIONfinal\ifTHESISOPTIONphd\else\comment\fi\else\comment\fi
  \cleardoublepage
  \thispagestyle{empty}
  \vspace*{6.6cm}
\ifTHESISOPTIONfinal\ifTHESISOPTIONphd\else\endcomment\fi\else\endcomment\fi
}

%-------------------------------------------------------------------------------
% Curriculum Vitae Page
%-------------------------------------------------------------------------------

\newenvironment{cv}{
% Only be compiled in the draft or final mode of a PhD dissertation
\ifTHESISOPTIONreview\comment\else\ifTHESISOPTIONphd\else\comment\fi\fi
  \cleardoublepage
  \phantomsection
  \addcontentsline{toc}{chapter}{\textbf{\@cvtitle}}
  \chapter*{\@cvtitle}
\ifTHESISOPTIONreview\endcomment\else\ifTHESISOPTIONphd\else\endcomment\fi\fi
}

%-------------------------------------------------------------------------------
% Publications Page
%-------------------------------------------------------------------------------

\newenvironment{publications}{
% Only be compiled in the draft or final mode of a PhD dissertation
\ifTHESISOPTIONreview\comment\else\ifTHESISOPTIONphd\else\comment\fi\fi
  \cleardoublepage
  \phantomsection
  \addcontentsline{toc}{chapter}{\textbf{\@loptitle}}
  \chapter*{\@loptitle}
\ifTHESISOPTIONreview\endcomment\else\ifTHESISOPTIONphd\else\endcomment\fi\fi
}

\endinput