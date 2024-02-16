\ProvidesClass{details/reportv1}[2022/08/26 V0.1 Андрей Чусов]
\typeout{Реферат ДВФУ}
\NeedsTeXFormat{LaTeX2e}

\LoadClass[oneside]{article}
\RequirePackage{details/smallworks}

\def\@group{}
\renewcommand\author[2]{\def\@author{#2}\def\@authorshort{\@fullnameinitialslastname{#2}}\def\@group{#1}}
\newcommand\discipline[1]{\def\@discipline{#1}}
\newcommand\location[1]{\def\@location{#1}}
\newcommand\specialty{\@setspecialty}
\newcommand\profile[1]{\def\@Profile{#1}}
\def\@teacherfullname{}
\def\@teachershort{}
\def\@teacherdegree{}
\def\@teacherrank{}
\def\@teacheremployment{}
\newcommand\teacher[4]{\def\@teacherdegree{#1}\def\@teacherrank{#2}\def\@teacheremployment{#3}\def\@teacherfullname{#4}\def\@teachershort{\@fullnameinitialslastname{#4}}}

\def\@reportfrontpage%
{%
	\@topblock
	\normalsize
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
	\setlength{\parindent}{\z@}%
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

\newcommand\frontpage{\@reportfrontpage}
