\ProvidesClass{fefudoc}[2022/08/26 V0.1 Андрей Чусов]
\typeout{Для документов ДВФУ.}
\NeedsTeXFormat{LaTeX2e}

\def\@emptytoken{}
\def\@documenttype{}
\def\@SpecifyDocumentType#1#2{\DeclareOption{#2}{\gdef\@baseclass{#1}\ifx\@documenttype\@emptytoken\def\@documenttype{#2}\else\ClassError{fefudoc}{Only one document type may be specified}{}\fi}}
\@SpecifyDocumentType{details/reportv1}{report v1}\relax
\@SpecifyDocumentType{details/reportv1}{report}\relax
\@SpecifyDocumentType{details/masterthesisv1}{master thesis v1}\relax
\@SpecifyDocumentType{details/masterthesisv1}{master thesis}\relax
\@SpecifyDocumentType{details/barchelorthesisv1}{barchelor thesis v1}\relax
\@SpecifyDocumentType{details/barchelorthesisv1}{barchelor thesis}\relax
\@SpecifyDocumentType{details/thesisassignmentv1}{master thesis assignment v1}\relax
\@SpecifyDocumentType{details/thesisassignmentv1}{barchelor thesis assignment v1}\relax
\@SpecifyDocumentType{details/thesisassignmentv2}{master thesis assignment v2}\relax
\@SpecifyDocumentType{details/thesisassignmentv2}{barchelor thesis assignment v2}\relax
\@SpecifyDocumentType{details/thesisassignmentv2}{master thesis assignment}\relax
\@SpecifyDocumentType{details/thesisassignmentv2}{barchelor thesis assignment}\relax
\@SpecifyDocumentType{details/thesiscalendarplanv1}{thesis calendar plan v1}\relax
\@SpecifyDocumentType{details/thesiscalendarplanv1}{thesis calendar plan}\relax
\@SpecifyDocumentType{details/masterthesisreviewv1}{master thesis review v1}\relax
\@SpecifyDocumentType{details/barchelorthesisreviewv1}{barchelor thesis review v1}\relax
\@SpecifyDocumentType{details/masterthesisreviewv1}{master thesis review}\relax
\@SpecifyDocumentType{details/barchelorthesisreviewv1}{barchelor thesis review}\relax
\@SpecifyDocumentType{details/workbookv1}{workbook v1}\relax
\@SpecifyDocumentType{details/workbookv1}{workbook}\relax
\def\@ifdocumenttype#1#2#3{\def\@tmp{#1}\ifx\@documenttype\@tmp#1\else#2\fi}

\newif\ifnohyphenationhead \nohyphenationheadtrue
\newif\ifnohyphenationnormal \nohyphenationnormaltrue
\DeclareOption{hyphen}{\nohyphenationnormalfalse}

\newif\ifdraught \draughtfalse
\DeclareOption{draught}{\draughttrue}

\ProcessOptions
\ifx\@documenttype\@emptytoken\ClassError{fefudoc}{Document type is unspecified}\fi

