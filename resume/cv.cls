\ProvidesClass{cv}[2012/04/30 CV class]
\NeedsTeXFormat{LaTeX2e}

\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}%
}
\ProcessOptions\relax
\LoadClass{article}


%-------------------------------------------------------------------------------
%                overall design commands definitions
%-------------------------------------------------------------------------------

% MarVoSym font for symbols
%\RequirePackage{marvosym}
\newcommand*{\marvosymbol}[1]{}
%\ifxetexorluatex
%  \renewcommand*{\marvosymbol}[1]{{\fontspec{MarVoSym}\char#1}}
%\else
  \renewcommand*{\marvosymbol}[1]{{\fontfamily{mvs}\fontencoding{U}\fontseries{m}\fontshape{n}\selectfont\char#1}}
%\fi

\newcommand*{\faxsymbol}{\marvosymbol{117}~}
\newcommand*{\emailsymbol}{\marvosymbol{66}~}
\newcommand*{\homepagesymbol}{{\Large\marvosymbol{205}}~}

\usepackage{academicons}
\newcommand{\orcid}[1]{\href{https://orcid.org/#1}{\textcolor[HTML]{A6CE39}{\aiOrcid #1}}}

% elements
\newcommand*{\firstname}[1]{\def\@firstname{#1}}
\newcommand*{\familyname}[1]{\def\@familyname{#1}}
\newcommand*{\address}[4]{{#1}\\{#2}\\{#3}\\{#4}}
\newcommand*{\mobile}[1]{\faMobilePhone~{#1}}
\newcommand*{\fax}[1]{\faxsymbol~{#1}}
\newcommand*{\phone}[1]{\faPhone~{#1}}


\newcommand*{\github}[1]{\faGithub~\href{https://github.com/#1}{#1}}
\newcommand*{\email}[1]{\emailsymbol~\href{mailto:{#1}}{#1}}
\newcommand*{\homepage}[2]{\homepagesymbol~\href{#1}{#2}}
\newcommand*{\twitter}[1]{\faTwitterSign~\href{https://twitter.com/#1}{#1}}
\newcommand*{\facebook}[1]{\faFacebookSign~\href{https://facebook.com/#1}{#1}}
\newcommand*{\linkedin}[1]{\faLinkedinSign~\href{https://www.linkedin.com/in/#1}{#1}}
%%%%%%%%%%
% Colors %
%%%%%%%%%%

\RequirePackage{xcolor}

\definecolor{white}{RGB}{255,255,255}

\definecolor{darkgray}{HTML}{333333}
\definecolor{gray}{HTML}{4D4D4D}
\definecolor{lightgray}{HTML}{999999}

\definecolor{green}{HTML}{C2E15F}
\definecolor{orange}{HTML}{FDA333}
\definecolor{purple}{HTML}{D3A4F9}
\definecolor{red}{HTML}{FB4485}
\definecolor{blue}{HTML}{6CE0F1}
\definecolor{indianred}{HTML}{CD5C5C}
\definecolor{seagreen}{HTML}{2E8B57}
\definecolor{azure}{HTML}{C1CDCD}
\ifdefined\@cv@print
  \colorlet{green}{gray}
  \colorlet{orange}{gray}
  \colorlet{purple}{gray}
  \colorlet{brown}{gray}
  \colorlet{red}{gray}
  \colorlet{blue}{gray}
  \colorlet{indianred}{gray}
  \colorlet{seagreen}{gray}
  \colorlet{fillheader}{white}
  \colorlet{header}{gray}
\else
  \colorlet{fillheader}{gray}
  \colorlet{header}{white}
\fi
\colorlet{textcolor}{gray}
\colorlet{headercolor}{gray}

%%%%%%%%%
% Fonts %
%%%%%%%%%

\RequirePackage[quiet]{fontspec}
%\RequirePackage[math-style=TeX,vargreek-shape=unicode]{unicode-math}
%\setmathfont{XITS Math}

\newfontfamily\bodyfont[]{Georgia} %Helvetica Neue
\newfontfamily\thinfont[]{Georgia Italic} %Helvetica Neue UltraLight
\newfontfamily\headingfont[]{Georgia} %Helvetica Neue Condensed Bold
\newfontfamily\boldfont[]{Georgia Bold} %Helvetica Neue UltraLight

\defaultfontfeatures{Mapping=tex-text}
\setmainfont[Mapping=tex-text, Color=textcolor]{Georgia} %Helvetica Neue Light

\usepackage{fontawesome}

%%%%%%%%%%
% Header %
%%%%%%%%%%

\RequirePackage{tikz}

\newcommand{\rolefont}{%
  \fontsize{14pt}{24pt}\selectfont%
  \thinfont%
  \color{white}%
}

\newcommand{\header}[3]{%
  \begin{tikzpicture}[remember picture,overlay]
    \node [rectangle, fill=fillheader, anchor=north, minimum width=\paperwidth, minimum height=4cm] (box) at (current page.north){};
    \node [anchor=center] (name) at (box) {%
      \fontsize{40pt}{72pt}\color{header}%
      {\boldfont #1}\quad{\bodyfont  #2}
    };
    \node [anchor=north] at (name.south) {%
      \fontsize{14pt}{24pt}\color{header}%
      \thinfont #3%
    };
  \end{tikzpicture}
  \vspace{2.5cm}
  \vspace{-2\parskip}
}


%%%%%%%%%%%%%
% Structure %
%%%%%%%%%%%%%
\RequirePackage{parskip}

\newcounter{colorCounter}
\def\@sectioncolor#1#2#3{%
  {%
    \color{%
      \ifcase\value{colorCounter}%
        blue\or%
        red\or%
        orange\or%
        green\or%
        purple\or%
        brown\or %
        indianred\or%
        seagreen\or
        azure\else %
        	headercolor\fi%
    } #1#2#3%
  }%
  \stepcounter{colorCounter}%
}

\renewcommand{\section}[1]{
  \par\vspace{\parskip}
  {%
    \LARGE\headingfont\color{headercolor}%
    \@sectioncolor #1%
  }
  \par\vspace{\parskip}
}

\renewcommand{\subsection}[2]{
  \par\vspace{.5\parskip}%
  \Large\headingfont\color{headercolor} #2%
  \par\vspace{.25\parskip}%
}

\pagestyle{empty}


%%%%%%%%%%%%%%%%%%%%
% List environment %
%%%%%%%%%%%%%%%%%%%%

\setlength{\tabcolsep}{0pt}
\newenvironment{entrylist}{%
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
  \end{tabular*}
}
\renewcommand{\bfseries}{\headingfont\color{headercolor}}
\newcommand{\entry}[4]{%
  #1&\parbox[t]{11.8cm}{%
    \textbf{#2}%
    \hfill%
    {\footnotesize\addfontfeature{Color=lightgray} #3}\\%
    #4\vspace{1.5\parsep}%
  }\\}

\newcommand{\entryaside}[2]{%
  \parbox[t]{4.1cm}{\flushright
  	{\footnotesize\addfontfeature{Color=lightgray} \lowercase{#1}}:~
  	#2
  }
  }


%%%%%%%%%%%%%%
% Side block %
%%%%%%%%%%%%%%

\RequirePackage[absolute,overlay]{textpos}
\setlength{\TPHorizModule}{1cm}
\setlength{\TPVertModule}{1cm}
\newenvironment{aside}{%
  \let\oldsection\section
  \renewcommand{\section}[1]{
    \par\vspace{\baselineskip}{\Large\headingfont\color{headercolor} ##1}
  }
  \begin{textblock}{4.1}(1.5, 4.33)
  \begin{flushright}
  \obeycr
}{%
  \restorecr
  \end{flushright}
  \end{textblock}
  \let\section\oldsection
}
\newcommand{\removeaside}{\addtolength{\hoffset}{-4.1cm}}

%%%%%%%%%%%%%%%%
% Bibliography %
%%%%%%%%%%%%%%%%
\newcommand{\printbibsection}[2]{%
\begin{refsection}%
    \newrefcontext[sorting=chronological]%
    \nocite{*}%
    \printbibliography[type={#1}, title={#2}, heading=subbibliography]%
\end{refsection}}


\RequirePackage[style=verbose, maxnames=99, sorting=ydnt, backend=biber]{biblatex}

\DeclareFieldFormat[article]{title}{#1\par}
\DeclareFieldFormat[book]{title}{#1\par}
\DeclareFieldFormat[inproceedings]{title}{#1\par}
\DeclareFieldFormat[misc]{title}{#1\par}
\DeclareFieldFormat[report]{title}{#1\par}

\DeclareBibliographyDriver{article}{%
  \printfield{title}%
  \newblock%
  \printnames{author}%
  \par%
  \newblock%
  {%
    \footnotesize\addfontfeature{Color=lightgray}\itshape%
    \usebibmacro{journal+issuetitle}%
    \setunit{\space}%
    \printfield{pages}%
    \newunit%
    \printlist{publisher}%
    \setunit*{\addcomma\space}%
    \printfield{year}%
    \newunit%
  }
  \par\vspace{0.3\baselineskip}
}

\DeclareBibliographyDriver{book}{%
  \printfield{title}%
  \newblock%
  \printnames{author}%
  \par%
  \newblock%
  {%
    \footnotesize\addfontfeature{Color=lightgray}\itshape%
    \printfield{note}%
    \setunit*{\addcomma\space}%
    \printlist{publisher}%
    \setunit*{\addcomma\space}%
    \printfield{year}%
    \setunit{\addcomma\space}%
    \printlist{location}%
    \newunit%
  }
  \par\vspace{0.3\baselineskip}
}

\DeclareBibliographyDriver{inproceedings}{%
  \printfield{title}%
  \newblock%
  \printnames{author}%
  \par%
  \newblock%
  {%
    \footnotesize\addfontfeature{Color=lightgray}%
    \printfield{booktitle}%
    \setunit{\addcomma\space}%
    \printfield{year}%
    \setunit{\addcomma\space}%
    \printlist{location}%
    \newunit%
  }
  \par\vspace{0.3\baselineskip}
}

\DeclareBibliographyDriver{misc}{%
  \printfield{title}%
  \newblock%
  \printnames{author}%
  \par%
  \newblock%
  {%
    \footnotesize\addfontfeature{Color=lightgray}\itshape%
  	\printfield{howpublished}
    \setunit*{\addcomma\space}%
    \printfield{location}%
    \setunit*{\addcomma\space}%
    \printfield{note}%            
    \setunit{.\space}%
    \printfield{month}%            
    \setunit{\space}%
    \printfield{year}%
    \setunit{\addcomma\space}%
    \newunit%
  }
  
  
  \par\vspace{0.3\baselineskip}
}

\DeclareBibliographyDriver{report}{%
  \printfield{title}%
  \newblock%
  \printnames{author}%
  \par%
  \newblock%
  {%
    \footnotesize\addfontfeature{Color=lightgray}\itshape%
    \printfield{type}%
    \setunit{\space}%
    \printfield{number}%
    \setunit{\addcomma\space}%
    \printfield{year}%
    \newunit%
  }
  \par\vspace{0.3\baselineskip}
}

\DeclareNameFormat{author}{%
  \small\addfontfeature{Color=lightgray}%
  \ifgiveninits
    {\usebibmacro{name:given-family}
      {\namepartfamily}
      {\namepartgiveni}
      {\namepartprefix}
      {\namepartsuffix}}
    {\usebibmacro{name:given-family}
      {\namepartfamily}
      {\namepartgiven}
      {\namepartprefix}
      {\namepartsuffix}}%
  \usebibmacro{name:andothers}}

\DeclareSortingTemplate{chronological}{
  \sort[direction=descending]{\field{year}}
  \sort[direction=descending]{\field{month}}
}

\newcommand{\printbibsection}[2]{
  %\begin{refsection}
    \nocite{*}
    \printbibliography[type={#1}, title={#2}, heading=subbibliography]
  %  \printbibliography[sorting=chronological, type={#1}, title={#2}, heading=subbibliography]
  %\end{refsection}
}



%%%%%%%%%%%%%%%%
% Other tweaks %
%%%%%%%%%%%%%%%%

\RequirePackage[left=6.1cm,top=2cm,right=1.5cm,bottom=2.5cm,nohead,nofoot]{geometry}
\RequirePackage{hyperref}
