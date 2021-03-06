%\xdef\myDevelopVariable{0}
\def\ifundefined#1{\expandafter\ifx\csname#1\endcsname\relax}
\ifundefined{myDevelopVariable}\xdef\myDevelopVariable{1}\fi

\usepackage[table]{xcolor}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%  global variables  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\definecolor{myColor1}{RGB}{0,51,128}
\definecolor{myheadLineColor}{RGB}{0,51,128}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\LoadClassWithOptions{scrbook}
\KOMAoptions{paper = a4}
\KOMAoptions{numbers = noenddot} % obsolete
\KOMAoptions{parskip = half*}

\textheight240mm
\voffset6mm
% \textwidth160mm
% \evensidemargin14pt
% \oddsidemargin5pt

% \usepackage[scale=0.75]{geometry}
% \usepackage{geometry}
% \usepackage[
% %     % paperwidth=210mm
% %     % ,paperheight=245mm
% %     ,top=10mm
% %     ,bottom=25mm
% %     ,inner=10mm
% %     ,outer=80mm
%      headsep=40pt %21pt
%     ,evensidemargin=50pt %36pt
%     ,marginparsep=12pt
%     ,marginparwidth=81pt
%     ]{geometry}

\setlength{\unitlength}{1mm}
%\emergencystretch 2em
%\usepackage{multicol}

%%%% General
\clubpenalty = 10000
\widowpenalty = 10000
\displaywidowpenalty = 10000

%%%% Sprache
\usepackage{polyglossia}
\iffalse
  \setdefaultlanguage{german}
  \setotherlanguages{english}
\else
  \setdefaultlanguage{english}
  \setotherlanguages{germal}
\fi

\usepackage{amsmath,amsthm,amssymb}
\usepackage{latexsym}
\usepackage{enumerate}
\usepackage{graphicx}

\usepackage{url} % URLS in bibtex

\usepackage{microtype}

\usepackage[german]{varioref}
\usepackage{hyperref}
\hypersetup{colorlinks
           ,citecolor=black
           ,filecolor=black
           ,linkcolor=black
           ,urlcolor=black}

\usepackage{paracol}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%  tikz  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\usepackage{tikz}
\usepackage{tikz-cd}
\usetikzlibrary{matrix, arrows, calc, decorations.pathmorphing, chains,%
  decorations.pathreplacing, fadings, 3d, decorations.markings, positioning}
\usetikzlibrary{external}
\usepackage{tikzpagenodes}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%  Design / Style  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%  Typography  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\setkomafont{sectioning}{\normalcolor\bfseries\boldmath}

\iftrue
  \usepackage{lmodern} %Type1-Schriftart für nicht-englische Texte
\else % libertine
  \usepackage{libertine}
  \iffalse
    \usepackage[libertine,cmbraces]{newtxmath} %,cmintegrals,vvarbb
  \else
    \usepackage{fontspec}
    \setromanfont[Ligatures=TeX]{TeX Gyre Pagella}
    \usepackage{unicode-math}

    \setmathfont[math-style=ISO,bold-style=ISO,vargreek-shape=TeX]{TeX Gyre Pagella Math}
  \fi
\fi

\iffalse %schrift enger:
  \usepackage{mathptmx}
  \usepackage[scaled=.92]{helvet}
  \usepackage{courier}
\fi

% \linespread{1.5}

%%%% Headline styles %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% \usepackage{scrpage2}
\usepackage[automark]{scrpage2}
% \pagestyle{scrheadings}
\addtokomafont{pagenumber}{\sffamily\color{gray!50!black}}
\addtokomafont{pagehead}{\sffamily\upshape\color{gray!50!black}}
%\setheadwidth[0pt]{textwithmarginpar}}

\pagestyle{scrheadings}
\clearscrheadfoot
\setheadsepline{0pt}
\chead{\headmark}
\ohead[\myheadcmdempty]{\myheadcmd}
\ofoot{}
\def\myheadcmd{\tikz[remember picture]{
    \node[outer xsep=1pt, outer ysep=3pt, inner ysep=0pt,
    inner xsep=5pt, font=\sffamily] (a) {\pagemark};}%
    \tikz[remember picture, overlay]{
        \ifthispageodd{
            \draw[myColor1,line width=1pt]
            ($(a.north west)+(0pt,0)$) |- ($(a.south east)+(-3pt,-3pt)$);
            \if@mainmatter
            \draw[myColor1] ($(a.south west)+(0pt,0pt)$)  --
            (a.south west -| current page text area.north west);
            \fi
        }{%
            \draw[myColor1,line width=1pt]
            ($(a.north east)+(0pt,0)$) |- ($(a.south west)+(3pt,-3pt)$);
            \if@mainmatter
            \draw[myColor1] ($(a.south east)+(0pt,0pt)$)--
            (a.south east -| current page text area.north east);
            \fi
        }%
    }%
}
\makeatletter
\def\myheadcmdempty{
    \if@mainmatter
    % leave empty
    \else
    \tikz[remember picture]{
    \node[outer xsep=1pt, outer ysep=3pt, inner ysep=0pt,
    inner xsep=5pt, font=\sffamily] (a) {\pagemark};}%
    \tikz[remember picture, overlay]{
        \ifthispageodd{
            \draw[myColor1,line width=1pt]
            ($(a.north west)+(0pt,0)$) |- ($(a.south east)+(-3pt,-3pt)$);
        }{
            \draw[myColor1,line width=1pt]
            ($(a.north east)+(0pt,0)$) |- ($(a.south west)+(3pt,-3pt)$);
        }
    }
    \fi
}
% \else
%   \def\myheadcmdempty{}
\makeatother

