\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{oist_thesis}

\newif\if@final\@finaltrue
\DeclareOption{temporary}{\@finalfalse}
\DeclareOption{final}{\@finaltrue}

\ProcessOptions\relax

%-------------------------------------------------------------------------------
%	HANDLING THE STYLE OF THE THESIS
%-------------------------------------------------------------------------------

\if@final
    
	\LoadClass[12pt, twoside]{book} % 12 pt font, two-sided book style
	
	\RequirePackage[a4paper, includehead, headheight=0.6cm, inner=3cm ,outer=3cm, top=3cm, bottom=3cm]{geometry}  % Changing size of document
	
	\RequirePackage[bf]{caption} % caption: FIG in bold
	\RequirePackage{emptypage} % Remove headers of empty pages

	\newcommand{\thesisspacing}{\onehalfspacing}

	\newcommand{\numberedchapter}{ % Preparation for numbered chapters
		\cleardoublepage % To make sure the previous headers are passed
		\fancyhead[RE]{{\bfseries \leftmark}}% Headers for left pages
		\fancyhead[LO]{{\bfseries \rightmark}}
	}% Headers for right pages
	
	\newcommand{\unnumberedchapter}[1]{ % Preparation for unnumbered chapters
		\cleardoublepage % To make sure the previous headers are passed
		\phantomsection % To help hyperref link to the right page
		\addcontentsline{toc}{chapter}{#1} % Also adds the chapter name to the Contents
		\fancyhead[RE]{{\bfseries #1}} % Headers for left pages
		\fancyhead[LO]{}
	}%Headers for right pages

	\newcommand{\startpreamble}{
		\pagestyle{fancy} % Changes the headers
		\fancyhf{}% Clears header and footer
		\renewcommand{\chaptermark}[1]{\markboth{##1}{}} % Getting the chapter name right
		%\renewcommand{\sectionmark}[1]{\markright{#1}}
		\renewcommand{\sectionmark}[1]{\markright{##1}} % Getting the section name right
		%\fancyhead[RO,LE]{\thepage} % page number on the outside of headers
		\renewcommand{\footrulewidth}{0.4pt}
		\fancyfoot[C]{\thepage}
		\setcounter{page}{2} % Include the title page in page counting
		\thesisspacing % Double spacing
	}

	\newcommand{\includepublications}{}
\else
	\LoadClass[12pt, oneside]{book} % 12 pt font, one-sided book style
	
	\RequirePackage[a4paper, includehead, headheight=0.6cm, inner=3cm ,outer=3cm, top=3cm, bottom=3cm]{geometry}
	
	\RequirePackage[bf, font=onehalfspacing]{caption} % caption: FIG in bold, 1.5 line spacing in figure and table captions

	\newcommand{\thesisspacing}{\onehalfspacing}

	\newcommand{\numberedchapter}{ % Preparation for numbered chapters
		\cleardoublepage % To make sure the previous headers are passed
		\lhead{\bfseries \leftmark} % Header
	}
	
	\newcommand{\unnumberedchapter}[1]{ % Preparation for unnumbered chapters
		\cleardoublepage % To make sure the previous headers are passed
		\phantomsection % To help hyperref link to the right page
		\renewcommand{\footrulewidth}{0.4pt}
		\fancyfoot[C]{\thepage}
		\addcontentsline{toc}{chapter}{#1} % Also adds the chapter name to the Contents
		\lhead{\bfseries #1} % Header
	}

	\newcommand{\startpreamble}{
		\pagestyle{fancy} % Change the header style
		\fancyhf{}% Clear header and footer
		\renewcommand{\chaptermark}[1]{\markboth{##1}{}} % Getting the chapter name right
		%\rhead{\thepage} % Page number at the right of the header
		\renewcommand{\footrulewidth}{0.4pt}
		\fancyfoot[C]{\thepage}
		\frontmatter % Use roman page numbering style (i, ii, iii, iv...) for the preamble pages
		\setcounter{page}{2} % Include the title page in page counting
		\thesisspacing % Double or single spacing
	}

	\newcommand{\includepublications}{
		\input{./MainText/publications}
	}
\fi