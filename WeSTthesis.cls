%*******************************************************************************
%  WeSTthesis.cls
%
%  LaTeX document class for bachelor and master theses written at the Institute
%  for Web Science and Technologies.
%
%  (C) 2013 Institute for Web Science and Technologies <west@uni-koblenz.de>
%           University of Koblenz-Landau, Campus Koblenz
%
%  Special thanks to Prof. Stefan Mueller for allowing the adaptation of
%  cgBA.cls.
%
%	 2013/05/15  v0.1  Martin Koerner<info@mkoerner.de>  initial version
%*******************************************************************************


%--- Identification ------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{WeSTthesis}[2013/05/15 v0.1 Document class for bachelor and master theses written at the Institute for Web Science and Technologies, University of Koblenz-Landau, Campus Koblenz.]


%--- Declaration of variables --------------------------------------------------

\newif\iffemalemale
\newif\iffemale
\newif\ifmale

\newif\ifgroup

\newif\ifbachelor
\newif\ifmaster

\newif\iftimes
\newif\ifpalatino

\newif\iftwoside

\newif\ifbinding

\newif\ifframes


%--- Initialization of variables -----------------------------------------------

\DeclareOption{fm}{\femalemaletrue}
\DeclareOption{f}{\femaletrue}
\DeclareOption{m}{\maletrue}

\DeclareOption{group}{\grouptrue}

\DeclareOption{bachelor}{\bachelortrue}
\DeclareOption{master}{\mastertrue}

\DeclareOption{times}{\timestrue}
\DeclareOption{palatino}{\palatinotrue}

\DeclareOption{twoside}{\twosidetrue\PassOptionsToClass{twoside}{article}}

\DeclareOption{binding}{\bindingtrue}

\DeclareOption{frames}{\framestrue}


%--- Execution of options ------------------------------------------------------


\ProcessOptions

%--- Loading of packages -------------------------------------------------------

\LoadClass[a4paper,11pt,titlepage]{article}
% Default: Computer Modern (TeX-Standard)
\iftimes
  \RequirePackage{times}				% font type Times New Roman
\fi
\ifpalatino
  \RequirePackage{palatino}			% font type Book Antiqua/Palatino
\fi

\ifbinding
  % twoside does not include a binding offset itself
  \ifframes
    % showframe option for testing the layout
    \RequirePackage[bindingoffset=8mm,showframe]{geometry}
  \else
    \RequirePackage[bindingoffset=8mm]{geometry}
  \fi
\else
  \ifframes
    % showframe option for testing the layout
    \RequirePackage[showframe]{geometry}
  \else
    \RequirePackage[]{geometry}
  \fi
\fi


%--- Code ----------------------------------------------------------------------

\iftwoside
  \newcommand{\varclearpage}{
    \ifodd\c@page
      \cleardoublepage
    \else
      \clearpage
    \fi
  }
\else
  \newcommand{\varclearpage}{\clearpage}
\fi

