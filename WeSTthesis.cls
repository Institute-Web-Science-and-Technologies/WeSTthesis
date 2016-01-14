%*******************************************************************************
%  WeSTthesis.cls
%
%  LaTeX document class for seminar papers, proposals, bachelor's theses, and
%  master's theses written at the Institute for Web Science and Technologies.
%
%  (C) 2015 Institute for Web Science and Technologies <west@uni-koblenz.de>
%           University of Koblenz-Landau, Campus Koblenz
%
%  Special thanks to Prof. Stefan Mueller for allowing the adaptation of
%  cgBA.cls.
%
%	 2013/05/15  v1.0  Martin Koerner<info@mkoerner.de>  initial version
%	 2015/01/06  v1.1  Martin Koerner<info@mkoerner.de>  add options for seminar
%                                                      and date
%	 2015/12/20  v1.2  Martin Koerner<info@mkoerner.de>  add options for proposal
%                                                      and scrreprt
%
%*******************************************************************************


%--- Identification ------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{WeSTthesis}[2015/12/20 v1.2 Document class for seminar papers, proposals, bachelor's theses, and master's theses written at the Institute for Web Science and Technologies, University of Koblenz-Landau, Campus Koblenz.]


%--- Declaration of variables --------------------------------------------------

\newif\iffemalemale
\newif\iffemale
\newif\ifmale

\newif\ifgroup

\newif\ifseminar
\newif\ifproposal
\newif\ifbachelor
\newif\ifmaster

\newif\ifscrreprt

\newif\ifdate

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

\DeclareOption{seminar}{\seminartrue}
\DeclareOption{proposal}{\proposaltrue}
\DeclareOption{bachelor}{\bachelortrue}
\DeclareOption{master}{\mastertrue}

\DeclareOption{scrreprt}{\scrreprttrue}

\DeclareOption{date}{\datetrue}

\DeclareOption{times}{\timestrue}

\DeclareOption{palatino}{\palatinotrue}

\DeclareOption{twoside}{\twosidetrue}

\DeclareOption{binding}{\bindingtrue}

\DeclareOption{frames}{\framestrue}


%--- Execution of options ------------------------------------------------------


\ProcessOptions

%--- Loading of packages -------------------------------------------------------

\ifscrreprt
  \LoadClass[a4paper,11pt,titlepage]{scrreprt}
  \iftwoside
    \PassOptionsToClass{twoside}{scrreprt}
  \fi
\else
  \LoadClass[a4paper,11pt,titlepage]{scrartcl}
  \iftwoside
    \PassOptionsToClass{twoside}{scrartcl}
  \fi
\fi

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
          \ifseminar
            Seminararbeit\\[.2cm]
          \else
            \ifproposal
              Proposal\\[.2cm]
                \else
                  >>SET TYPE (seminar, bachelor, or master) IN DOCUMENTCLASS OPTIONS<<
            \fi
          \fi
        \fi
      \fi
    \end{huge}
    \ifseminar
      %do nothing
    \else
      \ifproposal
        %do nothing
      \else
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
      \fi
    \fi
    \begin{large}
      vorgelegt von\\
    \end{large}
    \begin{Large}
      \@author\\[3.79cm]
    \end{Large}
   	\end{center}
    \begin{tabular}{ll}
      \ifseminar
        Betreuer: & \firstreviewer\\
        {} & \firstreviewerinfo\\[2.5mm]
        {} & \secondreviewer\\
        {} & \secondreviewerinfo\\[2cm]
      \else
        Erstgutachter: & \firstreviewer\\
        {} & \firstreviewerinfo\\[2.5mm]
        Zweitgutachter: & \secondreviewer\\
        {} & \secondreviewerinfo\\[2cm]
      \fi
    \end{tabular}\\
    \ifdate
      Koblenz, \today
    \else
      Koblenz, im\monthword\ \the\year
    \fi
  \end{titlepage}
  \iftwoside
    \thispagestyle{empty}
    \null\varclearpage
  \fi
  \ifseminar
  %don't print the assertion
  \else
    \ifproposal
    %don't print the assertion
    \else
      \newcount\authornumber
      \ifgroup
        \authornumber=2
      \else
        \authornumber=1
      \fi
        \begin{flushleft}
          \loop\ifnum\authornumber>0
            \begin{Large}
              Erkl{\"a}rung\\[5mm]
            \end{Large}
            Hiermit best\"atige ich, dass die vorliegende Arbeit von mir selbstst\"andig verfasst wurde und ich keine anderen als die angegebenen Hilfsmittel -- insbesondere keine im Quellenverzeichnis nicht benannten Internet-Quellen -- benutzt habe und die Arbeit von mir vorher nicht in einem anderen Pr\"ufungsverfahren eingereicht wurde. Die eingereichte schriftliche Fassung entspricht der auf dem elektronischen Speichermedium (CD-Rom).\\[.75cm]
            \begin{center}
            \begin{tabular}{l p{1cm} cc}
              {} & {} & Ja & Nein\\[.5cm]
              Mit der Einstellung dieser Arbeit in die Bibliothek& {} & {} & {}\\
              bin ich einverstanden. & {} & $\square$ & $\square$\\[.5cm]
              Der Ver\"offentlichung dieser Arbeit im Internet& {} & {} & {}\\
              stimme ich zu.& {} & $\square$ & $\square$\\[.5cm]
              Der Text dieser Arbeit ist unter einer Creative & {} & {} & {}\\
              Commons Lizenz (CC BY-SA 3.0) verf\"ugbar. & {} & $\square$ & $\square$\\[.5cm]
              Der Quellcode ist unter einer Creative Commons & {} & {} & {}\\
              Lizenz (CC BY-SA 3.0) verf\"ugbar. & {} & $\square$ & $\square$\\[.5cm]
              Die erhobenen Daten sind unter einer Creative & {} & {} & {}\\
              Commons Lizenz (CC BY-SA 3.0) verf\"ugbar. & {} & $\square$ & $\square$\\
            \end{tabular}\\[2cm]
            \end{center}
            \begin{small}
              \dotfill\\
              (Ort, Datum)\hfill(Unterschrift)
            \end{small}
            \advance\authornumber by -1
            \varclearpage
          \repeat
        \end{flushleft}
    \fi
  \fi
}
