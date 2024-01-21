\ProvidesClass{details/barchelorthesisv1}[2022/08/26 V0.1 Андрей Чусов]
\typeout{ВКР бакалавра в ДВФУ}
\NeedsTeXFormat{LaTeX2e}

\LoadClass[oneside]{book}
\RequirePackage[russian]{babel}
\babelprovide[alph=lower, Alph=upper]{russian}
\RequirePackage[sortcites,backend=biber,autocite=plain,sorting=nty,giveninits=true]{biblatex}
\renewcommand*{\bibfont}{\Large}
\RequirePackage[paper=a4paper]{geometry}
\RequirePackage{fontspec}
\RequirePackage{details/fefudocelements}
\RequirePackage{caption}
\RequirePackage{titlesec}
\RequirePackage{tocloft}
\RequirePackage{tikz}
\usetikzlibrary{calc}
\RequirePackage{pdfpages}
\RequirePackage{details/counttotal}
\RequirePackage[pdfencoding=auto, hidelinks]{hyperref}
\RequirePackage[numbered, depth=3, openlevel=1]{bookmark}

\input{details/v1thesisstylesetup.def}

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
\ExplSyntaxOff

\newcommand{\thetitle}{\@title}
\def\@group{}
\renewcommand\author[2]{\def\@author{#2}\def\@group{#1}}
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
			\tl_set:Nn \tl_specialty_description {
				\todo{НЕИЗВЕСТНАЯ\ СПЕЦИАЛЬНОСТЬ\ #1}
			}
		}
	}
}
\ExplSyntaxOff
\newcommand\profile[1]{\def\@Profile{#1}}

\def\@barchelorfrontpage%
{%
	\@topblock

	\vspace{3em}

	\begin{center}
	\@author

	\vspace{3em}

	\MakeUppercase{\@title}

	\vspace{2em}

	\textbf{ВЫПУСКНАЯ КВАЛИФИКАЦИОННАЯ РАБОТА} \\
	\textit{БАКАЛАВРСКАЯ РАБОТА}

	\vspace{1em}

	по образовательной программе подготовки бакалавров \\
	по направлению подготовки \\
	\@specialtycode{}\ \@specialtydescription{} \\
	Профиль \quot{\@Profile}

	\vspace*{\fill}

	\hfill\@location\hspace*{\fill}

	\hfill\the\year\hspace*{\fill}
	\end{center}

	\pagebreak
	\normalsize
}

\def\@exportcontrolfullname{}
\def\@exportcontroldegree{}
\def\@exportcontrolrank{}
\def\@exportcontrolemployment{}
\newcommand\exportcontrol[4]{\def\@exportcontroldegree{#1}\def\@exportcontrolrank{#2}\def\@exportcontrolemployment{#3}\def\@exportcontrolfullname{#4}}
\def\@tutorfullname{}
\def\@tutordegree{}
\def\@tutorrank{}
\def\@tutoremployment{}
\newcommand\tutor[4]{\def\@tutordegree{#1}\def\@tutorrank{#2}\def\@tutoremployment{#3}\def\@tutorfullname{#4}}
\def\@reviewerfullname{}
\def\@reviewerdegree{}
\def\@reviewerrank{}
\def\@revieweremployment{}
\def\@reviewergiven{}
\newcommand\reviewer[4]{\def\@reviewerdegree{#1}\def\@reviewerrank{#2}\def\@revieweremployment{#3}\def\@reviewerfullname{#4}\def\@reviewergiven{\relax}}
\def\@normcontrolfullname{}
\def\@normcontroldegree{}
\def\@normcontrolrank{}
\def\@normcontrolemployment{}
\def\@normcontrolgiven{}
\newcommand\normcontrol[4]{\def\@normcontroldegree{#1}\def\@normcontrolrank{#2}\def\@normcontrolemployment{#3}\def\@normcontrolfullname{#4}\def\@normcontrolgiven{\relax}}
\def\@secretaryfullname{}
\def\@secretarydegree{}
\def\@secretaryrank{}
\def\@secretaryemployment{}
\newcommand\secretary[4]{\def\@secretarydegree{#1}\def\@secretaryrank{#2}\def\@secretaryemployment{#3}\def\@secretaryfullname{#4}}
\def\@superintendentfullname{}
\def\@superintendentdegree{}
\def\@superintendentrank{}
\def\@superintendentemployment{\vspace{1em}}
\newcommand\superintendent[4]{\def\@superintendentdegree{#1}\def\@superintendentrank{#2}\def\@superintendentemployment{#3}\def\@superintendentfullname{#4}}

\def\@signaturepage%
{%
\setcounter{page}{1}
\setlength{\parindent}{0pt}%
\fontsize{12pt}{13.5pt}\selectfont
\begin{minipage}[t]{8cm}
В материалах данной выпускной квалификационной работы не содержатся сведения, составляющие государственную тайну, и сведения, подлежащие экспортному контролю\par
\vspace{1em}
Уполномоченный по экспортному контролю\par
\vspace{1em}
\edef\@name{\expandafter\@fullnameinitialslastname\expandafter{\@exportcontrolfullname}}
\setlength{\skip0}{\widthof{\@name}}
\tikz[overlay]\draw(0, -1pt) -- +(3cm, 0);\hspace{3.75cm}\tikz[overlay]\draw(0, -1pt) -- +(4.25cm, 0);\hspace{2cm - \the\skip0/2}\@name
{\par\hspace{1cm}\footnotesize\textit{подпись}\hspace{2.75cm}\textit{И.~О.~Фамилия}\hspace*{\fill}\par}
\vspace{35em}
\end{minipage}
\hfill
\setlength{\skip0}{8cm}
\setlength{\skip1}{\widthof{Руководитель ВКР \@makeshorttitles{\@tutordegree}{\@tutorrank}{\@tutoremployment}}}
\ifnum\skip1 > \skip0\setlength{\skip0}{\skip1}\fi
\setlength{\skip1}{\widthof{\@makelongtitles{\@superintendentdegree}{\@superintendentrank}{}}}
\ifnum\skip1 > \skip0\setlength{\skip0}{\skip1}\fi
\setlength{\skip1}{\widthof{«»} + 1.3cm}
\setlength{\skip10}{\the\skip0 - \widthof{20~г.} - 1cm - \the\skip1}
\begin{minipage}[t]{\the\skip0}
\setlength{\skip1}{\widthof{Автор работы}}
\setlength{\skip2}{\the\skip0 - \the\skip1 - \widthof{,}}
Автор работы\tikz[overlay]\draw(0, -1pt) -- +(\the\skip2, 0);\hspace{\the\skip2},
{\par\footnotesize\setlength{\skip3}{\widthof{\textit{подпись}}}\hspace{\the\skip1 + (\the\skip2 - \the\skip3) / 2}\footnotesize\textit{подпись}\par}
\vspace{1em}
\setlength{\skip1}{\the\skip0 - \widthof{группа}}
\setlength{\skip2}{\widthof{\@group}}
группа\tikz[overlay]\draw(0, -1pt) -- +(\the\skip1, 0);\hspace{\the\skip1/2-\the\skip2/2}\@group\par
\vspace{1em}
«\tikz[overlay]\draw(0, -1pt) -- +(1.3cm, 0);\hspace{1.3cm}»\tikz[overlay]\draw(0, -1pt) -- +(\the\skip10, 0);\hspace{\the\skip10}20\tikz[overlay]\draw(0, -1pt) -- +(1cm, 0);\hspace{1cm}~г.\par
\vspace{2em}
\def\@emptycheck{}

\def\@titles{\@makeshorttitles{\@tutordegree}{\@tutorrank}{\@tutoremployment}}
\setlength{\skip1}{\widthof{Руководитель ВКР}}
\setlength{\skip2}{\the\skip0 - \the\skip1}
Руководитель ВКР\tikz[overlay]\draw(0, -1pt) -- +(\the\skip2, 0);\hspace{\the\skip2 / 2 - \widthof{\@titles{}} / 2}\@titles{}
{\par\footnotesize\setlength{\skip3}{\widthof{\textit{должность, ученое звание}}}\hspace{\the\skip1 + (\the\skip2 - \the\skip3) / 2}\footnotesize\textit{должность, ученое звание}\par}
\tikz[overlay]\draw (0, -1pt) -- +(3cm, 0) +(3.1cm, 0) -- +(\the\skip0, 0);\hspace{1.55cm + \the\skip0 / 2 - \widthof{\@fullnameinitialslastname{\@tutorfullname}} / 2}\@fullnameinitialslastname{\@tutorfullname}
{\par\footnotesize\setlength{\skip3}{\widthof{\textit{подпись}}}\hspace{1.5cm - \the\skip3/2}\footnotesize\textit{подпись}\hspace{0.05cm + \the\skip0/2 - \the\skip3/2 - \widthof{\textit{И.~О.~Фамилия}}/2}\textit{И.~О.~Фамилия}\par}
\vspace{1em}
«\tikz[overlay]\draw(0, -1pt) -- +(1.3cm, 0);\hspace{1.3cm}»\tikz[overlay]\draw(0, -1pt) -- +(\the\skip10, 0);\hspace{\the\skip10}20\tikz[overlay]\draw(0, -1pt) -- +(1cm, 0);\hspace{1cm}~г.\par

\ifx\@normcontrolgiven\empty\relax\else%
\vspace{1em}
Консультант по нормоконтролю\par
\tikz[overlay]\draw (0, -1pt) -- +(3cm, 0) +(3.1cm, 0) -- +(\the\skip0, 0);\hspace{1.55cm + \the\skip0 / 2 - \widthof{\@fullnameinitialslastname{\@normcontrolfullname}} / 2}\@fullnameinitialslastname{\@normcontrolfullname}
{\par\footnotesize\setlength{\skip3}{\widthof{\textit{подпись}}}\hspace{1.5cm - \the\skip3/2}\footnotesize\textit{подпись}\hspace{0.05cm + \the\skip0/2 - \the\skip3/2 - \widthof{\textit{И.~О.~Фамилия}}/2}\textit{И.~О.~Фамилия}\par}
\vspace{1em}
«\tikz[overlay]\draw(0, -1pt) -- +(1.3cm, 0);\hspace{1.3cm}»\tikz[overlay]\draw(0, -1pt) -- +(\the\skip10, 0);\hspace{\the\skip10}20\tikz[overlay]\draw(0, -1pt) -- +(1cm, 0);\hspace{1cm}~г.\par
\fi

\ifx\@reviewergiven\empty\relax\else%
\vspace{1em}
\def\@titles{\@makeshorttitles{}{\@reviewerrank}{}}
\setlength{\skip1}{\widthof{Назначен рецензент}}
\setlength{\skip2}{\the\skip0 - \the\skip1}
Назначен рецензент\tikz[overlay]\draw(0, -1pt) -- +(\the\skip2, 0);\hspace{\the\skip2 / 2 - \widthof{\@titles{}} / 2}\@titles{}
{\par\footnotesize\setlength{\skip3}{\widthof{\textit{ученое звание}}}\hspace{\the\skip1 + (\the\skip2 - \the\skip3) / 2}\footnotesize\textit{ученое звание}\par}
\tikz[overlay]\draw (0, -1pt) -- +(\the\skip0, 0);\hspace{\the\skip0 / 2 - \widthof{\@reviewerfullname} / 2}\@reviewerfullname
{\par\footnotesize\setlength{\skip3}{\widthof{\textit{фамилия,~имя,~отчество}}}\hspace{\the\skip0/2 - \the\skip3/2}\textit{фамилия,~имя,~отчество}\par}
\vspace{1em}
«\tikz[overlay]\draw(0, -1pt) -- +(1.3cm, 0);\hspace{1.3cm}»\tikz[overlay]\draw(0, -1pt) -- +(\the\skip10, 0);\hspace{\the\skip10}20\tikz[overlay]\draw(0, -1pt) -- +(1cm, 0);\hspace{1cm}~г.\par
\fi
\end{minipage}
\begin{minipage}[b]{8cm}
Защищена в ГЭК с оценкой\par
\vspace{1em}
\tikz[overlay]\draw(0, -1pt) -- +(8cm, 0);\par
\vspace{1em}
Секретарь ГЭК\par
\vspace{1em}
\tikz[overlay]\draw (0, -1pt) -- +(3cm, 0) +(3.1cm, 0) -- +(8cm, 0);\hspace{5.55cm - \widthof{\@fullnameinitialslastname{\@secretaryfullname}} / 2}\@fullnameinitialslastname{\@secretaryfullname}
{\par\footnotesize\setlength{\skip3}{\widthof{\textit{подпись}}}\hspace{1.5cm - \the\skip3/2}\footnotesize\textit{подпись}\hspace{4.05cm - \the\skip3/2 - \widthof{\textit{И.~О.~Фамилия}}/2}\textit{И.~О.~Фамилия}\par}
\vspace{1em}
\setlength{\skip11}{8cm - \widthof{«»20~г.} - 1.3cm - 1cm}
«\tikz[overlay]\draw(0, -1pt) -- +(1.3cm, 0);\hspace{1.3cm}»\tikz[overlay]\draw(0, -1pt) -- +(\the\skip11, 0);\hspace{\the\skip11}20\tikz[overlay]\draw(0, -1pt) -- +(1cm, 0);\hspace{1cm}~г.\par
\end{minipage}
\hfill
\begin{minipage}[b]{\the\skip0}
\textbf{«Допустить к защите»}\par
\vspace{1em}
\expandafter\MakeUppercase\@superintendentemployment\par
\vspace{1em}
\def\@titles{\@makelongtitles{\@superintendentdegree}{\@superintendentrank}{}}
\setlength{\skip1}{\widthof{\@titles}}
\tikz[overlay]\draw(0, -1pt) -- +(\the\skip0, 0);\hspace{\the\skip0/2 - \the\skip1/2}\@titles
{\par\footnotesize\setlength{\skip3}{\widthof{\textit{учёная степень,~звание}}}\hspace{\the\skip0/2 - \the\skip3/2}\textit{учёная степень,~звание}\par}
\vspace{1em}
\tikz[overlay]\draw (0, -1pt) -- +(3cm, 0) +(3.1cm, 0) -- +(\the\skip0, 0);\hspace{1.55cm + \the\skip0 / 2 - \widthof{\@fullnameinitialslastname{\@superintendentfullname}} / 2}\@fullnameinitialslastname{\@superintendentfullname}
{\par\footnotesize\setlength{\skip3}{\widthof{\textit{подпись}}}\hspace{1.5cm - \the\skip3/2}\footnotesize\textit{подпись}\hspace{0.05cm + \the\skip0/2 - \the\skip3/2 - \widthof{\textit{И.~О.~Фамилия}}/2}\textit{И.~О.~Фамилия}\par}
\vspace{1em}
«\tikz[overlay]\draw(0, -1pt) -- +(1.3cm, 0);\hspace{1.3cm}»\tikz[overlay]\draw(0, -1pt) -- +(\the\skip10, 0);\hspace{\the\skip10}20\tikz[overlay]\draw(0, -1pt) -- +(1cm, 0);\hspace{1cm}~г.\par
\end{minipage}
\normalsize
\pagebreak
}

\input{details/contractions.def}
\input{details/barchelorspecialties.def}

\newcommand\frontpage{\@barchelorfrontpage}
\newcommand\signaturepage{\@signaturepage}
\newcommand\includeassignmentpdf[1]{\includepdf[pages=-]{#1}}
\newcommand\includeplanpdf[1]{\includepdf[pages=-]{#1}}

%\AtBeginDocument{
%\@barchelorfrontpage
%\@signaturepage
%}

