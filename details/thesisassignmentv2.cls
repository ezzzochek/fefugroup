\ProvidesClass{details/thesisassignmentv2}[2023/07/01 V0.1 Андрей Чусов]
\typeout{Лист задания для ВКР в ДВФУ, версия 2023г.}
\NeedsTeXFormat{LaTeX2e}

\LoadClass[twoside]{article}
\RequirePackage[russian]{babel}
\babelprovide[alph=lower, Alph=upper]{russian}
\RequirePackage[paper=a4paper]{geometry}
\RequirePackage{fontspec}
\RequirePackage{lineno} %has to be above csquotes
%\RequirePackage{details/fefudocelements}
\RequirePackage{soul}
\RequirePackage{tikz}
\usetikzlibrary{calc}
\RequirePackage{setspace}
\RequirePackage[ddmmyyyy]{datetime}
\renewcommand{\dateseparator}{.}

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
}{\IfFontExistsTF{LiberationSerif}{%
	\setmainfont{LiberationSerif}%
}{\IfFontExistsTF{Times}{%
	\setmainfont{Times}%
}}}

\pagestyle{plain}
\pagenumbering{gobble}

\def\@parindent{\@z}

\newcommand\Student[1]{\def\Student{#1}}
\newcommand\Group[1]{\def\Group{#1}}
\newcommand\Tutor[1]{\def\Tutor{#1}}
\newcommand\Specialty[1]{\def\Specialty{#1}}
\def\@AssignmentDate{}
\newcommand\AssignmentDate[1]{\def\@AssignmentDate{#1}}
\def\@AssignmentAcceptanceDate{}
\newcommand\AssignmentAcceptanceDate[1]{\def\@AssignmentAcceptanceDate{#1}}

\newenvironment{Assignment}{%
	\setlength\linenumbersep{0pt}% let the "line numbers" start directly at the text
	\setlength{\parskip}{1.5\baselineskip}
	\setstretch{1.2}
	\fontsize{12pt}{13.5pt}\selectfont%
    \renewcommand{\thelinenumber}{\tikz[overlay]\draw ((0,-1pt) -- ++(\textwidth,0);}%
    % the font and color of the numbers must be set explicitly
    \renewcommand\linenumberfont{\selectfont\color{black}}
    % start "line numbering", i.e. the grid
	\firstlinenumber{2}
	\count32122=\z@
	\def\@addparagraph##1##2{\advance\count32122 by \@ne\setlength{\skip0}{\widthof{\the\count32122. ##1}}\tikz[overlay]\draw(\the\skip0, -1pt) -- (\textwidth, -1pt);\c@linenumber=\@ne\begin{linenumbers}\mbox{\the\count32122. ##1}##2\end{linenumbers}\par}
}{\@addparagraph{Дата выдачи задания: }{\@AssignmentDate}}
\newcommand\AssignmentTheme[1]{\@addparagraph{Тема работы: }{#1}}
\newcommand\AssignmentDueTime[1]{\@addparagraph{Срок сдачи студентом законченной работы: }{#1}}
\newcommand\AssignmentCoverage[1]{\@addparagraph{Исходные данные по работе: }{#1}}
\newcommand\AssignmentTopics[1]{\@addparagraph{Содержание работы (перечень подлежащих разработке вопросов): }{#1}}
\newcommand\AssignmentPosters[1]{\@addparagraph{Перечень графического материала (с указанием обязательных чертежей): }{#1}}
\newcommand\AssignmentConsultants[1]{\@addparagraph{Консультанты по работе: }{#1}}
\newcommand\AssignmentSources[1]{\@addparagraph{Основные источники информации: }{#1}}

\def\@assignmentfrontpage
{%
	\setlength{\parindent}{0pt}%
	\fontsize{12pt}{13.5pt}\selectfont
	\begin{center}\textbf{ЗАДАНИЕ} \par \textbf{на выполнение выпускной квалификационной работы}\end{center}
	
	\vspace{1em}
	
	\setlength{\skip0}{\widthof{студент}}\setlength{\skip1}{\textwidth - \the\skip0}
	студент\tikz[overlay]\draw(0, -1pt) -- (\the\skip1, -1pt);\hfill\Student{}\hspace*{\fill}
	{\par\footnotesize\hspace{\the\skip0}\hfill\textit{фамилия, имя, отчество (при наличии)}\hspace*{\fill}\par}
	
	\tikz[overlay]\draw(0, -1pt) -- (\textwidth, -1pt);\hfill\Specialty{}, \Group{}\hspace*{\fill}
	{\par\footnotesize\hfill\textit{направление подготовки, группа}\hspace*{\fill}\par}
}

\ExplSyntaxOn
\NewDocumentCommand{\@striptoinitials}{m}
{
    \tl_set:Nn \l_tmpa_tl { #1 }
    \regex_replace_all:nnN { [\.\ \~]+ } { \~ } \l_tmpa_tl
    \regex_replace_all:nnN { \~([^\~])[^\~]* } { \~\1\. } \l_tmpa_tl
    \regex_replace_all:nnN { ([^\~]+)\~([^\~]\.)\~([^\~]\.) } { \2\3\1 } \l_tmpa_tl
    \tl_use:N \l_tmpa_tl
}
\ExplSyntaxOff
\AtBeginDocument{\@assignmentfrontpage}
\AtEndDocument{
\setlength{\skip0}{\widthof{Руководитель ВКР}}
\edef\@Tutor{\expandafter\@striptoinitials\expandafter{\Tutor{}}}
\edef\@Student{\expandafter\@striptoinitials\expandafter{\Student{}}}
\setlength{\skip1}{\widthof{\@Tutor}}
\setlength{\skip2}{\widthof{\@Student}}
\ifnum\skip1 < \skip2\setlength{\skip3}{\skip2}\else\setlength{\skip3}{\skip1}\fi
\ifdim\dimexpr\skip3 < 5cm\setlength{\skip3}{5cm}\fi %length of the "name" field
\setlength{\skip4}{1.5cm} %margin to the left of the "name" field
\setlength{\skip5}{1cm} %margin to the right of the "name" field

\vspace{1em}
\begin{tikzpicture}[overlay]
\draw (\the\skip0 + \the\skip4, -1pt) -- ++(\the\skip3, \z@) node[midway, inner sep=0] (f) {} +(\the\skip5, \z@) -- (\textwidth, -1pt) node[midway, inner sep=0] (s) {};
\node [below of=s, node distance = 0.5em] {\footnotesize \textit{подпись}};
\node [below of=f, node distance = 0.5em] {\footnotesize \textit{И.О. Фамилия}};
\end{tikzpicture}%
Руководитель ВКР\hspace{\the\skip4 + (\the\skip3 - \the\skip1) / 2}\@Tutor

\vspace{2em}
Задание принял к исполнению
\begin{tikzpicture}[overlay]
\draw(0, -1pt) -- +(5cm, 0) node[midway, inner sep=0] (d) {};
\node [below of=d, node distance = 0.5em] {\footnotesize \textit{дата}};
\end{tikzpicture}
\hspace{2.5cm - \widthof{\@AssignmentAcceptanceDate} / 2}\@AssignmentAcceptanceDate

\vspace{2em}
\begin{tikzpicture}[overlay]
\draw (\the\skip0 + \the\skip4, -1pt) -- ++(\the\skip3, \z@) node[midway, inner sep=0] (f) {} +(\the\skip5, \z@) -- (\textwidth, -1pt) node[midway, inner sep=0] (s) {};
\node [below of=s, node distance = 0.5em] {\footnotesize \textit{подпись}};
\node [below of=f, node distance = 0.5em] {\footnotesize \textit{И.О. Фамилия}};
\end{tikzpicture}%
Студент\hspace{\the\skip0 - \widthof{Студент} + \the\skip4 + (\the\skip3 - \the\skip2) / 2}\@Student

} %AtEndDocument

