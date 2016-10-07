\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{thesis}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions
\LoadClass[a4paper,12pt]{report}

%%%%%%%%%%%%%%%%%%%%%%%%% Packages %%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\usepackage[BoldFont, SlantFont, CJKchecksingle]{xeCJK}	% for Chinese typing
\usepackage{fontspec}     % for font selection
\usepackage{ifplatform}   % determine tex is running on which platform/OS
\usepackage{indentfirst}  % indention (Windows need this package)
\usepackage{setspace}     % for \doublespacing & \begin{spacing} in aux/publication

%%%%%%%%%%%%%%%%%%%%%%%%% Page Setting %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\doublespacing

%%%%%%%%%%%%%%%%%%%%%%%%% English Font Setting %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Set English font in order to be consistent with Windows default font settings
\setmainfont[Ligatures=TeX]{Times New Roman}
\setsansfont[Ligatures=TeX]{Arial}
\setmonofont[Ligatures=TeX]{Courier New}

%%%%%%%%%%%%%%%%%%%%%%%%% Chinese Font Setting %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Linux
\iflinux
\setCJKmainfont{AR PL UKai TW}  % AR PL UKai TW (AR PL 中楷)
                                % AR PL UMing TW (AR PL 明體)
\setCJKsansfont{WenQuanYi Zen Hei}  % WenQuanYi Zen Hei (文泉驛正黑)
                                    % WenQuanYi Micro Hei (文泉驛微米黑)
\setCJKmonofont{WenQuanYi Zen Hei Mono}  % WenQuanYi Zen Hei Mono (文泉驛等寬正黑)
                                         % WenQuanYi Micro Hei Mono (文泉驛等寬微米黑)
\fi
%%% Windows
\ifwindows
\setCJKmainfont{DFKai-SB}  % DFKai-SB (標楷體)
                           % PMingLiU (新細明體)
\setCJKsansfont{Microsoft JhengHei}  % Microsoft JhengHei (微軟正黑體)
                                     % Microsoft YaHei (微軟雅黑)
\fi
%%% Mac OS X
\ifmacosx
\setCJKmainfont{LiSong Pro}  % LiSong Pro (儷宋 Pro)
                             % Apple LiSung (蘋果儷細宋)
\setCJKsansfont{Heiti TC}  % Heiti TC (黑體-繁 中黑)
                           % LiHei Pro (儷黑 Pro)
\fi

% Enable line break for chinese
\XeTeXlinebreaklocale "zh"
\XeTeXlinebreakskip = 0pt plus 1pt

%    ****************************************
%    *             FRONT MATTER             *
%    ****************************************
%

% DECLARATIONS
%
% These macros are used to declare arguments needed for the
% construction of the front matter.  

%Chinese title of the dissertation
\def\titlezh#1{\gdef\@titlezh{#1}}

% The year and month the completed thesis is submitted...
\def\degreeyear#1{\gdef\@degreeyear{#1}}
\def\degreemonth#1{\gdef\@degreemonth{#1}}

%The year and month the completed thesis is submitted in Chinese
\def\degreeyearzh#1{\gdef\@degreeyearzh{#1}}

% The full (unabbreviated) name of the degree
\def\degree#1{\gdef\@degree{#1}}

% The name of your degree's field (e.g. Psychology, Computer Science)
\def\field#1{\gdef\@field{#1}}

%The type of thesis: Master or PhD
\def\thesistype#1{\gdef\@thesistype{#1}}

%the institute
\def\institute#1{\gdef\@institute{#1}}

%Chinese name of the institute
\def\institutezh#1{\gdef\@institutezh{#1}}

%the university
\def\university#1{\gdef\@university{#1}}

%Chinese of the university
\def\universityzh#1{\gdef\@universityzh{#1}}

% The name of your advisor (AHB 00/9/18)
\def\advisor#1{\gdef\@advisor{#1}}

%Chinese name of the advisor
\def\advisorzh#1{\gdef\@advisorzh{#1}}

%Chinese name of the author
\def\authorzh#1{\gdef\@authorzh{#1}}

% \alwayssingle and \endalwayssingle
%
% These macros define an environment for front matter that is always 
% single column even in a double-column document.

\def\alwayssingle{\@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn \else \newpage \fi}

\def\endalwayssingle{\if@restonecol\twocolumn \else \newpage \fi}

% \maketitle outputs the complete titlepage. It requires all the
% above macros except \campuscap. It is probably not correct for 
% joint (e.g. UCSD/SDSU) degrees.
% Huthesis 1.1: all redundant macros for Harvard removed, \advisor added.


