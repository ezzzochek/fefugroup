\ProvidesClass{details/thesisassignmentv1}[2023/07/01 V0.1 Андрей Чусов]
\typeout{Календарный график выполнения ВКР в ДВФУ, версия 2023г.}
\NeedsTeXFormat{LaTeX2e}

\LoadClass[oneside]{article}
\RequirePackage[russian]{babel}
\babelprovide[alph=lower, Alph=upper]{russian}
\RequirePackage[paper=a4paper]{geometry}
\RequirePackage{fontspec}
%\RequirePackage{details/fefudocelements}
\RequirePackage{soul}
\RequirePackage{tikz}
\usetikzlibrary{calc}
\RequirePackage{setspace}
\RequirePackage[ddmmyyyy]{datetime}
\renewcommand{\dateseparator}{.}
\RequirePackage{xcolor}
\RequirePackage{tabularray, tabularx}

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

\newcommand\Student[1]{\def\Student{#1}}
\newcommand\Group[1]{\def\Group{#1}}
\newcommand\Tutor[1]{\def\Tutor{#1}}
\newcommand\Specialty[1]{\def\Specialty{#1}}
\newcounter{@plancnt}
\UseTblrLibrary{counter}
\ExplSyntaxOn
\NewDocumentCommand{\@AddDashSpace}{m} {
	\tl_set:Nn \l_tmpa_tl {#1}
	\regex_replace_once:nnN {^([\d\.]+)\s*\-+\s*([\d\.]+)$}{\1\ --\ \2} \l_tmpa_tl
	\tl_use:N \l_tmpa_tl
}
\ExplSyntaxOff

\newenvironment{AssignmentPlan}{%
\setlength{\parindent}{\z@}%
\fontsize{12pt}{13.5pt}\selectfont
\vspace{1em}
\begin{center}\textbf{КАЛЕНДАРНЫЙ ГРАФИК}\par\textbf{выполнения выпускной квалификационной работы}\end{center}
\setlength{\skip0}{\textwidth - \widthof{студент}}
студент\tikz[overlay]\draw(0, -1pt) -- +(\the\skip0, 0);\hspace{\textwidth/2 - \widthof{студент} - \widthof{\Student} / 2}\Student
{\par\centering\footnotesize\textit{фамилия, имя, отчество (при наличии)}\par}
\vspace{1em}
\def\@tmp{\Specialty, \Group}
\tikz[overlay]\draw(0, -1pt) -- +(\textwidth, 0);\hspace{\textwidth/2 - \widthof{\@tmp}/2}\@tmp
{\par\centering\footnotesize\textit{направление подготовки, группа}\par}
\vspace{1em}
\setcounter{@plancnt}{\z@}
\begin{center}
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
№ п/п & Наименование этапов ВКР & Срок выполнения этапов ВКР & Примечание% 
}{\end{tblr}\end{center}

\vspace{2em}
\setlength{\skip0}{\widthof{Руководитель ВКР} + 2em}
\setlength{\skip1}{5cm}
\setlength{\skip2}{3cm}
\setlength{\skip3}{\textwidth - \the\skip0 - \the\skip1 - \the\skip2}
\tikz[overlay]\draw (\the\skip0, -1pt) -- ++(\the\skip1, 0) ++(\the\skip2, 0) -- +(\the\skip3, 0);Руководитель ВКР\hspace{2em + \the\skip1 / 2 - \widthof{\@fullnameinitialslastname{\Tutor}} / 2}\@fullnameinitialslastname{\Tutor}
{\par\footnotesize\hspace{\the\skip0 + \the\skip1 / 2 - \widthof{И.~О.~Фамилия}/2}\textit{И.~О.~Фамилия}\hspace{\the\skip1 / 2 - \widthof{И.~О.~Фамилия}/2 + \the\skip2 + \the\skip3/2 - \widthof{подпись}/2}\textit{подпись}}

\vspace{2em}
\tikz[overlay]\draw (\the\skip0, -1pt) -- ++(\the\skip1, 0) ++(\the\skip2, 0) -- +(\the\skip3, 0);Студент\hspace{\the\skip0 - \widthof{Студент} + \the\skip1 / 2 - \widthof{\@fullnameinitialslastname{\Student}} / 2}\@fullnameinitialslastname{\Student}
{\par\footnotesize\hspace{\the\skip0 + \the\skip1 / 2 - \widthof{И.~О.~Фамилия}/2}\textit{И.~О.~Фамилия}\hspace{\the\skip1 / 2 - \widthof{И.~О.~Фамилия}/2 + \the\skip2 + \the\skip3/2 - \widthof{подпись}/2}\textit{подпись}}
}%AssignmentPlan
\newcommand\AssignmentPlanEntry[3]{%
\\

\refstepcounter{@plancnt}\arabic{@plancnt}. & #1 & \@AddDashSpace{#2} & #3
}

\input{details/contractions.def}

%\newenvironment{assignment}{%
\AtBeginDocument{%
%\begin{document}
}%

