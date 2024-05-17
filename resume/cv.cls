\ProvidesClass{cv}[2023/10/31 CV class]
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
\usepackage{fontawesome}
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


\newcommand*{\kennitala}[1]{\faUser~#1}
\newcommand*{\github}[1]{\faGithub~\href{https://github.com/#1}{#1}}
\newcommand*{\email}[1]{\emailsymbol~\href{mailto:{#1}}{#1}}
\newcommand*{\homepage}[2]{\homepagesymbol~\href{#1}{#2}}
\newcommand*{\twitter}[1]{\faTwitter~\href{https://twitter.com/#1}{#1}}
\newcommand*{\facebook}[1]{\faFacebook~\href{https://facebook.com/#1}{#1}}
\newcommand*{\linkedin}[1]{\faLinkedin~\href{https://www.linkedin.com/in/#1}{#1}}
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

%\RequirePackage[quiet]{fontspec}
%\RequirePackage[math-style=TeX,vargreek-shape=unicode]{unicode-math}
%\setmathfont{XITS Math}

\newfontfamily\boldfont[]{CMU Typewriter Text Bold} %Helvetica Neue UltraLight
\newfontfamily\bodyfont[]{CMU Typewriter Text Variable Width} %Helvetica Neue
\newfontfamily\thinfont[]{CMU Serif} %Helvetica Neue UltraLight
\newfontfamily\headingfont[]{CMU Concrete} %Helvetica Neue Condensed Bold

\defaultfontfeatures{Mapping=tex-text}
\setmainfont[Mapping=tex-text, Color=textcolor]{CMU Bright} %Helvetica Neue Light

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
	\parbox[t]{42pt}{#1}&\parbox[t]{\dimexpr\textwidth-42pt\relax}{%
    \textbf{#2}%
    \hfill%
    {\small\addfontfeature{Color=lightgray} #3}\\%
    #4\vspace{1.5\parsep}%
  }\\}

\newcommand{\entryaside}[2]{%
  \parbox[t]{4.1cm}{\flushright
  	{\small\addfontfeature{Color=lightgray} \lowercase{#1}}:~
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
\newcommand{\removeaside}{
\addtolength{\hoffset}{-4.1cm}
\addtolength{\textwidth}{4.1cm}
}

%%%%%%%%%%%%%%%%
% Bibliography %
%%%%%%%%%%%%%%%%

\RequirePackage[style=verbose, maxnames=99, sorting=ydnt, backend=biber]{biblatex}
\DeclareFieldFormat[article]{title}{#1\par}
\DeclareFieldFormat[foreignarticle]{title}{#1\par}
\DeclareFieldFormat[book]{title}{#1\par}
\DeclareFieldFormat[inproceedings]{title}{#1\par}
\DeclareFieldFormat[incollection]{title}{#1\par}
\DeclareFieldFormat[seminar]{title}{#1\par}
\DeclareFieldFormat[report]{title}{#1\par}

\newbibmacro*{doi+url}{%
	% check of ieee cata log number
	\iffieldundef{note}
	{}
	{\printtext{\printfield{note}}\addperiod\space}%
	% check for isbn
	\iffieldundef{isbn}
	{}
	{\printfield{isbn}\addperiod\space}%
	% check for the DOI first, and if it doesn't exist, then check for the URL (never both)
	\iffieldundef{doi}
	{\iffieldundef{url}
		{}
		{\printfield{url}\addperiod\space}}
	{\printfield{doi}\addperiod\space}}

\DeclareBibliographyDriver{article}{%
  \printfield{title}%
  \newblock%
  \printnames{author}%
  \par%
  \newblock%
  {%
    \small\addfontfeature{Color=lightgray}%
    In: \usebibmacro{journal+issuetitle}%
    \setunit{\addcomma\space}%
    \printfield{pages}%
    \newunit%
    \printlist{publisher}%
    \setunit*{\addcomma\space}%
    \printfield{year}\addperiod
    \par
    \usebibmacro{doi+url}
  }
  \par\vspace{0.3\baselineskip}
}

\DeclareBibliographyDriver{foreignarticle}{%
	\printfield{title}%
	\newblock%
	\printnames{author}%
	\par%
	\newblock%
	{%
		\small\addfontfeature{Color=lightgray}%
		In: \usebibmacro{journal+issuetitle}%
		\setunit{\addcomma\space}%
		\printfield{pages}
		\newunit%
		\printlist{publisher}%
		\setunit*{\addcomma\space}%
		\printfield{year}\addperiod
		%
		\par
		\usebibmacro{doi+url}
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
		\addfontfeature{Color=lightgray}{\itshape\printfield{abstract}}%
		\setunit{\addcomma\space}
		\printfield{pages}\newunit
		\printlist{publisher}%
		\setunit*{\addcomma\space}%
		\printfield{year}%
		\setunit{\addcomma\space}%
		\printlist{location}\addperiod
		\par
		\usebibmacro{doi+url}
	}
	\newblock
	\par\vspace{0.3\baselineskip}
}

\DeclareBibliographyDriver{inproceedings}{%
	\printfield{title}%
	\newblock%
	\printnames{author}%
	\par%
	\newblock%
	{%
		\small\addfontfeature{Color=lightgray}%
		In: \printfield{booktitle}%
		\setunit{\addcomma\space}%
		\usebibmacro{byeditor+others}
		\setunit{\addcomma\space}%
		\printfield{pages}%
		\newunit%
		\printlist{publisher}%
		\setunit*{\addcomma\space}%
		\printfield{year}\addperiod
		\par
		\usebibmacro{doi+url}
	}
	\par\vspace{0.3\baselineskip}
}

\DeclareBibliographyDriver{incollection}{%
	\printfield{title}%
	\par
	\newblock%
	\printnames{author}%
	\par%
	\newblock%
	{%
		\small\addfontfeature{Color=lightgray}%
		In: \printfield{booktitle}%
		\setunit{\addcomma\space}%
		\usebibmacro{byeditor+others}
		\setunit{\addcomma\space}%
		\printfield{pages}%
		\newunit%
		\printlist{publisher}%
		\setunit*{\addcomma\space}%
		\printfield{year}\addperiod
		\par
		\usebibmacro{doi+url}
	}
	\par\vspace{0.3\baselineskip}
}

\DeclareBibliographyDriver{seminar}{%
	\printfield{title}%
	\newblock%
	\printnames{author}%
	\par%
	\newblock%
	{%
		\small\addfontfeature{Color=lightgray}%
		\printfield{howpublished}\space
		at\space\printlist{location}\space in\space
		\printfield{month}\space\printfield{year}%
		\par%
		\usebibmacro{doi+url}%
	}%
	\par\vspace{0.3\baselineskip}%
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

\RequirePackage[left=6.1cm,top=2cm,right=2cm,bottom=2.5cm,nohead,nofoot]{geometry}
\RequirePackage{hyperref}