%%%%  Layout  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\usepackage{lscape} % alt: pdflscape

\allowdisplaybreaks

\ifnum\myDevelopVariable=1
  \usepackage{sectsty}
  \makeatletter\def\@seccntformat#1{%
    \protect\makebox[0pt][r]{\csname the#1\endcsname\hspace{12pt}}}\makeatother
\fi

\renewcommand*{\thefootnote}{[\arabic{footnote}]}

\iftrue%Horizontale Linien
  \usepackage{sectsty}

  \chapterfont{%
    % \vspace{1cm}
    \color{myheadLineColor}
    % \sectionrule{0pt}{0pt}{-5pt}{2pt}
  }
  \fi
  \sectionfont{%
    \color{myheadLineColor}
    % \sectionrule{0pt}{0pt}{-5pt}{0.8pt}
  }
  \subsectionfont{%
    \color{myheadLineColor}
    % \sectionrule{0pt}{0pt}{-5pt}{0.6pt}
  }
  \subsubsectionfont{%
    \color{myheadLineColor}
    % \sectionrule{0pt}{0pt}{-5pt}{0.4pt}
  }

%%%%  Theoreme Styles  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\usepackage[framemethod=TikZ]{mdframed}
\makeatletter

\theoremstyle{plain}% default
% Styles:
\mdfdefinestyle{thin}{linewidth=1pt ,linecolor=myColor1
  ,topline=false, rightline=false, bottomline=false
  ,leftmargin=\parindent ,innerbottommargin=0pt, innerrightmargin=0pt
  ,skipabove=\medskipamount, skipbelow=\medskipamount}
\mdfdefinestyle{thinn}{linewidth=1pt ,linecolor=myColor1
  ,leftmargin=\parindent
  ,skipabove=\medskipamount, skipbelow=\medskipamount}
\mdfdefinestyle{thick}{linewidth=2pt ,linecolor=myColor1
  ,topline=false, rightline=false, bottomline=false
  ,leftmargin=\parindent ,innerbottommargin=0pt, innerrightmargin=0pt
  ,skipabove=\medskipamount, skipbelow=\medskipamount}
\mdfdefinestyle{thickk}{linewidth=2pt ,linecolor=myColor1
  ,leftmargin=\parindent
  ,skipabove=\medskipamount, skipbelow=\medskipamount}
\mdfdefinestyle{thiin}{linewidth=1pt ,linecolor=myColor1
  ,topline=false, rightline=false, bottomline=false}

% Theorems:
\mdtheorem[style=thick]{thm}{Theorem}[chapter]
\mdtheorem[style=thin]{s-thm}{Theorem}[thm]
\mdtheorem[style=thickk]{tthm}[thm]{Theorem}
\mdtheorem[style=thick]{lem}[thm]{Lemma}
\mdtheorem[style=thin]{s-lem}{Lemma}[thm]
\mdtheorem[style=thickk]{llem}[thm]{Lemma}
\mdtheorem[style=thick]{lemdef}[thm]{Lemma/Definition}
\mdtheorem[style=thick]{lemdef}[thm]{Lemma/Corollary}
\mdtheorem[style=thick]{lemdef}[thm]{Definition/Corollary}
\mdtheorem[style=thick]{cor}[thm]{Corollary}
\mdtheorem[style=thick]{s-cor}{Corollary}[thm]
\mdtheorem[style=thick]{kor}[thm]{Corollary}
\mdtheorem[style=thick]{s-kor}{Corollary}[thm]
\mdtheorem[style=thick]{prop}[thm]{Proposition}
\mdtheorem[style=thick]{s-prop}{Proposition}[thm]
\mdtheorem[style=thick,skipbelow=0pt]{s-propSplt}{Proposition}[thm]

\mdtheorem[style=thin,innertopmargin=0pt,skipabove=0pt]{emptyThn}{}
\mdtheorem[style=thick,innertopmargin=0pt,skipabove=0pt]{emptyTck}{}

\newtheorem{ex}{Aufgabe}[chapter]
\newtheorem*{beh}{Behauptung}
\newtheorem*{dazu}{Dazu}

\theoremstyle{definition}
\mdtheorem[style=thin]{defn}[thm]{Definition}
\mdtheorem[style=thin]{s-defn}{Definition}[thm]
\mdtheorem[style=thin]{notations}[thm]{Notations}
\mdtheorem[style=thinn]{notations}[conj]{Conjecture}
\mdtheorem[style=thinn]{exmp}[thm]{Example}[exmp]
\mdtheorem[style=thinn]{s-exmp}{Example}[thm]
\newtheorem{bsp}[thm]{Example}

\theoremstyle{remark}
\mdtheorem[style=thin]{rem}[thm]{Remark}
\mdtheorem[style=thin]{s-rem}{Remark}[thm]
\mdtheorem[style=thin]{bem}[thm]{Remark}
\mdtheorem[style=thin]{note}[thm]{Note}

\newtheorem{beo}[thm]{Beobachtung}

% \usepackage{thmbox}
\newtheorem{try}{Versuch}
\newtheorem{case}{Fall}

\surroundwithmdframed[style=thin]{proof}

% \newenvironment{einrPrime}{}{}
% \surroundwithmdframed[style=thiin]{einrPrime}
\newenvironment{einr}{%
  % \vspace{\medskipamount}
  \begin{itemize}
  \item[]
    % \begin{einrPrime}
    %   \begin{mdframed}[style=thick]
  }{%
    % \end{mdframed}
    % \end{einrPrime}
  \end{itemize}
}

\numberwithin{equation}{chapter}
\numberwithin{figure}{chapter}
%\numberwithin{figure}{thm}


%%%%  figures  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\usepackage{float}
%TODO: decorate floats
\newcommand{\myfigurestart}{
%\textcolor{lightgray}{\hrule height 2pt}
\hline
\vspace{3mm}
}
\newcommand{\myfigureend}{
\vspace{3mm}
\hline
%\textcolor{lightgray}{\hrule height 2pt}
}

%\usepackage{lipsum}% http://ctan.org/pkg/lipsum
%\usepackage{mdframed}% http://ctan.org/pkg/mdframed
%\usepackage{xcolor}% http://ctan.org/pkg/xcolor
%\newenvironment{inline}{
%\begin{figure}[h!]
  %\begin{mdframed}[backgroundcolor=back!5]
  %\vspace{10pt}%
%}{%
  %\end{mdframed}
%\end{figure}
%}

\usepackage{caption}
\usepackage{subcaption}

%%%%  Zeichen  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\usepackage{nicefrac}
\usepackage{mathrsfs}
\usepackage{stmaryrd}
%simplewick

%%%%  myobracket/myubracket  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\usepackage{mathtools}
\newcommand{\myobracket}[1]{%
  \textcolor{gray}{%
    \overbracket[0.7pt]{%
      \textcolor{black}{%
        #1%
      }%
    }%
  }%
}
\newcommand{\myubracket}[1]{%
  \textcolor{gray}{%
    \underbracket[0.7pt]{%
      \textcolor{black}{%
        #1%
      }%
    }%
  }%
}

%%%%  Listings  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\usepackage{listings}
\lstset{literate=
  {á}{{\'a}}1 {é}{{\'e}}1 {í}{{\'i}}1 {ó}{{\'o}}1 {ú}{{\'u}}1
  {Á}{{\'A}}1 {É}{{\'E}}1 {Í}{{\'I}}1 {Ó}{{\'O}}1 {Ú}{{\'U}}1
  {à}{{\`a}}1 {è}{{\'e}}1 {ì}{{\`i}}1 {ò}{{\`o}}1 {ò}{{\`u}}1
  {À}{{\`A}}1 {È}{{\'E}}1 {Ì}{{\`I}}1 {Ò}{{\`O}}1 {Ò}{{\`U}}1
  {ä}{{\"a}}1 {ë}{{\"e}}1 {ï}{{\"i}}1 {ö}{{\"o}}1 {ü}{{\"u}}1
  {Ä}{{\"A}}1 {Ë}{{\"E}}1 {Ï}{{\"I}}1 {Ö}{{\"O}}1 {Ü}{{\"U}}1
  {â}{{\^a}}1 {ê}{{\^e}}1 {î}{{\^i}}1 {ô}{{\^o}}1 {û}{{\^u}}1
  {Â}{{\^A}}1 {Ê}{{\^E}}1 {Î}{{\^I}}1 {Ô}{{\^O}}1 {Û}{{\^U}}1
  {œ}{{\oe}}1 {Œ}{{\OE}}1 {æ}{{\ae}}1 {Æ}{{\AE}}1 {ß}{{\ss}}1
  {ç}{{\c c}}1 {Ç}{{\c C}}1 {ø}{{\o}}1 {å}{{\r a}}1 {Å}{{\r A}}1
  {€}{{\EUR}}1 {£}{{\pounds}}1
}

%%%% Bibliography %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% \usepackage[style=authoryear,natbib=true,backend=biber]{biblatex}
\usepackage[style=alphabetic,natbib=true,backend=biber]{biblatex}
\usepackage[babel]{csquotes}
%\usepackage{filecontents}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%  MyDevelop  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\usepackage{verbatim}

\newcommand{\comm}[1] {}
\newcommand{\rewrite}[1] {#1}
\newcommand{\ccite}[2][\empty] {}
\newcommand{\TODO}[1][\empty] {}
\newcommand{\NO} {}
\newcommand{\PROBLEM}[1][\empty] {}
\newcommand{\BIGPROBLEM}[1][\empty] {}

\ifnum\myDevelopVariable=1
  \usepackage{xcolor}
  \usepackage{color}
  \usepackage{framed}

  \definecolor{commentShadeColor}{rgb}{1.0,.9,.6}
  %\definecolor{commentShadeColor}{rgb}{.6,.6,.6}
  \definecolor{commentTextColor}{rgb}{.2,.2,.2}
  \definecolor{CommentFrameColor}{rgb}{.3,.3,.3}%
  \definecolor{rewriteColor}{rgb}{.6,1,.9}

  \renewcommand{\comment}{\color{commentTextColor}%
    \def\FrameCommand{\fcolorbox{CommentFrameColor}{commentShadeColor}}%
    \MakeFramed {\FrameRestore}%
    \footnotesize%
    %\textbf{\tiny Kommentar: }
    }
  \renewcommand{\endcomment}{\endMakeFramed}

  \usepackage{soul}
  \renewcommand{\comm}[1] {%
    \sethlcolor{commentShadeColor}%
    {\texthl{#1}}}
  \renewcommand{\rewrite}[1] {%
    \sethlcolor{rewriteColor}%
    {\texthl{#1}}}

  \usepackage{ifthen}
  \makeatletter
  \renewcommand{\ccite}[2][\empty]{{%
    \fcolorbox{CommentFrameColor}{commentShadeColor}{%
      \ifthenelse{\equal{#1}{\empty}}
        {\cite{#2}}
        {\cite[#1]{#2}}
    }
  }}
  \makeatother

  \renewcommand{\TODO}[1][\empty]{{%
      \fcolorbox{CommentFrameColor}{commentShadeColor}{%
      \footnotesize{}
      \ifthenelse{\equal{#1}{\empty}}
        {\tiny T\!O\!D\!O}
        {\tiny T\!O\!D\!O: #1} % {TODO: #1}
  }}}
  \renewcommand{\NO}{{%
    \fcolorbox{CommentFrameColor}{red!50!white}{\textbf{\tiny N\!O}}}}

  \renewcommand{\PROBLEM}[1][\empty]{{%
      \fcolorbox{CommentFrameColor}{red!50!white}{%
      \footnotesize{}
      \ifthenelse{\equal{#1}{\empty}}
        {\tiny P\!R\!O\!B\!L\!E\!M}
        {\tiny P\!R\!O\!B\!L\!E\!M:\normalsize #1} % {TODO: #1}
  }}}
  \renewcommand{\BIGPROBLEM}[1][\empty]{{%
      \fcolorbox{CommentFrameColor}{red!50!white}{%
      \footnotesize{}
      \ifthenelse{\equal{#1}{\empty}}
        {\tiny P\!R\!O\!B\!L\!E\!M}
        {\tiny P\!R\!O\!B\!L\!E\!M:\huge #1} % {TODO: #1}
  }}}


  %Zeilenhöhe, für bessere lesbarkeit
  % \linesprcad{1.3}

  % \cfoot{-\thepage-\\\today}

  % einseitig, überschreibt KOMA
  %\setboolean{@twoside}{false}

  \usepackage{marginnote}
  \let\oldmarginnote\marginnote
  \renewcommand{\marginnote}[1]{\oldmarginnote{\tiny #1}}
\else
  \newcommand{\marginnote}[1] {}
\fi

\ifnum\myDevelopVariable=2
  \usepackage{showframe}
\fi

%\setcounter{chapter}{-1}

%%% Local Variables:
%%% TeX-master: "Maximilian_Huber-Masters_Thesis-with_notes.tex"
%%% End:
% vim:set ft=tex foldmethod=marker foldmarker={{{,}}}:
