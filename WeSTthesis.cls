%*******************************************************************************
%  WeSTthesis.cls
%
%  LaTeX document class for seminar papers, proposals, bachelor's theses, and
%  master's theses written at the Institute for Web Science and Technologies.
%
%  (C) 2016 Institute for Web Science and Technologies <west@uni-koblenz.de>
%           University of Koblenz-Landau, Campus Koblenz
%
%  Special thanks to Prof. Stefan Mueller for allowing the adaptation of
%  cgBA.cls.
%
%*******************************************************************************


%--- Identification ------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{WeSTthesis}[2017/06/08 v1.4 Document class for seminar papers, proposals, bachelor's theses, and master's theses written at the Institute for Web Science and Technologies, University of Koblenz-Landau, Campus Koblenz.]


%--- Declaration of variables --------------------------------------------------

\newif\ifenglish

\newif\iffemalemale
\newif\iffemale
\newif\ifmale

\newif\ifgroup

\newif\ifseminar
\newif\ifproposal
\newif\ifbachelor
\newif\ifmaster

\newif\ifnogermanabstract

\newif\ifscrreprt

\newif\ifdate

\newif\iftimes
\newif\ifpalatino

\newif\iftwoside

\newif\ifbinding

\newif\ifframes


%--- Initialization of variables -----------------------------------------------

%TODO make this depending on \languagename?
\DeclareOption{english}{\englishtrue}

\DeclareOption{fm}{\femalemaletrue}
\DeclareOption{f}{\femaletrue}
\DeclareOption{m}{\maletrue}

\DeclareOption{group}{\grouptrue}

\DeclareOption{seminar}{\seminartrue}
\DeclareOption{proposal}{\proposaltrue}
\DeclareOption{bachelor}{\bachelortrue}
\DeclareOption{master}{\mastertrue}

\DeclareOption{nogermanabstract}{\nogermanabstracttrue}

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

\ifscrreprt%
  \LoadClass[a4paper,11pt,titlepage]{scrreprt}
  \iftwoside%
    \PassOptionsToClass{cleardoublepage=empty,twoside}{scrreprt}
  \fi
\else
  \LoadClass[a4paper,11pt,titlepage]{scrartcl}
  \iftwoside%
    \PassOptionsToClass{cleardoublepage=empty,twoside}{scrartcl}
  \fi
\fi

\RequirePackage{titling}
\RequirePackage{ifoddpage}
% Default: Computer Modern (TeX-Standard)
\iftimes%
  \RequirePackage{times}				% font type Times New Roman
\fi
\ifpalatino%
  \RequirePackage{palatino}			% font type Book Antiqua/Palatino
\fi

\ifbinding%
  % twoside does not include a binding offset itself
  \ifframes%
    % showframe option for testing the layout
    \RequirePackage[bindingoffset=8mm,showframe]{geometry}
  \else
    \RequirePackage[bindingoffset=8mm]{geometry}
  \fi
\else
  \ifframes%
    % showframe option for testing the layout
    \RequirePackage[showframe]{geometry}
  \else
    \RequirePackage[]{geometry}
  \fi
\fi


%--- Code ----------------------------------------------------------------------

