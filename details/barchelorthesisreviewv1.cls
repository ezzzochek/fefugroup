\ProvidesClass{details/barchelorthesisreviewv1}[2023/07/01 V0.1 Андрей Чусов]
\typeout{Отзыв на ВКР бакалавра в ДВФУ, версия 2023г.}
\NeedsTeXFormat{LaTeX2e}

\LoadClass[twoside]{article}
\RequirePackage[russian]{babel}
\babelprovide[alph=lower, Alph=upper]{russian}
\RequirePackage[paper=a4paper]{geometry}
\RequirePackage{fontspec}
\RequirePackage{lineno} %has to be above csquotes
\RequirePackage{soul}
\RequirePackage{tikz}
\usetikzlibrary{calc}
\RequirePackage{setspace}
\RequirePackage{xstring}
\RequirePackage[ddmmyyyy]{datetime}
\renewcommand{\dateseparator}{.}

\input{details/contractions.def}

\geometry{
	paperwidth = 210mm,
	paperheight = 297mm,
	left = 2cm,
	top = 1.5cm,
	right = 1.5cm,
	bottom = 2cm,
	footskip = 1cm,
	mag = 1000,
	a4paper
}

\IfFontExistsTF{Times New Roman}{%
	\setmainfont{Times New Roman}%
}{\IfFontExistsTF{LiberationSerif}{%
	\setmainfont{LiberationSerif}%
}{\IfFontExistsTF{Times}{%
	\setmainfont{Times}%
}}}

\pagestyle{plain}
\pagenumbering{gobble}

\def\@parindent{\@z}

\def\@Student{}
\def\@StudentShortened{}
\newcommand\student[1]{\def\@Student{#1}\def\@StudentShortened{\@fullnamelastnameinitials{#1}}}
\newcommand\subject[1]{\def\subject{#1}}
\def\@TutorName{}
\def\@TutorNameShortened{}
\ExplSyntaxOn
\clist_clear_new:N \clist_tutor_titles
\NewDocumentCommand{\@TutorTitles}{}{\clist_use:Nn \clist_tutor_titles {,\ }}
\newcommand\tutor[4]{
	\tl_set:Nn \l_tmpa_tl {#3}
	\abbreviate_employment:N \l_tmpa_tl
	\clist_put_right:NV \clist_tutor_titles \l_tmpa_tl
	\tl_set:Nn \l_tmpa_tl {#2}
	\abbreviate_rank_long:N \l_tmpa_tl
	\clist_put_right:NV \clist_tutor_titles \l_tmpa_tl
	\tl_set:Nn \l_tmpa_tl {#1}
	\abbreviate_degree_long:N \l_tmpa_tl
	\clist_put_right:NV \clist_tutor_titles \l_tmpa_tl
	\def\@TutorName{#4}
	\def\@TutorNameShortened{\@fullnamelastnameinitials{#4}}
}
\tl_clear_new:N \tl_specialty_code
\tl_clear_new:N \tl_specialty_description
\NewDocumentCommand{\@specialtystring}{}{
	\tl_if_empty:NF \tl_specialty_description {
		\tl_use:N \tl_specialty_code
		\ \quot{\tl_use:N \tl_specialty_description}
	}
}
\NewDocumentCommand{\specialty}{mo}{
	\tl_set:Nn \tl_specialty_code {#1}
	\IfValueTF{#2}{
		\tl_set:Nn \tl_specialty_description {#2}
	}{
		\decode_barchelor_specialty:Nn \tl_specialty_description {#1}
		\str_if_empty:NT \tl_specialty_description {
			\tl_set:Nn \tl_specialty_description {
				\todo{НЕИЗВЕСТНАЯ\ СПЕЦИАЛЬНОСТЬ\ #1}
			}
		}
	}
}
\ExplSyntaxOff
\newcommand\profile[1]{\def\profile{#1}}

\input{details/barchelorspecialties.def}

\newlength{\btr@defparskip}
\setlength{\btr@defparskip}{\the\parskip}
\def\btr@head#1{\setlength{\parskip}{1em}\par\textbf{#1}%
\setlength{\parskip}{\the\btr@defparskip}%
\nopagebreak\par%
}
\newcommand{\Actuality}{\btr@head{Актуальность работы}}
\newcommand{\WorkingProcess}{\btr@head{Характеристика работы обучающегося}}
\newcommand{\Drawbacks}{\btr@head{Замечания по работе обучающегося}}
\newcommand{\Defendable}[1][да]{\btr@head{Допуск к защите} Выпускная квалификационная работа студента \@StudentShortened\ по теме «\subject{}»
\lowercase{\def\param{#1}}%
\def\@positive{y}%
\def\@negative{n}%
\IfEqCase{\param}{%
{да}{\def\@response{y}}%
{д}{\def\@response{y}}%
{yes}{\def\@response{y}}%
{y}{\def\@response{y}}%
{нет}{\def\@response{n}}%
{н}{\def\@response{n}}%
{no}{\def\@response{n}}%
{n}{\def\@response{n}}%
}[\ClassError{details/barchelorthesisreviewv1}{Неверный ответ у Defendable}{Можно использовать "да" или "нет"}]%
\ifx\@response\@positive отвечает\else не отвечает\fi
\ основным требованиям, предъявляемым к квалификационным работам выпускника университета по направлению/специальности
\@specialtystring
\ и
\ifx\@response\@positive может быть\else не может быть\fi
\ рекомендована к защите.\par
}
\newcommand{\Mark}[1]{%
\lowercase{\def\param{#1}}%
\IfEqCase{\param}{%
{5}{\def\@result{отлично}\count32122=5}%
{отлично}{\def\@result{отлично}\count32122=5}%
{отл}{\def\@result{отлично}\count32122=5}%
{4}{\def\@result{хорошо}\count32122=4}%
{хорошо}{\def\@result{хорошо}\count32122=4}%
{хор}{\def\@result{хорошо}\count32122=4}%
{3}{\def\@result{удовлетворительно}\count32122=3}%
{удовлетворительно}{\def\@result{удовлетворительно}\count32122=3}%
{удовл}{\def\@result{удовлетворительно}\count32122=3}%
{2}{\def\@result{не удовлетворительно}\count32122=2}%
{не удовлетворительно}{\def\@result{не удовлетворительно}\count32122=2}%
{неуд}{\def\@result{не удовлетворительно}\count32122=2}%
{1}{\def\@result{не удовлетворительно}\count32122=1}%
{0}{\def\@result{не удовлетворительно}\count32122=0}%
}[\ClassError{details/barchelorthesisreviewv1}{Неверная оценка Mark}{\\Mark может принимать числовую оценку от 0 до 5}]%
\btr@head{Оценка труда выпускника (выпускницы)} Работу студента \@StudentShortened\ оцениваю на \@result. \ifnum \the\count32122 > 2 При успешной защите ВКР ему (ей) может быть присвоена квалификация бакалавра.\fi\par
}

\newcommand{\Recomendations}{\btr@head{Рекомендации}\count32122=\z@}
\newcommand{\RecomendedForScience}{\advance\count32122 by \@ne\the\count32122. Следует отметить склонность студента \@StudentShortened\ к научной работе.\par}
\newcommand{\RecomendedForPublication}{\advance\count32122 by \@ne\the\count32122. Результаты работы студента \@StudentShortened\ рекомендованы к опубликованию.\par}
\newcommand{\RecomendedForFurtherEducation}{\advance\count32122 by \@ne\the\count32122. \@StudentShortened\  может быть рекомендован(а) для продолжения обучения в магистратуре.\par}

\def\@reviewfront
{%
	\setlength\linenumbersep{0pt}%
	\setlength{\parindent}{0pt}%
	\fontsize{12pt}{13.5pt}\selectfont
	\begin{center}
	\textbf{ОТЗЫВ}\par
	\textbf{руководителя на работу обучающегося}\par
	\end{center}
	
	\vspace{1em}
	\begin{tikzpicture}[overlay]
	\draw (0.75cm, -1pt) -- (\textwidth - 0.75cm, -1pt) node [midway, inner sep = 0] (c) {};
	\node [below of=c, node distance = 0.5em] {\fontsize{10pt}{10.5pt}\selectfont \textit{фамилия, имя, отчество полностью}};
	\end{tikzpicture}
	\hfill\@Student{}\hspace*{\fill}
	
	\vspace{1em}
	\begin{tikzpicture}[overlay]
	\draw (0.75cm, -1pt) -- (\textwidth - 0.75cm, -1pt) node [midway, inner sep = 0] (c) {};
	\node [below of=c, node distance = 0.5em] {\fontsize{10pt}{10.5pt}\selectfont \textit{направление подготовки/специальность}};
	\end{tikzpicture}
	\hfill\@specialtystring\hspace*{\fill}
	
	\vspace{1em}
	\begin{tikzpicture}[overlay]
	\draw (0.75cm, -1pt) -- (\textwidth - 0.75cm, -1pt) node [midway, inner sep = 0] (c) {};
	\node [below of=c, node distance = 0.5em] {\fontsize{10pt}{10.5pt}\selectfont \textit{профиль}};
	\end{tikzpicture}
	\hfill\profile{}\hspace*{\fill}
	
	\vspace{1em}
	\begin{center}
	\textbf{над выпускной квалификационной работой бакалавра}
	
	\begin{minipage}{\textwidth - 1.5cm}
		\setlength\linenumbersep{0pt}% let the "line numbers" start directly at the text
		\renewcommand{\thelinenumber}{\tikz[overlay]\draw ((0,-1pt) -- ++(\textwidth,0);}%
		\begin{center}\begin{internallinenumbers}
		\textbf{«\subject{}»}
		\end{internallinenumbers}\end{center}
	\end{minipage}
	
	{\fontsize{10pt}{10.5pt}\selectfont \textit{название работы в точном соответствии с заданием}}
	
	\end{center}
}

\AtBeginDocument{\@reviewfront}
\AtEndDocument{
\vspace{1em}Руководитель ВКР:

\begin{tikzpicture}[overlay]
\draw(0, -1pt)--(9cm, -1pt) node[midway, inner sep=0](t){} (10cm, -1pt)--(\textwidth, -1pt) node[midway, inner sep=0] (f) {};
\node [below of=t, node distance = 0.5em] {\fontsize{10pt}{10.5pt}\selectfont\textit{должность, уч. степень, уч. звание}};
\node [below of=f, node distance = 0.5em] {\fontsize{10pt}{10.5pt}\selectfont\textit{Фамилия И.О.}};
\end{tikzpicture}\setlength{\skip0}{\widthof{\@TutorTitles}}\hspace{4.5cm - \the\skip0 / 2}\@TutorTitles\setlength{\skip1}{\widthof{\@TutorNameShortened}}\hspace{9.25cm - \the\skip0 / 2 - \the\skip1 / 2}\@TutorNameShortened

\vspace{2em}
\begin{tikzpicture}[overlay]
\draw(0, -1pt)--(5.5cm, -1pt) node[midway, inner sep=0](d){} (10cm, -1pt)--(\textwidth, -1pt) node[midway, inner sep=0] (s) {};
\node [below of=d, node distance = 0.5em] {\fontsize{10pt}{10.5pt}\selectfont\textit{дата}};
\node [below of=s, node distance = 0.5em] {\fontsize{10pt}{10.5pt}\selectfont\textit{подпись}};
\end{tikzpicture}
} %AtEndDocument