\RequirePackage{xstring}
\IfEqCase{\@documenttype}%
{{report v1}{
	\ClassInfo{fefudoc}{Тип документа ДВФУ: реферат доклада, версия 1.}
}{report}{
	\ClassInfo{fefudoc}{Тип документа ДВФУ: реферат доклада, последняя версия.}
}{master thesis v1}{
	\ClassInfo{fefudoc}{Тип документа ДВФУ: магистерская ВКР, версия 1.}
}{master thesis}{
	\ClassInfo{fefudoc}{Тип документа ДВФУ: магистерская ВКР, последняя версия.}
}{barchelor thesis v1}{
	\ClassInfo{fefudoc}{Тип документа ДВФУ: бакалаврская ВКР, версия 1.}
}{barchelor thesis}{
	\ClassInfo{fefudoc}{Тип документа ДВФУ: бакалаврская ВКР, последняя версия.}
}{master thesis assignment v1}{
	\ClassInfo{fefudoc}{Тип документа ДВФУ: задание на ВКР магистранта, версия 1.}
}{barchelor thesis assignment v1}{
	\ClassInfo{fefudoc}{Тип документа ДВФУ: задание на ВКР бакалавра, версия 1.}
}{master thesis assignment v2}{
	\ClassInfo{fefudoc}{Тип документа ДВФУ: задание на ВКР магистранта, версия 2.}
}{barchelor thesis assignment v2}{
	\ClassInfo{fefudoc}{Тип документа ДВФУ: задание на ВКР бакалавра, версия 2.}
}{master thesis assignment}{
	\ClassInfo{fefudoc}{Тип документа ДВФУ: задание на ВКР магистранта, последняя версия.}
}{barchelor thesis assignment}{
	\ClassInfo{fefudoc}{Тип документа ДВФУ: задание на ВКР бакалавра, последняя версия.}
}{thesis calendar plan v1}{
	\ClassInfo{fefudoc}{Тип документа ДВФУ: календарный график выполнения ВКР, версия 1.}
}{thesis calendar plan}{
	\ClassInfo{fefudoc}{Тип документа ДВФУ: календарный график выполнения ВКР, последняя версия.}
}{master thesis review v1}{
	\ClassInfo{fefudoc}{Тип документа ДВФУ: отзыв на ВКР магистранта, версия 1.}
}{barchelor thesis review v1}{
	\ClassInfo{fefudoc}{Тип документа ДВФУ: отзыв на ВКР бакалавра, версия 1.}
}{master thesis review}{
	\ClassInfo{fefudoc}{Тип документа ДВФУ: отзыв на ВКР магистранта, последняя версия.}
}{barchelor thesis review}{
	\ClassInfo{fefudoc}{Тип документа ДВФУ: отзыв на ВКР бакалавра, последняя версия.}
}{workbook v1}{
	\ClassInfo{fefudoc}{Тип документа ДВФУ: учебное пособие ДВФУ, версия 1.}
}{workbook}{
	\ClassInfo{fefudoc}{Тип документа ДВФУ: учебное пособие ДВФУ, последняя версия.}
}}[\ClassError{fefudoc}{Неопознанный тип документа ДВФУ!}{Поддерживаемые типы приведены в начале файла "fefudoc.cls"}]

\LoadClass{\@baseclass}
\RequirePackage{xcolor}
\RequirePackage{soul}
\RequirePackage{stackengine}
\RequirePackage{csquotes}
\RequirePackage{letltxmacro}
\MakeOuterQuote{"}
\RequirePackage{perpage}
\MakePerPage{footnote} %make numbering of footnotes page-specific

\hbadness=10000

\edef\@DefaultHyphenationPenalty{\the\hyphenpenalty}
\edef\@DefaultExHyphenationPenalty{\the\exhyphenpenalty}

\def\@HyphenationPenaltyOff{%
	\hyphenpenalty=10000
	\exhyphenpenalty=10000
	\sloppy
}

\def\@HyphenationPenaltyDefault{%
	\hyphenpenalty \@DefaultHyphenationPenalty
	\exhyphenpenalty \@DefaultExHyphenationPenalty
	\fussy
}

\def\@HyphenationNormal{%
	\ifnohyphenationnormal
		\@HyphenationPenaltyOff
	\else
		\@HyphenationPenaltyDefault
	\fi}

\def\@HyphenationHeader{%
	\ifnohyphenationhead
		\@HyphenationPenaltyOff
	\else
		\@HyphenationPenaltyDefault
	\fi}

\@HyphenationHeader
\@HyphenationNormal

\newcommand\chariterate[1]{
  \chariteratehelpA#1 \relax\relax}
\def\chariteratehelpA#1 #2\relax{%
  \chariteratehelpB#1\relax\relax%
  \ifx\relax#2\else\ \chariteratehelpA#2\relax\fi
}
\def\chariteratehelpB#1#2\relax{%
  \charop{#1}%
  \ifx\relax#2\else
    \chariteratehelpB#2\relax%
  \fi
}
\newcommand\charop[1]{\colorbox{yellow}{#1}}%

\newcommand{\todo}[2][]{%
\def\tmp{#1}
\ifdraught%
\ifx\tmp\@emptytoken\fboxsep0pt\chariterate{#2}\else\fboxsep0pt\chariterate{#2}\textit{\chariterate{ (#1)}}\fi\relax%
\else
\ifx\tmp\@emptytoken{\ClassError{fefudoc}{#2}{Need to fix "#2"}}\else{\ClassError{fefudoc}{#2}{#1}}\fi\relax%
\fi%
}

\def\quot#1{«#1»}

\def\eminnershape{\bfseries}

