\ProvidesClass{thesis}[2017/02/07 V1.1 by Borting Chen]
\NeedsTeXFormat{LaTeX2e}

%TODO
% 預留空間給 著作權授權書 (authorization) 和 審定書 (approval)
% 檢查 twoside 時的版面配置
% \cleardoublepage 後的空白頁不顯示 watermark
% difference b/w \newcommand and \DeclareRobustCommand
% Mac OS X 字型問題

%-------------------------------------------------------------------------------
% Document Options Declaration
%-------------------------------------------------------------------------------

% Inherent existing options from report document class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}

% Declare options for thesis types: (default: master)
%   thesis(master) or dissertation(phd)
\newif\ifTHESISOPTIONmaster         \THESISOPTIONmastertrue
\newif\ifTHESISOPTIONphd            \THESISOPTIONphdfalse

\DeclareOption{phd}{\THESISOPTIONmasterfalse\THESISOPTIONphdtrue}

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
\LoadClass[a4paper,12pt,oneside]{report}

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

%-------------------------------------------------------------------------------
% Default Values for Macros
%-------------------------------------------------------------------------------

% Macros related to degree
\ifTHESISOPTIONmaster  % Master thesis
  \thesistype{Thesis}
  \thesistypezh{碩士論文}
  \degree{Master}
\else                  % PhD dissertation 
  \thesistype{Dissertation}
  \thesistypezh{博士論文}
  \degree{Doctor of Philosophy}
\fi

% Macros related to print mode
\ifTHESISOPTIONdraft
  \draft{ Draft}
  \draftzh{初稿}
\else
  \draft{}
  \draftzh{}
\fi

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

% Change margin of a page
\def\changemargin#1#2{\list{}{\rightmargin#2\leftmargin#1}\item[]}
\let\endchangemargin=\endlist 

% Use roman page numbering
\newcommand\frontmatter{%
  \cleardoublepage
  \pagenumbering{roman}
}

% Use arabic page numbering
\newcommand\mainmatter{%
  \cleardoublepage
  \pagenumbering{arabic}
}

% Clear page numbering
\newcommand\backmatter{%
  \if@openright
    \cleardoublepage
  \else
    \clearpage
  \fi
}

% Generate tables of contents, list of figures, and list of tables, and set
% page numbering to 'arabic'
\def\maketocs{
\ifTHESISOPTIONreview\else
% Table of Contents
  \cleardoublepage
  \phantomsection
  \addcontentsline{toc}{chapter}{Table of Contents}
  \tableofcontents
  \AddToShipoutPictureBG{\BackgroundPicture}
% List of Figures
  \cleardoublepage
  \phantomsection
  \addcontentsline{toc}{chapter}{List of Figures}
  \listoffigures
% List of Tables
  \cleardoublepage
  \phantomsection
  \addcontentsline{toc}{chapter}{List of Tables}
  \listoftables
\fi

% Set page numbering to 'arabic' (1, 2, 3, ...)
\mainmatter
}

%-------------------------------------------------------------------------------
% Cover Page
%-------------------------------------------------------------------------------

\def\coverpage
{
  \thispagestyle{empty}
  \phantomsection
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
  \phantomsection
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
  \newpage
}

%-------------------------------------------------------------------------------
% Copyright Page
%-------------------------------------------------------------------------------

\def\copyrightpage{
  \cleardoublepage
  \thispagestyle{empty}
  \phantomsection
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
% cover page
  \coverpage

% Set page numbering to 'roman' (i, ii, iii, ...)
  \frontmatter

% front page
  \titlepage

  \authzpage

% copyright page (dissertation final mode only)
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
  \AddToShipoutPicture*{\BackgroundPicture}
  \addcontentsline{toc}{chapter}{摘要}
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
\begin{center}
  \vspace*{-0.25in}
	\section*{摘要}
	\bfseries %\abstract chinese name
     \@endparpenalty\@M
\end{center}
\ifTHESISOPTIONreview\endcomment\fi
}

%-------------------------------------------------------------------------------
% English Abstract
%-------------------------------------------------------------------------------

\def\absenpage
{
  \cleardoublepage
  \phantomsection
  \AddToShipoutPicture*{\BackgroundPicture}
  \addcontentsline{toc}{chapter}{Abstract}
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

\renewenvironment{abstract}{
\ifTHESISOPTIONreview\comment\fi  % not be compiled if in review mode
\absenpage
\begin{center}
  \vspace*{-0.25in}
  \section*{Abstract}
	\bfseries 
    \@endparpenalty\@M
\end{center}
\ifTHESISOPTIONreview\endcomment\fi
}

%-------------------------------------------------------------------------------
% Acknowledgement Page
%-------------------------------------------------------------------------------

\def\ackpage
{
  \cleardoublepage
  \phantomsection
  \addcontentsline{toc}{chapter}{Acknowledgement}
}

\newenvironment{acknowledgement}{
\ifTHESISOPTIONfinal\else\comment\fi  % Only be compiled in final mode
\ackpage
\begin{center}
  \ifTHESISOPTIONmaster
    \section*{誌謝}
  \else
    \section*{Acknowledgement}
  \fi
  \bfseries 
    \@endparpenalty\@M
\end{center}
\ifTHESISOPTIONfinal\else\endcomment\fi
}

%-------------------------------------------------------------------------------
% Deidication Page
%-------------------------------------------------------------------------------

\newenvironment{dedication}{
% Only be compiled in the final mode of a PhD dissertation
\ifTHESISOPTIONfinal\ifTHESISOPTIONphd\else\comment\fi\else\comment\fi
  \cleardoublepage
%  \phantomsection
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
  \chapter*{Curriculum Vitae}
  \addcontentsline{toc}{chapter}{Curriculum Vitae}
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
  \chapter*{List of Publications}
  \addcontentsline{toc}{chapter}{List of Publications}
\ifTHESISOPTIONreview\endcomment\else\ifTHESISOPTIONphd\else\endcomment\fi\fi
}

\endinput