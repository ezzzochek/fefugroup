\ProvidesClass{details/thesisassignmentv1}[2022/08/26 V0.1 Андрей Чусов]
\typeout{Лист задания для ВКР в ДВФУ, версия до 2023г.}
\NeedsTeXFormat{LaTeX2e}

\LoadClass[oneside]{article}
\RequirePackage[russian]{babel}
\babelprovide[alph=lower, Alph=upper]{russian}
\RequirePackage[paper=a4paper]{geometry}
\RequirePackage{fontspec}
\RequirePackage{lineno} %has to be above csquotes
\RequirePackage{details/fefudocelements}
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
	right = 1cm,
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
\def\@EducationProgramHeadDegree{}
\def\@EducationProgramHead{}
\newcommand\EducationProgramHead[2]{\def\@EducationProgramHeadDegree{#1}\def\@EducationProgramHead{#2}}
\newcommand\DepartmentHead[2]{\def\@DepartmentHeadDegree{#1}\def\@DepartmentHead{#2}}
\def\@ApprovedBlock%
{%
\def\tikzline##1{\tikz[overlay] \draw (0,-1pt) -- ++(##1,0);}
\hfill\begin{minipage}{17em}
\hfill{}{\Large УТВЕРЖДЕНО}\hspace*{\fill}\par\fontsize{12pt}{13.5pt}\selectfont

Руководитель ОП

\tikzline{\textwidth}\hspace{1ex}\@EducationProgramHeadDegree
{\par\hfill\footnotesize(ученая степень, должность)\hspace*{\fill}\par}
\tikzline{\textwidth}\hfill\@EducationProgramHead\hspace{1ex}
{\par\hfill\footnotesize(подпись)\hspace{4cm}(ФИО)\hspace*{\fill}\par}
«\tikzline{3em}\hspace{3em}»\tikz[remember picture, overlay, baseline=0] \coordinate (mstart);\hfill\tikz[remember picture, overlay, baseline=0] \draw (mstart) +(0, -1pt) -- (0,-1pt);\the\year{}~ г.

\vspace{12pt}

Директор департамента

\tikzline{\textwidth}\hspace{1ex}\@DepartmentHeadDegree
{\par\hfill\footnotesize(ученая степень, звание)\hspace*{\fill}\par}
\tikzline{\textwidth}\hfill\@DepartmentHead\hspace{1ex}
{\par\hfill\footnotesize(подпись)\hspace{4cm}(ФИО)\hspace*{\fill}\par}
«\tikzline{3em}\hspace{3em}»\tikz[remember picture, overlay, baseline=0] \coordinate (mstart);\hfill\tikz[remember picture, overlay, baseline=0] \draw (mstart) +(0, -1pt) -- (0,-1pt);\the\year{}~ г.
\end{minipage}
}
\newenvironment{Assignment}{%
	\setlength\linenumbersep{0pt}% let the "line numbers" start directly at the text
	\setlength{\parindent}{0pt}%
	\tikz[overlay] \draw (0, -1pt) -- (\textwidth, -1pt);\fontsize{12pt}{13.5pt}\selectfont{}Студенту\hfill\Student{}\hfill{}Группа \Group{}
	
	\fontsize{8pt}{9pt}\selectfont\hspace{5cm}(Фамилия, Имя, Отчество)\hspace{6cm}(номер группы)\hspace*{\fill}
	
	\setstretch{1.2}
	\fontsize{12pt}{13.5pt}\selectfont%
    \renewcommand{\thelinenumber}{\tikz[overlay]\draw ((0,-1pt) -- ++(\textwidth,0);}%
    % the font and color of the numbers must be set explicitly
    \renewcommand\linenumberfont{\selectfont\color{black}}
    % start "line numbering", i.e. the grid
    \begin{linenumbers}%
}{\end{linenumbers}}
\newcommand\AssignmentTheme[1]{1. Наименование темы\hspace{1cm}#1.\par}
\newcommand\AssignmentReason[1]{2. Основания для разработки\hspace{1cm}#1\par}
\newcommand\AssignmentSources[1]{3. Источники разработки\hspace{1cm}#1\par}
\newcommand\AssignmentRequirements[1]{4. Технические требования\hspace{1cm}#1\par}
\newcommand\AssignmentExtraRequirements[1]{5. Дополнительные требования\hspace{1cm}#1\par}
\newcommand\AssignmentTopics[1]{6. Перечень разработанных вопросов\hspace{1cm}#1\par}
\newcommand\AssignmentPosters[1]{7. Перечень графического материала (с точным указанием обязательных плакатов)\par#1\par}
\newcounter{@plancnt}
\UseTblrLibrary{counter}
\def\@AddDashSpace#1-#2{#1 - #2}
\newenvironment{AssignmentPlan}{%
\setcounter{@plancnt}{\z@}
\begin{center}КАЛЕНДАРНЫЙ ГРАФИК ВЫПОЛНЕНИЯ РАБОТЫ\nopagebreak\vspace{1em}

\begin{tblr}[expand=\AssignmentPlanEntry]
{
	hlines={0.5pt}, vlines={0.5pt},
	columns={valign=m},
	column{1}={halign=c, wd=1.5cm},
	column{2}={halign=l, wd=6.3cm},
	column{3}={halign=c, wd=3.9cm},
	column{4}={halign=l, wd=4cm},
	row{1}={halign=c, ht=2cm},
	rowsep=2pt,colsep=2pt
}
№ п/п & Наименование этапов дипломного проекта (работы) & Срок выполнения этапов дипломного проекта (работы) & Примечание% 
}{\end{tblr}\end{center}}
\newcommand\AssignmentPlanEntry[3]{%
\\

\refstepcounter{@plancnt}\arabic{@plancnt}. & #1 & \@AddDashSpace#2\relax & #3
}

\def\@assignmentfrontpage
{%
	\@topblock
	
	\@ApprovedBlock
	
	\vspace{1em}
	
	\fontsize{14pt}{16.1pt}\selectfont\begin{center}\textbf{З А Д А Н И Е}\par
	\textbf{на выпускную квалификационную работу}\end{center}
	
	\vspace{1em}
}

\ExplSyntaxOn
\NewDocumentCommand{\@striptoinitials}{m}
{
    \tl_set:Nn \l_tmpa_tl { #1 }
    \regex_replace_all:nnN { [\.\ \~]+ } { \~ } \l_tmpa_tl
    \regex_replace_all:nnN { \~([^\~])[^\~]* } { \~\1\. } \l_tmpa_tl
    \tl_use:N \l_tmpa_tl
}
\ExplSyntaxOff

\def\@AssignmentDate{}
\newcommand\AssignmentDate[1]{\def\@AssignmentDate{#1}}
\def\@DefenseDate{}
\newcommand\DefenseDate[1]{\def\@DefenseDate{#1}}

\AtBeginDocument{\@assignmentfrontpage}
\AtEndDocument{
\newlength{\@HeadWidth}
\vspace{1em}
\def\@Head{Дата выдачи задания }%
\setlength{\@HeadWidth}{\textwidth - \widthof{\@Head}}%
\@Head\tikz [overlay] \draw(0, -1pt) -- (\@HeadWidth, -1pt);\@AssignmentDate
\par
\vspace{1em}
\def\@Head{Срок представления к защите }%
\setlength{\@HeadWidth}{\textwidth - \widthof{\@Head}}%
\@Head\tikz [overlay] \draw(0, -1pt) -- (\@HeadWidth, -1pt);\expandafter\@AddDashSpace\@DefenseDate
\par
\vspace{1em}%
\newlength{\@LongestHeadWidth}%
\setlength{\@LongestHeadWidth}{\widthof{Руководитель ВКР }}%
\newlength{\@namepos}
\setlength{\@namepos}{(8.09cm + \textwidth - \@LongestHeadWidth) / 2}
\begin{tikzpicture}[overlay]
\draw (\@LongestHeadWidth, -1pt) -- +(6.59cm, \z@) node[midway, inner sep=0] (s) {} +(8.09cm, \z@) -- (\textwidth, -1pt) node[midway, inner sep=0] (f) {};
\node [below of=s, node distance = 0.5em] {\footnotesize(подпись)};
\node [below of=f, node distance = 0.5em] {\footnotesize(ФИО)};
\end{tikzpicture}%
\edef\@Tutor{\expandafter\@striptoinitials\expandafter{\Tutor{}}}%
Руководитель ВКР\hspace{\@namepos - \widthof{\@Tutor} / 2}\@Tutor

\vspace{1em}
\begin{tikzpicture}[overlay]
\draw (\@LongestHeadWidth, -1pt) -- +(6.59cm, \z@) node[midway, inner sep=0] (s) {} +(8.09cm, \z@) -- (\textwidth, -1pt) node[midway, inner sep=0] (f) {};
\node [below of=s, node distance = 0.5em] {\footnotesize(подпись)};
\node [below of=f, node distance = 0.5em] {\footnotesize(ФИО)};
\end{tikzpicture}%
\edef\@Student{\expandafter\@striptoinitials\expandafter{\Student{}}}%
Студент\hspace{\@namepos + \widthof{Руководитель ВКР } - \widthof{Студент } - \widthof{\@Student} / 2}\@Student
} %AtEndDocument

