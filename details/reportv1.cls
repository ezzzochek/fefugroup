\ProvidesClass{details/reportv1}[2022/08/26 V0.1 Андрей Чусов]
\typeout{Реферат ДВФУ}
\NeedsTeXFormat{LaTeX2e}

\LoadClass[oneside]{article}
\RequirePackage[russian]{babel}
\babelprovide[alph=lower, Alph=upper]{russian}
\RequirePackage[sortcites,backend=biber,autocite=plain,sorting=nty,giveninits=true]{biblatex}
\renewcommand*{\bibfont}{\Large}
\RequirePackage[paper=a4paper]{geometry}
\RequirePackage{fontspec}
\RequirePackage{details/fefudocelements}
\RequirePackage{caption}
\RequirePackage{fancyhdr}
\RequirePackage{titlesec}
\RequirePackage{tocloft}
\RequirePackage{tikz}
\usetikzlibrary{calc}
\RequirePackage{etoolbox}

\geometry{
	paperwidth = 210mm,
	paperheight = 297mm,
	left = 3cm,
	top = 2cm,
	right = 1.5cm,
	bottom = 2cm,
	footskip = 1cm,
	mag = 1000,
	a4paper
}

\IfFontExistsTF{Times New Roman}{%
	\setmainfont{Times New Roman}%
}{\IfFontExistsTF{Liberation Serif}{%
	\setmainfont{Liberation Serif}%
}{\IfFontExistsTF{Times}{%
	\setmainfont{Times}%
}}}

\IfFontExistsTF{Liberation Mono}{%
	\setmonofont{Liberation Mono}%
}{\IfFontExistsTF{Courier New}{%
	\setmonofont{Courier New}%
}{\IfFontExistsTF{Courier}{%
	\setmonofont{Courier}%
}{\IfFontExistsTF{Consolas}{%
	\setmonofont{Consolas}%
}{\IfFontExistsTF{Hack}{%
	\setmonofont{Hack}%
}}}}}

\IfFontExistsTF{Arial}{%
	\setsansfont{Arial}%
}{\IfFontExistsTF{Liberation Sans}{%
	\setsansfont{Liberation Sans}%
}{\IfFontExistsTF{Helvetica}{%
	\setsansfont{Helvetica}%
}{\IfFontExistsTF{FreeSans}{%
	\setsansfont{FreeSans}%
}{\IfFontExistsTF{TeX Gyre Heros}{%
	\setsansfont{TeX Gyre Heros}%
}}}}}

\pagestyle{plain}
\fancyhf{}
\fancyfoot[R]{\thepage}
\fancypagestyle{plain}{%
    \renewcommand{\headrulewidth}{\z@}%
    \fancyhf{}%
    \fancyfoot[R]{\thepage}%
}

\def\@parindent{\@z}

\hbadness=10000

\captionsetup[figure]
{
	name={Рисунок},
	font={normal},%
	justification={centering},%
	labelsep={endash},%
	labelformat=simple,%
	figurewithin=none
}
\captionsetup[table]
{
	name={Таблица},
	font={normal},%
	justification={justified},%
	labelsep={endash},%
	labelformat=simple,%
	figurewithin=none,
	singlelinecheck=false
}

\AtBeginDocument{%
%algorithm2e redefinition in case it is used
\def\algocf@captiontext#1#2{Алгоритм \thealgocf{} -- \AlCapNameFnt{}#2}
}

\AtBeginEnvironment{table}{\Large}

\counterwithout{equation}{section} % undo numbering system provided by phstyle.cls
%\counterwithin{equation}{chapter}  % implement desired numbering system

\renewcommand\cfttoctitlefont{\normalfont}
%\renewcommand\cftchapfont{\normalfont}
%\renewcommand\cftchappagefont{\normalfont}
\renewcommand\cftsecpagefont{\normalfont}
\renewcommand\cftsecfont{\normalfont}
\setlength\cftbeforetoctitleskip{-1em}
\setlength\cftaftertoctitleskip{-1em}
\renewcommand\cftparskip{\z@}
%\renewcommand{\cftchapleader}{\cftdotfill{0}}
\renewcommand{\cftsecleader}{\cftdotfill{0}}
\renewcommand{\cftsubsecleader}{\cftdotfill{0}}
\renewcommand{\cftmarktoc}{}
\setcounter{tocdepth}{2}
%\cftsetindents{section}{\z@}{\z@}
%\cftsetindents{subsection}{\z@}{\z@}
\addtocontents{toc}{\protect\thispagestyle{empty}}