% Set the font that will be used in the front matter headings
\def\fmfont{\fontsize\@xiipt{14.5}\selectfont}
\def\fmsmallfont{\fontsize\@xiipt{14pt}\selectfont}

\def\maketitle{
{
% Chinese front page
  \pagestyle{empty}
  \fontsize{38}{38}
  \centerline{\@universityzh}
  \vspace{0.5in}
  \fontsize{28}{28}
  \centerline{\@institutezh}
  \vspace{0.5in}
  	\centerline{\@thesistype}	
  \vspace{0.8in}
  \fontsize{22pt}{22pt}
  \begin{center}
    {\@titlezh }
  \end{center}
  \vspace{-0.2in}
  \begin{center}
    {\LARGE \@title   }
  \end{center}
  \fmfont
  \vspace{1.8in}
  \centerline{\large 研究生： \@authorzh\texttt{  }}
  \centerline{\large 指導教授： \@advisorzh}
  \vspace{1in}
  \centerline{\@degreeyearzh}
  
% English front page 
  \newpage
  \thispagestyle{empty}
  \centerline{\ }
  \vspace{0.5in}
  \begin{center}
    {\Large {\@titlezh \\ \@title}}
  \end{center}
 
  \centerline{\ }
  \centerline{\ }
  \centerline{\normalsize{A Dissertation}}
  \centerline{by}
  \centerline{\@author}
  \centerline{\ }
  \centerline{\ }
  \centerline{Submitted to the {\@institute}}
  \centerline{\@university}
  \centerline{in partial fulfillment of the requirements}
  \centerline{for the Degree of}
  \centerline{\@degree}
% \centerline{in the subject of}
% \centerline{\ }
% \centerline{\@field}
% \centerline{\ }
  \centerline{in}
  \centerline{\@field}
  \centerline{\ }
  \centerline{Advisor: \@advisor}
  \centerline{{\@degreemonth} {\@degreeyear}}
  \centerline{Hsinchu, Taiwan}
  \setcounter{footnote}{0}
  }
}

% COPYRIGHTPAGE
%
% This is a macro, not an environment, because it can be generated
% with the \title, \author, and \year macros.

\def\copyrightpage
{
  \newpage
  \thispagestyle{empty}
  \rule[0pt]{0pt}{0pt} \\
  \vspace{2.5in}
  \rule[0pt]{0pt}{0pt} \\
  \centerline{\copyright {\@degreeyear} - {\@author}}
  \centerline{\ }
  \centerline{All rights reserved.}
}

\def\abszhpage %中文摘要頁首
{
  \newpage
  \addcontentsline{toc}{section}{摘要}
  \begin{center}
    {\Large \bf \@titlezh} 
  \end{center}
% \vspace*{0.3in}
  \centerline{研究生: \@authorzh \hspace*{3cm} 指導教授: \@advisorzh}
  \centerline{\@universityzh\@institutezh}
}

\def\absenpage
{
  \newpage
  \addcontentsline{toc}{section}{Abstract}
  \begin{center}
    {\Large \bf \@title} 
  \end{center}
% \vspace*{0.3in}
  \centerline{Student: {\@author} \hspace*{3cm} Advisor: {\@advisor}}
  \centerline{\@institute}
  \centerline{\@university}
}

\def\ackpage
{
  \newpage
  \addcontentsline{toc}{section}{Acknowledgement}
}

%%%%%%%%%%%%%%%%%%%%%%%%% English Abstract %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newenvironment{abstracten}{ %New environment of English Abstract: 為了使其頁碼與目錄其他章節標號一致
\absenpage
\begin{center}
  \section*{Abstract}
	\bfseries 
    \@endparpenalty\@M
\end{center}
}

%%%%%%%%%%%%%%%%%%%%%%%%% Chinese Abstract %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newenvironment{abstractzh}{%New environment of Chinese Abstract
\abszhpage
\begin{center}
	\section*{摘要}
	\bfseries %\abstract chinese name
     \@endparpenalty\@M
\end{center}
}

%%%%%%%%%%%%%%%%%%%%%%%%% Acknowledgement Page %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newenvironment{acknowledgement}{
\ackpage
  \section*{Acknowledgement}
}

%%%%%%%%%%%%%%%%%%%%%%%%% Deidication Page %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newenvironment{dedication}{
\newpage
  \vspace*{5cm}
}

\endinput
