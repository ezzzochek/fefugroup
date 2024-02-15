\ProvidesClass{details/workbookv1}[2022/08/26 V0.1 Андрей Чусов]
\typeout{Учебное пособие ДВФУ}
\NeedsTeXFormat{LaTeX2e}

\LoadClass[oneside]{book}
\RequirePackage[russian]{babel}
\babelprovide[alph=lower, Alph=upper]{russian}
\RequirePackage[sortcites,backend=biber,autocite=plain,sorting=nty,giveninits=true]{biblatex}
%\renewcommand*{\bibfont}{\Large}
\RequirePackage[paper=a4paper]{geometry}
\RequirePackage{fontspec}
\RequirePackage[tableposition=above, figureposition=below]{caption}
\RequirePackage{fancyhdr}
\RequirePackage{titlesec}
\RequirePackage{tocloft}
\RequirePackage{tikz}
\usetikzlibrary{calc}
\RequirePackage{etoolbox}
%\RequirePackage{floatrow}
\RequirePackage{details/counttotal}
\RequirePackage[pdfencoding=auto, hidelinks]{hyperref}
\RequirePackage[numbered, depth=3, openlevel=1]{bookmark}

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

\let\ttfamily@old\ttfamily
\newcommand{\ttfamily@set}[2]{\renewcommand{\ttfamily}{\ttfamily@old\fontsize{#1}{#2}\selectfont}}

\def\tiny{\fontsize{7pt}{8.4pt}\selectfont\ttfamily@set{6pt}{8.4pt}}
\def\scriptsize{\fontsize{8pt}{9.6pt}\selectfont\ttfamily@set{7pt}{9.6pt}}
\def\footnotesize{\fontsize{9pt}{10.8pt}\selectfont\ttfamily@set{8pt}{10.8pt}}
\def\small{\fontsize{11pt}{13.2pt}\selectfont\ttfamily@set{9pt}{13.2pt}}
\def\normalsize{\fontsize{12pt}{14.4pt}\selectfont\ttfamily@set{10pt}{14.4pt}}
\def\large{\fontsize{14pt}{16.8pt}\selectfont\ttfamily@set{12pt}{16.8pt}}
\def\Large{\fontsize{16pt}{19.2pt}\selectfont\ttfamily@set{14pt}{19.2pt}}
\def\LARGE{\fontsize{17.28pt}{21.6pt}\selectfont\ttfamily@set{16pt}{21.6pt}}
\def\huge{\fontsize{20pt}{24pt}\selectfont\ttfamily@set{17.28pt}{24pt}}
\def\Huge{\fontsize{22pt}{26.4pt}\selectfont\ttfamily@set{20pt}{26.4pt}}

\newdimen\wb@parindent\wb@parindent1.25cm
\newskip\wb@parskip\wb@parskip\z@ plus1em minus 0.1em
\newcount\wb@secsecvpenalty\wb@secsecvpenalty\@highpenalty

\DeclarePrintbibliographyDefaults{title=Список библиографических источников}

\pagestyle{empty}

\hbadness=10000

\captionsetup[figure]
{
	name={Рис},
	font={small},%
	justification={centering},%
	labelsep={period},%
	labelformat=simple,%
	figurewithin=chapter
}
\DeclareCaptionLabelFormat{wbtable}{\hspace*{\fill}#1 #2}
\captionsetup[table]
{
	name={Таблица},
	textfont={small, bf},%
	labelfont=small,
	labelformat=wbtable,
	justification={centering},%
	labelsep={newline},%
	%labelformat=simple,
	tablewithin=chapter,
	singlelinecheck=false
}

\AtBeginDocument{%
	%algorithm2e redefinition in case it is used
	\def\algocf@captiontext#1#2{Алгоритм \thealgocf{}. \AlCapNameFnt{}#2}
}

%\counterwithout{equation}{section} % undo numbering system provided by phstyle.cls
\counterwithin{equation}{chapter}  % implement desired numbering system

\renewcommand\cfttoctitlefont{\normalfont\normalsize}
\renewcommand\cftchapfont{\normalfont\normalsize}
\renewcommand\cftchappagefont{\normalfont\normalsize}
\renewcommand\cftsecpagefont{\normalfont\normalsize}
\renewcommand\cftsecfont{\normalfont\normalsize}
\setlength\cftbeforetoctitleskip{-1em}
\setlength\cftaftertoctitleskip{-1em}
\setlength\cftbeforechapskip{-1ex}
\setlength\cftbeforesecskip{-1ex}
\renewcommand\cftparskip{6pt}
\renewcommand{\cftchapleader}{\cftdotfill{0}}
\renewcommand{\cftsecleader}{\cftdotfill{0}}
\renewcommand{\cftsubsecleader}{\cftdotfill{0}}
\renewcommand{\cftmarktoc}{}
\setcounter{tocdepth}{1}
%\cftsetindents{section}{2ex}{2ex}
%\cftsetindents{subsection}{\z@}{\z@}
\addtocontents{toc}{\protect\thispagestyle{empty}}

\def\fps@figure{htbp}
\def\fps@table{htbp}
\setcounter{totalnumber}{5}
\setcounter{topnumber}{5}
\renewcommand{\topfraction}{.9}
\renewcommand{\textfraction}{.1}
\renewcommand{\bottomfraction}{.9}
\renewcommand{\floatpagefraction}{0.8}

\interfootnotelinepenalty=\@M

\AtBeginDocument{%
	\renewcommand\contentsname{\hspace{\fill}{\bfseries{}ОГЛАВЛЕНИЕ}\hspace*{\fill}\vspace{1em}\par\nobreak\@afterheading}
	\let\@toc\tableofcontents%
	\renewcommand\tableofcontents{\clearpage\@toc\thispagestyle{empty}\normalsize}
}

\pdfstringdefDisableCommands{%
	\def\XeLaTeX{XeLaTeX}
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

\newif\if@wb@aftersection\@wb@aftersectionfalse

\def\wb@addchapter#1{
	{\centering\bfseries#1\par}
	\parindent\wb@parindent
	\nobreak\@afterheading
}

\NewDocumentCommand{\wb@chapter}{som} {
	\tl_set:Nn \l_tmpa_tl {#3}
	\remove_trailing_period:N \l_tmpa_tl
	\regex_replace_all:nnN {"(.*)"}{«\1»} \l_tmpa_tl
	\str_if_eq:eeTF{\str_foldcase:V \l_tmpa_tl}{\str_foldcase:n{введение}}{\pagestyle{plain}}{}
	\str_if_eq:eeTF{\str_foldcase:V \l_tmpa_tl}{\str_foldcase:n{предисловие}}{\pagestyle{plain}}{}
	\clearpage
	\parindent\z@
	\IfBooleanTF{#1}{
		\tl_set:Nx \l_tmpb_tl {\text_uppercase:n{\tl_use:N \l_tmpa_tl}}
	}{
		\refstepcounter{chapter}
		\tl_set:Nx \l_tmpb_tl {Глава\ \protect{\thechapter}.\ \text_uppercase:n{\tl_use:N \l_tmpa_tl}}
	}
	\wb@addchapter{\tl_use:N \l_tmpb_tl}
	\addcontentsline{toc}{chapter}{\tl_use:N \l_tmpb_tl}
	\@wb@aftersectiontrue\everypar{\@wb@aftersectionfalse\everypar{}}
	\IfValueT{#2}{\label{#2}}
	\vskip1ex plus 0.5ex minus 0.2ex
}

\NewDocumentCommand{\wb@appendix}{som} {
	\tl_set:Nn \l_tmpa_tl {#3}
	\remove_trailing_period:N \l_tmpa_tl
	\clearpage
	\parindent\z@
	\IfBooleanTF{#1}{
		\captionsetup*[figure]{figurewithin=none}
		\captionsetup*[table]{tablewithin=none}
		\setcounter{figure}{\z@}
		\setcounter{table}{\z@}
		\wb@addchapter{Приложение\\\tl_use:N \l_tmpa_tl}
		\addcontentsline{toc}{chapter}{Приложение.\ \tl_use:N \l_tmpa_tl}
	}{
		\refstepcounter{appendix}
		\wb@addchapter{Приложение\ \protect{\@Alph\theappendix}\\\tl_use:N \l_tmpa_tl}
		\addcontentsline{toc}{chapter}{Приложение\ \protect{\@Alph\theappendix}.\ \tl_use:N \l_tmpa_tl}
	}
	\@wb@aftersectiontrue\everypar{\@wb@aftersectionfalse\everypar{}}
	\IfValueT{#2}{\label{#2}}
	\vskip1ex plus 0.5ex minus 0.2ex
}

\RenewDocumentCommand{\chapter}{}{\wb@chapter}

\NewDocumentCommand{\wb@addsection}{m}{
	{\centering\bfseries#1\par}
	\nobreak\@afterheading
	\parindent\wb@parindent
}

\NewDocumentCommand{\wb@section}{som}{
	\tl_set:Nn \l_tmpa_tl {#3}
	\regex_replace_all:nnN {"(.*)"}{«\1»} \l_tmpa_tl
	\remove_trailing_period:N \l_tmpa_tl
	\ifhmode\par\fi
	\addvspace{1ex plus 0.5ex minus 0.1ex}
	\parindent\z@
	\if@wb@aftersection\penalty\wb@secsecvpenalty\fi
	\IfBooleanTF {#1} {
		\addcontentsline{toc}{section}{\tl_use:N \l_tmpa_tl}
		\wb@addsection{\tl_use:N \l_tmpa_tl}
	}{
		\refstepcounter{section}
		\addcontentsline{toc}{section}{\protect{\thesection}\ \tl_use:N \l_tmpa_tl}
		\wb@addsection{\protect{\thesection}.\ \tl_use:N \l_tmpa_tl}
	}
	\@wb@aftersectiontrue\everypar{\@wb@aftersectionfalse\everypar{}}
	\IfValueT{#2}{\label{#2}}
	\vskip1ex plus 0.5ex minus 0.2ex
}

\RenewDocumentCommand{\section}{}{\wb@section}

\NewDocumentCommand{\wb@addsubsection}{m}{
	{\centering\bfseries\itshape#1\par}
	\par\nobreak\@afterheading
	\parindent\wb@parindent
}

\NewDocumentCommand{\wb@subsection}{som}{
	\tl_set:Nn \l_tmpa_tl {#3}
	\regex_replace_all:nnN {"(.*)"}{«\1»} \l_tmpa_tl
	\remove_trailing_period:N \l_tmpa_tl
	\parindent\z@\ifhmode\par\fi
	\addvspace{1ex plus 0.5ex minus 0.1ex}
	\if@wb@aftersection\penalty\wb@secsecvpenalty\fi
	\IfBooleanTF{#1}{
		\addcontentsline{toc}{subsection}{\tl_use:N \l_tmpa_tl}
		\wb@addsubsection{\tl_use:N \l_tmpa_tl}
	}{
		\refstepcounter{subsection}
		\addcontentsline{toc}{subsection}{\protect{\thesubsection}.\ \tl_use:N \l_tmpa_tl}
		\wb@addsubsection{\protect{\thesubsection}.\ \tl_use:N \l_tmpa_tl}
	}
	\@wb@aftersectiontrue\everypar{\@wb@aftersectionfalse\everypar{}}
	\IfValueT{#2}{\label{#2}}
	\vskip1ex plus 0.5ex minus 0.2ex
}

\RenewDocumentCommand{\subsection}{}{\wb@subsection}

\NewDocumentCommand{\wb@addsubsubsection}{m}{
	\textbf{#1}
	\vadjust{\nobreak\@afterheading}
}

\NewDocumentCommand{\wb@subsubsection}{som}{
	\tl_set:Nn \l_tmpa_tl {#3}
	\regex_replace_all:nnN {"(.*)"}{«\1»} \l_tmpa_tl
	\tl_set_eq:NN \l_tmpb_tl \l_tmpa_tl
	\remove_trailing_period:N \l_tmpb_tl
	\ifhmode\par\fi
	\addvspace{0.5em plus 0.5em minus 0.1em}
	\if@wb@aftersection\penalty\wb@secsecvpenalty\fi
	\IfBooleanTF{#1}{
		\addcontentsline{toc}{subsubsection}{\tl_use:N \l_tmpb_tl}
		\wb@addsubsubsection{\tl_use:N \l_tmpa_tl}
	}{
		\refstepcounter{subsubsection}
		\addcontentsline{toc}{subsubsection}{\protect{\thesubsubsection}\ \tl_use:N \l_tmpb_tl}
		\wb@addsubsubsection{\protect{\thesubsubsection}.\ \tl_use:N \l_tmpa_tl}
	}
	\@wb@aftersectiontrue\everypar{\@wb@aftersectionfalse\everypar{}}
	\IfValueT{#2}{\label{#2}}
}

\RenewDocumentCommand{\subsubsection}{}{\wb@subsubsection}

\RenewDocumentCommand{\appendix}{}{\par
	\newcounter{appendix}
	\committotalcounters{}
	\renewcommand{\appendixname}{}
	\gdef\thechapter{\@Alph\c@appendix}
	\renewcommand{\chapter}{\wb@appendix}
}
\ExplSyntaxOff

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
\DeclareFieldFormat{title}{#1}
\DeclareFieldFormat{subtitle}{#1}
\DeclareBibliographyDriver{standard}
{%
	\printfield{title}%
	\newunit
	\printfield{subtitle}%
	\newunit\newblock
	\printfield{type}%
	\newunit\newblock
	\printlist{organization}%
	\newunit
	\printfield{month}, \printfield{year}%
	\finentry
}
\DeclareSourcemap{
	\maps[datatype=bibtex]{
		\map[overwrite]
		{
			\step[fieldsource=author, match=\regexp{^[А-Яа-я].+}, final]
			\step[fieldset=presort, fieldvalue=1, append]
		}
		\map[overwrite]
		{
			\step[notfield=author, final]
			\step[fieldsource=title, match=\regexp{^[А-Яа-я].+}, final]
			\step[fieldset=presort, fieldvalue=1, append]
		}
		\map[overwrite]
		{
			\step[fieldsource=author, match=\regexp{^[A-Za-z].+}, final]
			\step[fieldset=presort, fieldvalue=2, append]
		}
		\map[overwrite]
		{
			\step[notfield=author, final]
			\step[fieldsource=title, match=\regexp{^[A-Za-z].+}, final]
			\step[fieldset=presort, fieldvalue=2, append]
		}
	}
}
\defbibenvironment{bibliography}{\begin{itemlist}}{\end{itemlist}}{\item}%
\renewbibmacro*{url}{\printfield[url]{urlraw}}

\ExplSyntaxOn
\NewDocumentCommand {\authors} {m} {
	\seq_if_empty:NTF {\seq_author_name} {} {\ClassError{details/workbookv1}{Authors~of~the~workbook~were~specefied~more~than~once}}
	\clist_set:Nn \l_tmpa_clist {#1}
	\clist_use:Nn \l_tmpa_clist {}
}
\seq_clear_new:N \seq_author_name
\seq_clear_new:N \seq_author_degree
\seq_clear_new:N \seq_author_employment
\seq_clear_new:N \seq_author_affiliation
\cs_new_protected:Nn \tl_normalize_affiliation:N {\regex_replace_once:nnN {^([^,]+),\ *([\w\-А-Яа-я]+)$}{\1\ \(\2\)} #1}
\DeclareDocumentCommand{\author} {m m O{Дальневосточный~федеральный~университет~(Владивосток)} m} {
	\seq_put_right:Nn \seq_author_degree{#1}
	\seq_put_right:Nn \seq_author_employment{#2}
	\tl_set:Nn \l_tmpa_tl {#3}
	\tl_normalize_affiliation:N \l_tmpa_tl
	\seq_put_right:NV \seq_author_affiliation \l_tmpa_tl
	\seq_put_right:Nn \seq_author_name {#4}
}
\NewDocumentCommand{\theauthorname}{O{1}} {
	\seq_item:Nn \seq_author_name {#1}
}
\NewDocumentCommand{\theauthordegree}{O{1}} {
	\seq_item:Nn \seq_author_degree {#1}
}
\NewDocumentCommand{\theauthoremployment} {O{1}} {
	\seq_item:Nn \seq_author_employment{#1}
}
\tl_clear_new:N \tl_institute
\NewDocumentCommand{\institute}{m}{\tl_set:Nn \tl_institute {#1}}
\NewDocumentCommand{\theinstitute}{} {\tl_use:N \tl_institute}
\tl_clear_new:N \tl_udc
\NewDocumentCommand{\udc}{m}{\tl_set:Nn \tl_udc {#1}}
\NewDocumentCommand{\theudc}{}{\tl_use:N \tl_udc}
\tl_clear_new:N \tl_bbc
\NewDocumentCommand{\bbc}{m}{\tl_set:Nn \tl_bbc {#1}}
\NewDocumentCommand{\thebbc}{}{\tl_use:N \tl_bbc}
\tl_clear_new:N \tl_amark
\NewDocumentCommand{\amark}{m}{\tl_set:Nn \tl_amark {#1}}
\NewDocumentCommand{\theamark}{}{\tl_use:N \tl_amark}
\tl_clear_new:N \tl_isbn
\NewDocumentCommand{\isbn}{m}{\tl_set:Nn \tl_isbn {#1}}
\NewDocumentCommand{\theisbn}{}{\tl_use:N \tl_isbn}
\tl_clear_new:N \tl_copyrighttext
\NewDocumentCommand{\copyrighttext}{m}{\tl_set:Nn \tl_copyrighttext {#1}}
\NewDocumentCommand{\thecopyrighttext}{}{\tl_use:N \tl_copyrighttext}
\tl_new:N \tl_location
\tl_set:Nn \tl_location {Владивосток}
\NewDocumentCommand{\location}{m}{\tl_set:Nn \tl_location {#1}}
\NewDocumentCommand{\thelocation}{}{\tl_use:N \tl_location}
\NewExpandableDocumentCommand{\thetitle}{}{\@title}
\tl_clear_new:N \tl_issue
\NewDocumentCommand{\issue}{m}{\tl_set:Nn \tl_issue {#1}}
\NewDocumentCommand{\theissue}{}{\tl_use:N \tl_issue}
\tl_clear_new:N \tl_issuetype
\NewDocumentCommand{\issuetype}{m}{\tl_set:Nx \tl_issuetype {#1}}
\NewDocumentCommand{\theissuetype}{}{\tl_use:N \tl_issuetype}
\tl_clear_new:N \tl_recommendation
\NewDocumentCommand{\recommendation}{m}{\tl_set:Nn \tl_recommendation {#1}}
\NewDocumentCommand{\therecommendation}{}{\tl_use:N \tl_recommendation}
\seq_clear_new:N \seq_reviewer_name
\seq_clear_new:N \seq_reviewer_degree
\seq_clear_new:N \seq_reviewer_employment
\NewDocumentEnvironment{reviewers}{} {
	\seq_if_empty:NTF \seq_reviewer_name {}{\ClassError{details/workbookv1}{Reviewers~are~specified~more~than~once}}
}{}
\NewDocumentCommand{\reviewer}{m m m} {
	\seq_gput_right:Nn \seq_reviewer_name {#3}
	\seq_gput_right:Nn \seq_reviewer_degree {#1}
	\seq_gput_right:Nn \seq_reviewer_employment {#2}
}
\tl_clear_new:N \tl_annotation
\NewDocumentEnvironment{annotation} {+b}{}{\tl_gset:Nn \tl_annotation {#1}}
\seq_new:N \seq_keywords_ru
\seq_new:N \seq_keywords_en
\NewDocumentEnvironment{keywords}{O{ru}+b}{
	\tl_set:Nx \l_tmpa_tl {#1}
	\str_case_e:nnF {\str_foldcase:V{\l_tmpa_tl}} {
		{\str_foldcase:n{ru}}{\seq_gset_split:Nnn\seq_keywords_ru {,} {#2}}
		{\str_foldcase:n{en}}{\seq_gset_split:Nnn\seq_keywords_en {,} {#2}}
	}{\ClassError{details/workbook}{Unsupported~keywords~language~\str_foldcase:V \l_tmpa_tl}}
}{}
\NewDocumentEnvironment{publisherblock}{}{}{}
\seq_clear_new:N \seq_pub_info
\NewDocumentEnvironment{publisherinfo}{+b}{
	\seq_gput_right:Nn \seq_pub_info {#1}
}{}

\NewDocumentCommand{\publicationinfo}{+m}{
	\seq_gput_right:Nn \seq_pub_info {#1}
}

\RenewDocumentCommand{\titlepage}{} {
	\large
	\setlength{\parindent}{\z@}
	\begin{minipage}{\textwidth}
		\sffamily
		\begin{center}
			Дальневосточный~федеральный~университет
			\normalsize\\
			\theinstitute{}
		\end{center}
	\end{minipage}
	\vspace{7em}
	\par
	\begin{minipage}{\textwidth}
	\begin{center}
		\clist_clear:N \l_tmpa_clist
		\seq_map_inline:Nn \seq_author_name {
			\clist_put_right:Nn \l_tmpa_clist {\@fullnameinitialslastname{##1}}
		}
		\LARGE
		\clist_use:Nn \l_tmpa_clist {,~}\par
		\vspace{3em}
		\bfseries\text_uppercase:n {\thetitle}\normalfont\par
		\normalsize
		\tl_if_empty:NTF \tl_issue {\vspace{3em}}{\large\vspace{2em}\tl_use:N \tl_issue\par}
		\tl_if_empty:NTF \tl_issuetype {\vspace{3em}}{\vspace{1em}\fontsize{14 pt}{17pt}\selectfont\tl_use:N \tl_issuetype\par}
		\tl_if_empty:NTF \tl_recommendation {} {\itshape\vspace{2em}Рекомендовано\par\tl_use:N \tl_recommendation\normalfont\par}
		\ifdraught
			\vspace{1ex}
			\small
			\int_compare:nNnTF {\seq_count:N \seq_author_name} = {1} {
				Я\ подтверждаю
			}{
				Мы\ подтверждаем
			}
			,\ что\ эта\ работа\ является\ оригинальной\ и\ не\ была\ опубликована\ в\ другом\ месте.\ В\ настоящее\ время\ она\ не\ рассматривается\ для\ публикации\ в\ каком-либо\ другом\ издательстве.\\
			\vspace{1em}
			\clist_clear:N \l_tmpa_clist
			\def\wb@tikzline{\tikz\draw[overlay](0, -1pt) -- +(3cm, 0);\hspace{3cm}}
			\seq_map_inline:Nn \seq_author_name {
				\clist_put_right:Nn \l_tmpa_clist {\wb@tikzline\nobreakspace/\ \@fullnameinitialslastname{##1}\ /}
			}
			\clist_use:Nn \l_tmpa_clist {,\par\vspace{1ex}}.
		\fi
	\end{center}\end{minipage}
	\vspace*{\fill}
	\begin{center}
		\sffamily\normalsize
		\includegraphics[width=1.8cm, height=2.5cm]{details/leo-logo}\par
		\thelocation\par
		Издательство\ Дальневосточного\ федерального\ университета\par
		\the\year\par
		\normalfont\normalsize
	\end{center}
	\clearpage
}

\NewDocumentEnvironment{copyrightpage}{}{
	\fontsize{10pt}{11pt}\selectfont\setlength{\parindent}{\z@}\sffamily
	\begin{minipage}{\textwidth}
		УДК\ \theudc{}\\
		ББК\ \thebbc{}\\
		\hspace*{\widthof{ББК~}}\theamark
	\end{minipage}
	\par\fontsize{11pt}{13.5pt}\selectfont
}{
	\vspace{1em}\normalfont\setlength{\parindent}{\wb@parindent}
	Рецензенты:\ 
	\clist_clear:N \l_tmpa_clist
	\int_set:Nn \l_tmpa_int {\seq_count:N \seq_reviewer_name}
	\int_set:Nn \l_tmpb_int {1}
	\int_do_while:nn {\l_tmpb_int <= \l_tmpa_int}{
		\clist_clear:N \l_tmpb_clist
		\clist_put_right:Nx \l_tmpb_clist {\exp_not:N \itshape \@fullnameinitialslastname{\seq_item:Nn \seq_reviewer_name {\int_use:N \l_tmpb_int}} \exp_not:N \normalfont}
		\tl_set:Nx \l_tmpa_tl {\seq_item:Nn \seq_reviewer_degree {\int_use:N \l_tmpb_int}}
		\tl_if_empty:NTF \l_tmpa_tl {} {
			\abbreviate_degree_short:N \l_tmpa_tl
			\clist_put_right:Nx \l_tmpb_clist {\tl_use:N \l_tmpa_tl	}
		}
		\clist_put_right:Nx \l_tmpb_clist {\seq_item:Nn \seq_reviewer_employment {\int_use:N \l_tmpb_int}}
		\clist_put_right:Nx \l_tmpa_clist {{\clist_use:Nn \l_tmpb_clist {,~}}}
		\int_incr:N \l_tmpb_int
	}
	\clist_use:Nn \l_tmpa_clist {;~}.\par
	\vspace{1em}
	\begin{center}
		\int_compare:nNnTF {\seq_count:N \seq_author_name} < {2} {
			\textit{Автор}\par
			\textbf{\seq_item:Nn \seq_author_name {1}}~---~
			\clist_clear:N \l_tmpa_clist
			\tl_set:Nx \l_tmpa_tl {\seq_item:Nn \seq_author_degree {1}}
			\tl_if_empty:NF \l_tmpa_tl {
				\abbreviate_degree_short:N \l_tmpa_tl
				\clist_put_right:Nx \l_tmpa_clist \l_tmpa_tl
			}
			\clist_put_right:Nx \l_tmpa_clist {\seq_item:Nn \seq_author_employment {1}}
			\clist_use:Nn \l_tmpa_clist {,~}\par
			\tl_set:Nx \l_tmpa_tl {\seq_item:Nn \seq_author_affiliation {1}}
			\regex_replace_once:nnNF {^([^\(]*)\(([\w\-А-Яа-я]+)\)$} {\c{textit}{\1}\ \(\2\)} \l_tmpa_tl {
				\ClassWarning{details/workbook1}{Unrecognized~author~affiliation~pattern}
			}
			\tl_use:N \l_tmpa_tl\par
		}{
			\textit{Авторы}\par
			\seq_set_eq:NN \l_tmpa_seq \seq_author_affiliation
			\seq_remove_duplicates:N \l_tmpa_seq
			\int_compare:nNnTF {\seq_count:N \l_tmpa_seq} = {1} {
				\int_set:Nn \l_tmpa_int {1}
				\int_set:Nn \l_tmpb_int {\seq_count:N \seq_author_name}
				\int_do_while:nn {\l_tmpa_int <= \l_tmpb_int} {
					\textbf{\seq_item:Nn \seq_author_name {\int_use:N \l_tmpa_int}}~---~
					\clist_clear:N \l_tmpa_clist
					\tl_set:Nx \l_tmpa_tl {\seq_item:Nn \seq_author_degree {\int_use:N \l_tmpa_int}}
					\tl_if_empty:NF \l_tmpa_tl {
						\abbreviate_degree_short:N \l_tmpa_tl
						\clist_put_right:Nx \l_tmpa_clist \l_tmpa_tl
					}
					\clist_put_right:Nx \l_tmpa_clist {\seq_item:Nn \seq_author_employment {\int_use:N \l_tmpa_int}}
					\clist_use:Nn \l_tmpa_clist {,~}\par
					\int_incr:N \l_tmpa_int
				}
				\tl_set:Nx \l_tmpa_tl {\seq_item:Nn \seq_author_affiliation {1}}
				\regex_replace_once:nnNF {^([^\(]*)\(([\w\-А-Яа-я]+)\)$} {\c{textit}{\1}\ \(\2\)} \l_tmpa_tl {
					\ClassWarning{details/workbook1}{Unrecognized~author~affiliation~pattern}
				}
				\tl_use:N \l_tmpa_tl\par
			}{
				\int_set:Nn \l_tmpa_int {1}
				\int_set:Nn \l_tmpb_int {\seq_count:N \seq_author_name}
				\int_do_while:nn {\l_tmpa_int <= \l_tmpb_int} {
					\textbf{\seq_item:Nn \seq_author_name {\int_use:N \l_tmpa_int}}~---~
					\clist_clear:N \l_tmpa_clist
					\tl_set:Nx \l_tmpa_tl {\seq_item:Nn \seq_author_degree {\int_use:N \l_tmpa_int}}
					\tl_if_empty:NF \l_tmpa_tl {
						\abbreviate_degree_short:N \l_tmpa_tl
						\clist_put_right:Nx \l_tmpa_clist \l_tmpa_tl
					}
					\clist_put_right:Nx \l_tmpa_clist {\seq_item:Nn \seq_author_employment {\int_use:N \l_tmpa_int}}
					\clist_use:Nn \l_tmpa_clist {,~}\par
					\tl_set:Nx \l_tmpa_tl {\seq_item:Nn \seq_author_affiliation {\int_use:N \l_tmpa_int}}
					\regex_replace_once:nnNF {^([^\(]*)\(([\w\-А-Яа-я]+)\)$} {\c{textit}{\1}\ \(\2\)} \l_tmpa_tl {
						\ClassWarning{details/workbook1}{Unrecognized~author~affiliation~pattern}
					}
					\tl_use:N \l_tmpa_tl\par
					\int_incr:N \l_tmpa_int
				}
			}
		}
	\end{center}
	\clist_clear:N \l_tmpa_clist
	\seq_map_inline:Nn \seq_author_name {
		\tl_set:Nn \l_tmpa_tl {##1}
		\fullname_to_lastname_initials:N \l_tmpa_tl
		\clist_put_right:NV \l_tmpa_clist \l_tmpa_tl
	}
	\setlength{\parindent}{\wb@parindent}\par\textbf{\clist_use:Nn \l_tmpa_clist {,\ }}\ 
	\thetitle{}:~учебное~пособие~для~вузов~/~Политехнический~институт~ДВФУ.
	\tl_if_empty:NF \tl_issue {\ --\ \tl_set:No \l_tmpa_tl \tl_issue \abbreviate_issue:N\l_tmpa_tl \tl_use:N \l_tmpa_tl}
	\ --\ \tl_set:No \l_tmpa_tl {\tl_location :\ Изд-во\ Дальневост.\ федеральн.\ ун-та}
	\tl_use:N \l_tmpa_tl,\ \the\year{}.\ --\ 1\nobreakspace{}CD.\ [\totalpagecount*\ с.].\ --\ Систем.\ требования:\ Acrobat\ Reader,\ Foxit\ Reader\ либо\ другой\ их\ аналог.\ --\ ISBN\ \tl_use:N \tl_isbn.\ --\ Текст:\ электронный.\par
	\vspace{1em}\tl_use:N \tl_annotation\par
	\seq_if_empty:NF \seq_keywords_ru {\itshape Ключевые\ слова:\normalfont\ \seq_use:Nn \seq_keywords_ru {,\ }}\par
	\seq_if_empty:NF \seq_keywords_en {\itshape Keywords:\normalfont\ \seq_use:Nn \seq_keywords_en {,\ }}\par
	\vspace*{\fill}
	\seq_if_empty:NF \seq_pub_info {
		\begin{center}
			\fontsize{10pt}{13.5pt}\selectfont
			\let\oldnl\\
			\def\\{\oldnl\relax}
			\seq_use:Nn \seq_pub_info {\par\vspace{1em}}
			\let\\\oldnl
		\end{center}
	}
	\vspace{1em}
	\fontsize{10pt}{13pt}\selectfont
	\setlength{\parindent}{\z@}
	\hspace{\fill}Защищено\ от\ копирования \\
	ISBN\ \tl_use:N \tl_isbn \hspace{\fill}\copyright{}\ ФГАОУ\ ВО\ \quot{ДВФУ},\ \the\year
	\clearpage
	\normalfont\normalsize
}

\newcounter{wb@assignment} %задачи
\counterwithin{wb@assignment}{chapter}
\NewDocumentCommand{\assignmentlist}{O{Задачи\ для\ самостоятельного\ решения}}{\section*{#1}\setcounter{wb@assignment}{\z@}}
\NewDocumentCommand{\assignment}{+o} {
	\ifhmode\par\fi\parindent\z@
	\addvspace{1ex}
	\if@wb@aftersection\penalty\wb@secsecvpenalty\fi
	\refstepcounter{wb@assignment}
	{\centering\bfseries\itshape{}Задача\ \thewb@assignment\relax\IfValueT{#1}{.\ #1.}\par\nobreak\@afterheading}
	\parindent\wb@parindent
	\@wb@aftersectiontrue\everypar{\@wb@aftersectionfalse\everypar{}}
}

\ExplSyntaxOff
\let\totalprintlists@base\totalprintlists
\renewcommand{\totalprintlists}{\@ifstar{\totalprintlists@base*{250}{2159}}{\totalprintlists@base{250}{2159}}}
\input{details/contractions.def}

\AtBeginDocument{%
	\parskip\wb@parskip
	\parindent\wb@parindent
}