\newcommand{\degreecourse}[1]{\def\degreecourse{#1}}

\newcommand{\firstreviewer}[1]{\def\firstreviewer{#1}}
\newcommand{\firstreviewerinfo}[1]{\def\firstreviewerinfo{#1}}

\newcommand{\secondreviewer}[1]{\def\secondreviewer{#1}}
\newcommand{\secondreviewerinfo}[1]{\def\secondreviewerinfo{#1}}

\newcommand{\monthword}{
  \ifcase\month
    \or Januar\or Februar\or M\"arz\or April\or Mai\or Juni\or Juli
    \or August\or September\or Oktober\or November\or Dezember\fi
}

% redefine \maketitle
\renewcommand{\maketitle}{
  \begin{titlepage}
    \begin{center}
      \renewcommand{\arraystretch}{.8}
      \begin{tabular}{c p{2.25cm} c}
 	  	  \includegraphics[height=.9cm]{logos/uni-logo-color}
        &
        {} %empty space between logos
        &
        \includegraphics[height=.9cm]{logos/institute-logo-color}
	      \\
        \hspace{.71cm}
        \begin{footnotesize}
          Fachbereich 4: Informatik
        \end{footnotesize}
        &
        {} %empty space between logos
        &
        \begin{footnotesize}
          Institute for Web Science
        \end{footnotesize}
        \\
        &
        {} %empty space between logos
        &
        \begin{footnotesize}
          and Technologies
        \end{footnotesize}
      \end{tabular}\\
    \renewcommand{\arraystretch}{1.0} %reset arraystretch to default
    \vspace*{1.75cm}
    \begin{huge}
      \textbf{\@title}\\[1.75cm]
      \ifbachelor
        Bachelorarbeit\\[.2cm]
      \else
        \ifmaster
          Masterarbeit\\[.2cm]
        \else
          >>SET GRADE (bachelor or master) IN DOCUMENTCLASS OPTIONS<<
        \fi
      \fi
    \end{huge}
    zur Erlangung des Grades
    \iffemalemale
      einer/eines
    \else
      \iffemale
        einer
      \else
        \ifmale
      	  eines
        \else
          >>SET GENDER (fm, f, or m) IN DOCUMENTCLASS OPTIONS<<
        \fi
      \fi
    \fi
    \ifbachelor
      Bachelor of Science (B.Sc.)\\
    \else
      \ifmaster
        Master of Science (M.Sc.)\\
      \else
        >>SET GRADE (bachelor or master) IN DOCUMENTCLASS OPTIONS<<
      \fi
    \fi
    im Studiengang \degreecourse\\[.75cm]
    \begin{large}
      vorgelegt von\\
    \end{large}
    \begin{Large}
      \@author\\[3.8cm]
    \end{Large}
   	\end{center}
    \begin{tabular}{ll}
      Erstgutachter: & \firstreviewer\\
      {} & \firstreviewerinfo\\[2.5mm]
  	  Zweitgutachter: & \secondreviewer\\
      {} & \secondreviewerinfo\\[2cm]
      \multicolumn{2}{l}{Koblenz, im\monthword\ \the\year}\\
    \end{tabular}
  \end{titlepage}
  \iftwoside
    \begin{titlepage}
      \null\clearpage
    \end{titlepage}
  \fi
  \newcount\authornumber
  \ifgroup
    \authornumber=2
  \else
    \authornumber=1
  \fi
  \begin{titlepage}
    \begin{flushleft}
      \loop\ifnum\authornumber>0
        \begin{Large}
          Erkl{\"a}rung\\[5mm]
        \end{Large}
        Hiermit best\"atige ich, dass die vorliegende Arbeit von mir selbst\"andig verfasst wurde und ich keine anderen als die angegebenen Hilfsmittel -- insbesondere keine im Quellenverzeichnis nicht benannten Internet-Quellen -- benutzt habe und die Arbeit von mir vorher nicht in einem anderen Pr\"ufungsverfahren eingereicht wurde. Die eingereichte schriftliche Fassung entspricht der auf dem elektronischen Speichermedium (CD-Rom).\\[.75cm]
        \begin{center}
        \begin{tabular}{l p{1cm} cc}
          {} & {} & Ja & Nein\\[.5cm]
          Mit der Einstellung dieser Arbeit in die Bibliothek& {} & {} & {}\\
          bin ich einverstanden. & {} & $\square$ & $\square$\\[.5cm]
          Der Ver\"offentlichung dieser Arbeit im Internet& {} & {} & {}\\
          stimme ich zu.& {} & $\square$ & $\square$\\[.5cm]
          Der Text dieser Arbeit ist unter einer Creative & {} & {} & {}\\
          Commons Lizenz verf\"ugbar. & {} & $\square$ & $\square$\\[.5cm]
          Der Quellcode ist unter einer Creative Commons & {} & {} & {}\\
          Lizenz verf\"ugbar. & {} & $\square$ & $\square$\\[.5cm]
          Die erhobenen Daten sind unter einer Creative & {} & {} & {}\\
          Commons Lizenz verf\"ugbar. & {} & $\square$ & $\square$\\
        \end{tabular}\\[2cm]
        \end{center}
	      \begin{small}
          \dotfill\\
          (Ort, Datum)\hfill(Unterschrift)
        \end{small}
        \advance\authornumber by -1
        \ifnum\authornumber>0
          \clearpage
        \fi
      \repeat
    \end{flushleft}
  \end{titlepage}
  \iftwoside
    \ifgroup
      % everything is just fine
    \else
      \begin{titlepage}
        \null\clearpage
      \end{titlepage}
    \fi
  \fi
}