\newcommand{\degreecourse}[1]{\def\degreecourse{#1}}

\newcommand{\firstreviewer}[1]{\def\firstreviewer{#1}}
\newcommand{\firstreviewerinfo}[1]{\def\firstreviewerinfo{#1}}

\newcommand{\secondreviewer}[1]{\def\secondreviewer{#1}}
\newcommand{\secondreviewerinfo}[1]{\def\secondreviewerinfo{#1}}

\newcommand{\englishabstract}[1]{\def\englishabstract{#1}}
\newcommand{\germanabstract}[1]{\def\germanabstract{#1}}

\newcommand{\monthword}{%
  \ifenglish%
  \ifcase\month%
    \or January\or February\or March\or April\or May\or June\or July
    \or August\or September\or Oktober\or November\or December\fi
  \else
    \ifcase\month%
     \or Januar\or Februar\or M\"arz\or April\or Mai\or Juni\or Juli%
     \or August\or September\or Oktober\or November\or Dezember%
    \fi
  \fi
}

% redefine \maketitle
\renewcommand{\maketitle}{
  \ifenglish%
    \selectlanguage{english}
  \else
    \selectlanguage{ngerman}
  \fi
  \begin{titlepage}
    \begin{center}
      \renewcommand{\arraystretch}{.8}
      \begin{tabular}{c p{2.25cm} c}
 	  	  \includegraphics[height=.9cm]{logos/uni-logo-color}
        &
        \empty
        &
        \includegraphics[height=.9cm]{logos/institute-logo-color}
	      \\
        \hspace{.71cm}
        \begin{footnotesize}
          \ifenglish%
            Faculty 4: Computer Science
          \else
            Fachbereich 4: Informatik
          \fi
        \end{footnotesize}
        &
        \empty
        &
        \begin{footnotesize}
          Institute for Web Science
        \end{footnotesize}
        \\
        &
        \empty
        &
        \begin{footnotesize}
          and Technologies
        \end{footnotesize}
      \end{tabular}\\
    \renewcommand{\arraystretch}{1.0} %reset arraystretch to default
    \vspace*{1.75cm}
    \begin{huge}
      \textbf{\thetitle}\\[1.75cm]
      \ifbachelor%
        \ifenglish%
          Bachelor's Thesis
        \else
          Bachelorarbeit
        \fi
      \else
        \ifmaster%
          \ifenglish%
            Master's Thesis
          \else
            Masterarbeit
          \fi
        \else
          \ifseminar%
            \ifenglish%
              Seminar Paper
            \else
              Seminararbeit
            \fi
          \else
            \ifproposal%
              \ifenglish%
                Thesis Proposal
              \else
                Proposal
              \fi
            \else
              >>SET TYPE (seminar, bachelor...) IN DOCUMENTCLASS OPTIONS<<
            \fi
          \fi
        \fi
      \fi
      \\[.2cm]
    \end{huge}
    \ifseminar%
      %do nothing
    \else
      \ifproposal%
        %do nothing
      \else
        \ifenglish%
          in partial fulfillment of the requirements for\\
          the degree of 
        \else
          zur Erlangung des Grades
          \iffemalemale%
            einer/eines
          \else
            \iffemale%
              einer
            \else
              \ifmale%
                eines
              \else
                >>SET GENDER (fm, f, or m) IN DOCUMENTCLASS OPTIONS<<
              \fi
            \fi
          \fi
        \fi
        \ifbachelor%
          Bachelor of Science (B.Sc.)
        \else
          \ifmaster%
            Master of Science (M.Sc.)
          \else
            >>SET GRADE (bachelor or master) IN DOCUMENTCLASS OPTIONS<<
          \fi
        \fi
        \\
        \ifenglish%
          in 
        \else
          im Studiengang 
        \fi
        \degreecourse\\[.75cm]
      \fi
    \fi
    \begin{large}
      \ifenglish%
        submitted by\\
      \else
        vorgelegt von\\
      \fi
    \end{large}
    \begin{Large}
      \theauthor\\[3.79cm]
    \end{Large}
   	\end{center}
    \begin{tabular}{ll}
      \ifseminar%
        \ifenglish%
          Supervisors: 
        \else
          Betreuer: 
        \fi
        & \firstreviewer\\
        \empty & \firstreviewerinfo\\[2.5mm]
        \empty & \secondreviewer\\
        \empty & \secondreviewerinfo\\[2cm]
      \else
        \ifenglish%
          First supervisor:
        \else
          Erstgutachter: 
        \fi
        & \firstreviewer\\
        \empty & \firstreviewerinfo\\[2.5mm]
        \ifenglish%
          Second supervisor:
        \else
          Zweitgutachter: 
        \fi
        & \secondreviewer\\
        \empty & \secondreviewerinfo\\[2cm]
      \fi
      \ifdate%
        Koblenz, \today &
      \else
        \ifenglish%
          Koblenz, \monthword{} \the\year &
        \else
          Koblenz, im \monthword{} \the\year &
        \fi
      \fi
    \end{tabular}
  \end{titlepage}
  \iftwoside%
    \thispagestyle{empty}
    \null\cleardoublepage%
  \fi
  \ifseminar%
  %don't print the assertion
  \else
    \ifproposal%
    %don't print the assertion
    \else
      \newcounter{AuthorNumber}
      \ifgroup%
        \setcounter{AuthorNumber}{2}
      \else
        \setcounter{AuthorNumber}{1}
      \fi
        \begin{flushleft}
          \loop\ifnum\theAuthorNumber>0
            \begin{Large}
              \ifenglish%
                Statement
              \else
                Erkl{\"a}rung
              \fi
              \\[5mm]
            \end{Large}
            \ifenglish%
              I hereby certify that this thesis has been composed by me and is based on my own work, that I did not use any further resources than specified \textendash{} in particular no references unmentioned in the reference section \textendash{} and that I did not submit this thesis to another examination before. The paper submission is identical to the submitted electronic version.
            \else
              Hiermit best{\"a}tige ich, dass die vorliegende Arbeit von mir selbstst{\"a}ndig verfasst wurde und ich keine anderen als die angegebenen Hilfsmittel \textendash{} insbesondere keine im Quellenverzeichnis nicht benannten Internet-Quellen \textendash{} benutzt habe und die Arbeit von mir vorher nicht in einem anderen Pr{\"u}fungsverfahren eingereicht wurde. Die eingereichte schriftliche Fassung entspricht der auf dem elektronischen Speichermedium (CD-Rom).
            \fi
            \\[.75cm]
            \begin{center}
            \begin{tabular}{l p{1cm} cc}
              \empty & \empty & 
              \ifenglish%
                Yes
              \else
                Ja 
              \fi
              & 
              \ifenglish%
                No
              \else
                Nein
              \fi
              \\[.5cm]
              \ifenglish%
                I agree to have this thesis published in the library.& \empty & $\square$ & $\square$\\[.5cm]
              \else
                Mit der Einstellung dieser Arbeit in die Bibliothek& \empty & \empty & \empty\\
                bin ich einverstanden. & \empty & $\square$ & $\square$\\[.5cm]
              \fi
              \ifenglish%
                I agree to have this thesis published on the Web.& \empty & $\square$ & $\square$\\[.5cm]
              \else
                Der Ver\"offentlichung dieser Arbeit im Internet& \empty & \empty & \empty\\
                stimme ich zu.& \empty & $\square$ & $\square$\\[.5cm]
              \fi
              \ifenglish%
                The thesis text is available under a Creative Commons  & \empty & \empty & \empty\\
                License (CC BY-SA 4.0). & \empty & $\square$ & $\square$\\[.5cm]
              \else
                Der Text dieser Arbeit ist unter einer Creative & \empty & \empty & \empty \\
                Commons Lizenz (CC BY-SA 4.0) verf\"ugbar. & \empty & $\square$ & $\square$\\[.5cm]
              \fi
              \ifenglish%
                The source code is available under a GNU General Public & \empty & \empty & \empty\\
                License (GPLv3). & \empty & $\square$ & $\square$\\[.5cm]
              \else
                Der Quellcode ist unter einer GNU General Public & \empty & \empty & \empty\\
                License (GPLv3) verf\"ugbar. & \empty & $\square$ & $\square$\\[.5cm]
              \fi
              \ifenglish%
                The collected data is available under a Creative Commons & \empty & \empty & \empty\\
                License (CC BY-SA 4.0). & \empty & $\square$ & $\square$\\[.5cm]
              \else
                Die erhobenen Daten sind unter einer Creative & \empty & \empty & \empty\\
                Commons Lizenz (CC BY-SA 4.0) verf\"ugbar. & \empty & $\square$ & $\square$\\
              \fi
            \end{tabular}\\[2cm]
            \end{center}
            \begin{small}
              \dotfill\\
              \ifenglish
                (Place, Date)\hfill(Signature)
              \else
                (Ort, Datum)\hfill(Unterschrift)
              \fi
            \end{small}
            \addtocounter{AuthorNumber}{-1}
            \cleardoublepage%
          \repeat%
        \end{flushleft}
	
	\vspace{2em}
        \begin{flushleft}
        	\begin{Large}
        		\ifenglish%
                	Note
              	\else
                	Anmerkung
              \fi
              \\[5mm]
        	\end{Large}

%           \ifenglish%
            \begin{itemize}
            	\item If you would like us to contact you for the graduation ceremony, 
                \item[] please provide your personal E-mail address: \dotfill
                \item If you would like us to send you an invite to join the WeST Alumni 
                \item[] and Members group on LinkedIn, please provide your LinkedIn ID : \dotfill
            \end{itemize}
            
%             \else
%             \begin{itemize}
%             	\item Wenn Sie m\"ochten, dass wir Sie zur Abschlussfeier kontaktieren, 
%                 \item[] geben Sie bitte Ihre pers\"onliche E-Mail-Adresse an: \dotfill
%                 \item Wenn Sie m\"ochten, dass wir Ihnen eine Einladung zur Teilnahme 
%                 \item[]an der WeST Alumni- und Mitgliedergruppe auf LinkedIn senden, geben Sie bitte Ihre LinkedIn ID an: \dotfill
%             \end{itemize}
%             \fi
%             \\[5mm]
            \cleardoublepage%
        \end{flushleft}
    \fi
  \fi
  \ifnogermanabstract
    \empty
  \else
    \selectlanguage{ngerman}
    \begin{center}
    \begin{large}
    \bfseries{Zusammenfassung}
    \end{large}
    \end{center}
    \germanabstract
    \par\bigskip
    \par\bigskip
  \fi
  \selectlanguage{english}
  \begin{center}
  \begin{large}
  \bfseries{Abstract}
  \end{large}
  \end{center}
  \englishabstract
  \ifenglish
    \selectlanguage{english}
  \else
    \selectlanguage{ngerman}
  \fi
  \cleardoublepage%



}