\AtBeginDocument{%
	\renewcommand\contentsname{ОГЛАВЛЕНИЕ}
	\let\@toc\tableofcontents
	\renewcommand\tableofcontents{\@toc\thispagestyle{empty}\clearpage}
}

\ExplSyntaxOn
\cs_new_protected:Nn \remove_trailing_period:N {
	\regex_replace_once:nnN {(.*)\.$} {\1} #1
}
\NewDocumentCommand{\removetrailingperiod}{m} {
	\tl_set:Nn \l_tmpa_tl {#1}
	\remove_trailing_period:N \l_tmpa_tl
	\tl_use:N \l_tmpa_tl
}

\newcommand{\report@addsection}[1]{%
	\vspace*{0.5em}%
	\par\parindent\z@%
	\textbf{#1}%
	\par%
	\nopagebreak%
	\vspace*{0.5em}%
	\setlength{\parindent}{1cm}%
}

\NewDocumentCommand{\report@section}{sm}{
	\tl_set:Nn \l_tmpa_tl {#2}
	\remove_trailing_period:N \l_tmpa_tl
	\IfBooleanTF{#1}{
		\addcontentsline{toc}{section}{\tl_use:N \l_tmpa_tl}%
		\report@addsection{\tl_use:N \l_tmpa_tl}%
	}{
		\refstepcounter{section}%
		\addcontentsline{toc}{section}{\protect{\thesection}\ \tl_use:N \l_tmpa_tl}%
		\report@addsection{\hbox to 1cm{\protect{\thesection}}\tl_use:N \l_tmpa_tl}%
	}
}

\RenewDocumentCommand{\section}{}{\report@section}

\NewDocumentCommand{\report@addsubsection}{m}{%
	\vspace*{0.5em}%
	\par\parindent\z@%
	\textbf{#1}%
	\nopagebreak%
	\setlength{\parindent}{1cm}%
}

\NewDocumentCommand{\report@subsection}{sm}{
	\tl_set:Nn \l_tmpa_tl {#2}
	\remove_trailing_period:N \l_tmpa_tl
	\IfBooleanTF{#1}{
		\addcontentsline{toc}{subsection}{\tl_use:N \l_tmpa_tl}%
		\report@addsubsection{\tl_use:N \l_tmpa_tl.}%
	}{
		\refstepcounter{subsection}%
		\addcontentsline{toc}{subsection}{\protect{\thesubsection}\ \tl_use:N \l_tmpa_tl}%
		\report@addsubsection{\protect{\thesubsection}.\ \tl_use:N \l_tmpa_tl.}%
	}
}

\RenewDocumentCommand{\subsection}{}{\report@subsection}

\NewDocumentCommand{\report@addsubsubsection}{m}{%
	\vspace*{0.5em}%
	\par\parindent\z@%
	\textbf{\textit{#1}\ }%
	\nopagebreak%
	\setlength{\parindent}{1cm}%
}

\NewDocumentCommand{\report@subsubsection}{sm}{
	\IfBooleanTF {#1} {
		\addcontentsline{toc}{subsubsection}{#2}%
		\report@addsubsubsection{#2}%
	}{
		\refstepcounter{subsubsection}%
		\addcontentsline{toc}{subsubsection}{\protect{\thesubsection}\ #2}%
		\report@addsubsubsection{\protect{\thesubsubsection}.\ #2}%
	}
}

\RenewDocumentCommand{\subsubsection}{}{\report@subsubsection}
\ExplSyntaxOff

\let\ttfamily@old\ttfamily
\newcommand{\ttfamily@set}[2]{\renewcommand{\ttfamily}{\ttfamily@old\fontsize{#1}{#2}\selectfont}}

\def\tiny{\fontsize{7pt}{9pt}\selectfont\ttfamily@set{6pt}{9pt}}
\def\scriptsize{\fontsize{8pt}{10pt}\selectfont\ttfamily@set{7pt}{10pt}}
\def\footnotesize{\fontsize{9pt}{11pt}\selectfont\ttfamily@set{8pt}{11pt}}
\def\small{\fontsize{12pt}{14pt}\selectfont\ttfamily@set{9pt}{14pt}}
\def\normalsize{\fontsize{14pt}{16pt}\selectfont\ttfamily@set{12pt}{16pt}}
\def\large{\fontsize{17.28pt}{19pt}\selectfont\ttfamily@set{14pt}{19pt}}

\newcounter{itemlistctr}
\newcommand{\makenumlabel}[1]{#1.\hfill}
\newenvironment{itemlist}
{
	\begin{list}
    {\arabic{itemlistctr}}
    {\usecounter{itemlistctr}
     \setlength{\labelwidth}{1cm}
     \setlength{\labelsep}{0cm}
     \setlength{\leftmargin}{\z@}
     \setlength{\rightmargin}{\z@}
     \setlength{\itemindent}{2cm}
     \setlength{\itemsep}{\z@}
     \setlength{\parsep}{\z@}
     \setlength{\parskip}{\z@}
     \setlength{\partopsep}{\z@}
     \let\makelabel=\makenumlabel
    }
 }
{\end{list}}

\DeclareNameAlias{author}{family-given}
\DeclareSourcemap{
	\maps[datatype=bibtex]{
		\map[overwrite]
		{
			\step[fieldsource=author, match=\regexp{[A-Z].*}, final]
			\step[fieldset=presort, fieldvalue=2, append]
		}
		\map[overwrite]
		{
			\step[fieldsource=author, match=\regexp{[А-Я].*}, final]
			\step[fieldset=presort, fieldvalue=1, append]
		}
	}
}
\defbibenvironment{bibliography}{\begin{itemlist}}{\end{itemlist}}{\item}%

\def\@group{}
\renewcommand\author[2]{\def\@author{#2}\def\@authorshort{\@fullnameinitialslastname{#2}}\def\@group{#1}}
\newcommand\discipline[1]{\def\@discipline{#1}}
\newcommand\location[1]{\def\@location{#1}}
\ExplSyntaxOn
\tl_new:N \tl_specialty_code
\tl_new:N \tl_specialty_description
\NewDocumentCommand{\@specialtycode}{}{\tl_use:N \tl_specialty_code}
\NewDocumentCommand{\@specialtydescription}{}{\tl_use:N \tl_specialty_description}
\NewDocumentCommand{\specialty}{mo}{
	\tl_set:Nn \tl_specialty_code {#1}
	\IfValueTF{#2}{
		\tl_set:Nn \tl_specialty_description {#2}
	}{
		\decode_barchelor_specialty:Nn \tl_specialty_description {#1}
		\str_if_empty:NT \tl_specialty_description {
			\decode_master_specialty:Nn \tl_specialty_description {#1}
			\str_if_empty:NT \tl_specialty_description {
				\tl_set:Nn \tl_specialty_description {
					\todo{НЕИЗВЕСТНАЯ\ СПЕЦИАЛЬНОСТЬ\ #1}
				}
			}
		}
	}
}
\ExplSyntaxOff

\newcommand\profile[1]{\def\@Profile{#1}}
\def\@teacherfullname{}
\def\@teachershort{}
\def\@teacherdegree{}
\def\@teacherrank{}
\def\@teacheremployment{}
\newcommand\teacher[4]{\def\@teacherdegree{#1}\def\@teacherrank{#2}\def\@teacheremployment{#3}\def\@teacherfullname{#4}\def\@teachershort{\@fullnameinitialslastname{#4}}}

\ExplSyntaxOn
\NewDocumentCommand{\@makeshorttitles}{ m m m }
{
	\seq_clear:N \l_tmpa_seq
	\tl_set:Nx \l_tmpa_tl {#3}
	\tl_if_empty:NF \l_tmpa_tl {\abbreviate_employment:N \l_tmpa_tl \seq_put_right:NV \l_tmpa_seq { \l_tmpa_tl } }
	\tl_set:Nx \l_tmpa_tl {#1}
	\tl_if_empty:NF \l_tmpa_tl {\abbreviate_degree_short:N \l_tmpa_tl \seq_put_right:NV \l_tmpa_seq { \l_tmpa_tl } }
	\tl_set:Nx \l_tmpa_tl {#2}
	\tl_if_empty:NF \l_tmpa_tl {\abbreviate_rank_short:N \l_tmpa_tl \seq_put_right:NV \l_tmpa_seq { \l_tmpa_tl } }
	\seq_use:Nn \l_tmpa_seq {,~}
}
\NewDocumentCommand{\@makelongtitles}{ m m m }
{
	\seq_clear:N \l_tmpa_seq
	\tl_set:Nx \l_tmpa_tl {#3}
	\tl_if_empty:NF \l_tmpa_tl {\abbreviate_employment:N \l_tmpa_tl \seq_put_right:NV \l_tmpa_seq { \l_tmpa_tl } }
	\tl_set:Nx \l_tmpa_tl {#1}
	\tl_if_empty:NF \l_tmpa_tl {\abbreviate_degree_long:N \l_tmpa_tl \seq_put_right:NV \l_tmpa_seq { \l_tmpa_tl } }
	\tl_set:Nx \l_tmpa_tl {#2}
	\tl_if_empty:NF \l_tmpa_tl {\abbreviate_rank_long:N \l_tmpa_tl \seq_put_right:NV \l_tmpa_seq { \l_tmpa_tl } }
	\seq_use:Nn \l_tmpa_seq {,~}
}
\NewDocumentCommand{\decodespecialty} {m}
{
	\decode_barchelor_specialty:Nn \l_tmpa_str {#1}
	\str_if_empty:NTF \l_tmpa_str {
		\decode_master_specialty:Nn \l_tmpa_str {#1}
	}{}
	\str_if_empty:NTF \l_tmpa_str {
		\todo{Исправьте~код~специальности}{НЕИЗВЕСТНАЯ~СПЕЦИАЛЬНОСТЬ~#1}
	}{
		#1~\quot{\l_tmpa_str}
	}
}
\ExplSyntaxOff

\def\@reportfrontpage%
{%
	\@topblock
	\fontsize{14pt}{16pt}\selectfont
	\vspace{3em}

	\begin{center}
	\textbf{РЕФЕРАТ}
	
	по дисциплине \quot{\@discipline} \\
	направление \@specialtycode{}~\quot{\@specialtydescription{}} \\
	на тему \textbf{\quot{\@title}}
	\end{center}

	\vspace{4em}
	\setlength{\skip0}{8cm}
	\setlength{\skip1}{\widthof{Выполнил студент гр. \@group}}\ifdim\the\skip1>\the\skip0\relax\setlength{\skip0}{\the\skip1}\fi
	\setlength{\skip1}{\widthof{\@authorshort} + 3cm}\ifdim\the\skip1>\the\skip0\relax\setlength{\skip0}{\the\skip1}\fi
	\setlength{\skip1}{\widthof{Проверил \@makeshorttitles{\@teacherdegree}{\@teacherrank}{\@teacheremployment}}}\ifdim\the\skip1>\the\skip0\relax\setlength{\skip0}{\the\skip1}\fi
	\setlength{\skip1}{\widthof{\@teachershort} + 3cm}\ifdim\the\skip1>\the\skip0\relax\setlength{\skip0}{\the\skip1}\fi
	\hfill\begin{minipage}{\the\skip0}
	\setlength{\parindent}{0pt}%
	\setlength{\baselineskip}{20.1pt}%
	\hfill Выполнил студент гр. \@group \\
	\setlength{\skip1}{\the\skip0 - \widthof{ \@authorshort}}\tikz[overlay] \draw(0, -1pt) -- +(\the\skip1, 0);\hspace{\the\skip1} \@authorshort
	{\par\footnotesize\hspace{(\the\skip1 - \widthof{(подпись)})/2}\textit{(подпись)}\par}
	\vspace{1em}

	\hfill Проверил \@makeshorttitles{\@teacherdegree}{\@teacherrank}{\@teacheremployment} \\
	\setlength{\skip1}{\the\skip0 - \widthof{ \@teachershort}}\tikz[overlay] \draw(0, -1pt) -- +(\the\skip1, 0);\hspace{\the\skip1} \@teachershort \\
	\tikz[overlay]\draw(0, -1pt) -- +(\the\skip0, 0);
	{\par\footnotesize\hfill\textit{(оценка)}\hspace*{\fill}\par}
	\end{minipage}

	\vspace*{\fill}
	\begin{center}
	\hfill\@location\hspace*{\fill}

	\hfill\the\year\hspace*{\fill}
	\end{center}

	\pagebreak
}

\input{details/contractions.def}
\input{details/masterspecialties.def}
\input{details/barchelorspecialties.def}

\newcommand\frontpage{\@reportfrontpage}

\AtBeginDocument{}

