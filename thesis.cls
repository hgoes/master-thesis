\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{thesis}[2011/05/13 v1.0, Henning Günther]

\newcommand{\@thesissubject}{}
\DeclareOption{bachelorarbeit}{\renewcommand{\@thesissubject}{Bachelorarbeit}}
\DeclareOption{projektarbeit}{\renewcommand{\@thesissubject}{Projektarbeit}}
\DeclareOption{masterarbeit}{\renewcommand{\@thesissubject}{Masterarbeit}}
\DeclareOption{seminar}{\renewcommand{\@thesissubject}{Ausarbeitung eines Seminarvortrags}}
\DeclareOption{praktikum}{\renewcommand{\@thesissubject}{Praktikumsbericht}}
\DeclareOption{teamprojekt}{\renewcommand{\@thesissubject}{Teamprojekt}}
\DeclareOption{studienarbeit}{\renewcommand{\@thesissubject}{Studienarbeit}}
\DeclareOption{diplomarbeit}{\renewcommand{\@thesissubject}{Diplomarbeit}}
\DeclareOption{bericht}{\renewcommand{\@thesissubject}{Informatik-Bericht}}
\DeclareOption{script}{\renewcommand{\@thesissubject}{Vorlesungsskript}}
\ProcessOptions\relax

\LoadClass[a4paper,
  12pt,
  twoside,
  DIV12,
  BCOR08mm,
  titlepage,
  headings=normal,
  bibliography=totoc,
  openright,
  abstract=on,
  cleardoublepage=empty, % mit "empty" werden leere Seiten nicht nummeriert
  toc=listof
  ]{scrreprt}

\RequirePackage[utf8]{inputenc}

\newcommand{\@keywords}{}
\newcommand{\keywords}[1]{\renewcommand{\@keywords}{#1}}
\newcommand{\keywordsname}{Schlüsselwörter}

\renewcommand{\maketitle}{%
\thispagestyle{empty}
\begin{titlepage}
\pdfbookmark[0]{Titelseite}{titlepage}
% Seitenrand links aufheben
\begin{addmargin}{\dimexpr -\oddsidemargin-1in\relax}

% Koma-Script Seitenrand + Kopfzeile aufheben
\vspace*{\dimexpr - 24.75mm - \headheight}
% TU-BS Corporate Design Seitenrand für A4
\vskip33.5mm

\includegraphics{TUBraunschweig_4C.pdf}
\hspace{-2mm}
\textcolor{tubsrot}{\rule[6.5mm]{14cm}{2pt}}

	\vbox{}\vskip-50mm
	\vbox{
		\llap{
			\includegraphics[height=10mm]{iti}\hskip3mm
			%\parbox{40mm}{\footnotesize\sf Institut für Theoretische Informatik\\[1em]}
			\hskip-\textwidth\hskip-\evensidemargin\hskip-1in\hskip5mm
		}
	}
\end{addmargin}

\begin{center}
% Schriftskalierung
\large

% Zeilenabstand
\doublespacing

\vfill
{\relsize{1}{\@thesissubject}}\\[5ex]
{\relsize{3}{\makeatletter\textbf{\@title}\makeatother}}\\[5ex]
%{\relsize{3}{\textbf{\textsc{\docUntertitel}}}}}
{\relsize{1}\makeatletter\@author\makeatother}\\
{Matrikelnummer: \docId\\[2ex]
\today}\\

\vfill
{
\begin{tabular}{ll}
	Prüfer:   & \docPruefer\\
	Betreuer: & \docBetreuer
\end{tabular}
}\\[5ex]

\onehalfspacing
{\relsize{-1}
\docUni\\
\docInstitut
}

\end{center}
\end{titlepage}
}

\newcommand{\erklaerungname}{Eidesstattliche Erklärung}
\newcommand{\erklaerung}[1]{%
  \cleardoublepage
  \pdfbookmark[0]{\erklaerungname}{erklaerungname}
  \hskip 0mm
  \vfill
  \begin{center}\sffamily\bfseries\large
    \erklaerungname
  \end{center}
  \bigskip\noindent Hiermit erkläre ich an Eides statt, dass
  ich die vorliegende Arbeit selbstständig verfasst und keine
  anderen als die angegebenen Hilfsmittel verwendet habe.\par
  \bigskip\noindent Braunschweig,~\today\par
  \vskip 10mm
  \hfill
  \begin{tabular}{c}
    \hline
    \makebox[6cm]{(#1)}
  \end{tabular}
  % \hfill\hrulefill
}