%% `uuletter2.cls'
%% Copyright 2020 J. Korbmacher
%
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, either version 1.3
% of this license or (at your option) any later version.
% The latest version of this license is in
%   http://www.latex-project.org/lppl.txt
% and version 1.3 or later is part of all distributions of LaTeX
% version 2005/12/01 or later.
%
% This work has the LPPL maintenance status `maintained'.
%
% The Current Maintainer of this work is J. Korbmacher (j.korbmacher@uu.nl)
%
% DISCLAIMER
%
% The UU-house style is protected by copyright, with Utrecht %
% University having the right of use. This is why the house style
% cannot be used and/or applied by third parties without permission
% granted in advance.
%
%%%%%%%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{uuletter2}%[2020/02/05 v0.2.1]
\newif\if@dutch
\newif\if@verdana
\newif\if@opensans
\newif\if@merriweather
\newif\if@ragged
\newif\if@signature
\@raggedfalse
\@signaturefalse
\newcommand{\@referencelabel}{}
\newcommand{\@yourreferencelabel}{}
\newcommand{\@telephonelabel}{}
\newcommand{\@faxlabel}{}
\newcommand{\@emaillabel}{}
\newcommand{\@websitelabel}{}
\newcommand{\@datelabel}{}
\newcommand{\@subjectlabel}{}
\newcommand{\@enclosurelabel}{}
\newcommand{\@rightfooterlabel}[2]{}
\newcommand{\@visitingaddresslabel}{}
\DeclareOption{english}{%
  \@dutchfalse
  \renewcommand{\@referencelabel}{Our reference}
  \renewcommand{\@yourreferencelabel}{Your reference}
  \renewcommand{\@telephonelabel}{Telephone}
  \renewcommand{\@faxlabel}{Fax}
  \renewcommand{\@emaillabel}{E-mail}
  \renewcommand{\@websitelabel}{Website}
  \renewcommand{\@datelabel}{Date}
  \renewcommand{\@subjectlabel}{Subject}
  \renewcommand{\@enclosurelabel}{Enclosure}
  \renewcommand{\@rightfooterlabel}[2]{Page {#1} of {#2}}
  \renewcommand{\@visitingaddresslabel}{Visiting address}}
\DeclareOption{dutch}{%
  \@dutchtrue
  \renewcommand{\@referencelabel}{Ons kenmerk}
  \renewcommand{\@yourreferencelabel}{Uw kenmerk}
  \renewcommand{\@telephonelabel}{Telefoon}
  \renewcommand{\@faxlabel}{Fax}
  \renewcommand{\@emaillabel}{E-mail}
  \renewcommand{\@websitelabel}{Website}
  \renewcommand{\@datelabel}{Datum}
  \renewcommand{\@subjectlabel}{Onderwerp}
  \renewcommand{\@enclosurelabel}{Bijlage}
  \renewcommand{\@rightfooterlabel}[2]{Pagina {#1} van {#2}}
  \renewcommand{\@visitingaddresslabel}{Bezoekadress}}
%% Pass usual letter options to the letter class
\DeclareOption{a4paper}{\PassOptionsToClass{\CurrentOption}{letter}}
% \DeclareOption{a5paper}{\PassOptionsToClass{\CurrentOption}{letter}}
% \DeclareOption{b5paper}{\PassOptionsToClass{\CurrentOption}{letter}}
% \DeclareOption{letterpaper}{\PassOptionsToClass{\CurrentOption}{letter}}
% \DeclareOption{legalpaper}{\PassOptionsToClass{\CurrentOption}{letter}}
% \DeclareOption{executivepaper}{\PassOptionsToClass{\CurrentOption}{letter}}
% \DeclareOption{landscape}{\PassOptionsToClass{\CurrentOption}{letter}}
\DeclareOption{10pt}{\PassOptionsToClass{\CurrentOption}{letter}}
\DeclareOption{11pt}{\PassOptionsToClass{\CurrentOption}{letter}}
\DeclareOption{12pt}{\PassOptionsToClass{\CurrentOption}{letter}}
% \DeclareOption{twoside}{\PassOptionsToClass{\CurrentOption}{letter}}
% \DeclareOption{oneside{\PassOptionsToClass{\CurrentOption}{letter}}
\DeclareOption{draft}{\PassOptionsToClass{\CurrentOption}{letter}}
\DeclareOption{final}{\PassOptionsToClass{\CurrentOption}{letter}}
\DeclareOption{leqno}{\PassOptionsToClass{\CurrentOption}{letter}}
\DeclareOption{fleqn}{\PassOptionsToClass{\CurrentOption}{letter}}
%% Typeface options
\DeclareOption{verdana}{\@verdanatrue}
\DeclareOption{opensans}{\@opensanstrue}
\DeclareOption{merriweather}{\@merriweathertrue}
%% In case somebody really wants to have word-like typesetting.
\DeclareOption{justified}{\@raggedfalse}
\DeclareOption*{\ClassWarning{uuletter2}{The selected option \CurrentOption~is
    not supported by uuletter.}}
\ExecuteOptions{english,opensans,a4paper}
\ProcessOptions\relax
%% Some useful functions
\def\dividelength#1#2{%
  \divide #1 #2\relax}
\def\multiplylength#1#2{%
  \multiply #1 #2\relax}
%% Let's begin
%%
%% If it wasn't obvious, we build on the letter class:
\LoadClass{letter}
%% We beed graphicx to print the logo
\RequirePackage{graphicx}
%% Typeface selection routine
\if@verdana
  \RequirePackage{mathspec}
  \setallmainfonts{Verdana}
  \input{size9.clo}
  \newcommand{\@smaller}{\fontsize{7.5\p@}{9\p@}\selectfont}
\else
  \RequirePackage[T1]{fontenc}
  \if@merriweather
    \RequirePackage{merriweather}
  \else
    \if@opensans
      \RequirePackage[default]{opensans}
    \else
      \relax % This should obviously never happen
    \fi
  \fi
  \RequirePackage{mathastext}
  \newcommand{\@smaller}{\footnotesize}
\fi
%% Language selection routine
\if@dutch
  \RequirePackage[dutch]{babel}
\else
  \RequirePackage[english]{babel}
\fi
%% If you want ragged, you can have it.
\if@ragged
  \raggedright
  \setlength{\rightskip}{0pt minus 4em}
\fi
%% Currently, the package makes urls clickable by default
\RequirePackage[colorlinks=false]{hyperref}
%% Redo Layout. Ignore compatability and two-columdn.
\newlength {\@leading}
\setlength {\@leading}    {\baselineskip} %just renames baselineskip
\newlength {\@logowidth}
\setlength {\@logowidth}  {11.41cm}
\newlength {\@logoheight}
\setlength {\@logoheight} {4.5cm}
% Header
\setlength   {\voffset}    {-1in}
\addtolength {\voffset}    {1cm}
\setlength   {\topmargin}  {\z@}
\setlength   {\headheight} {\@logoheight}
\addtolength {\headheight} {-.5in}
\setlength   {\headsep}    {1em}
%%% Margins and textwidth
\setlength   {\hoffset}        {-0.5in}
\setlength   {\oddsidemargin}  {0.5in}
\setlength   {\evensidemargin} {0.5in}
\setlength   {\marginparwidth} {1in}
\addtolength {\marginparwidth} {-2em}
\setlength   {\marginparsep}   {1em}
\setlength   {\marginparpush}  {0.5em}
\setlength   {\textwidth}      {\paperwidth}
\addtolength {\textwidth}      {-2in}
%%% Text height/footer. I want the printed text height to be a
%%% multiple of baselineskip. Here's my solution.
\setlength   {\textheight}{\paperheight}
\addtolength {\textheight}{-1in}
\addtolength {\textheight}{-\voffset}
\addtolength {\textheight}{-\topmargin}
\addtolength {\textheight}{-\headheight}
\addtolength {\textheight}{-\headsep}
\addtolength {\textheight}{-.75in}%Footer height
% We temporarily save the result for error correction
\setlength   {\@tempdima} {\textheight}
% The following sets the text height as an even multiple of the
% leading
\dividelength   {\textheight} {\baselineskip}
\multiplylength {\textheight} {\baselineskip}
% We now correct for the error
\addtolength {\@tempdima} {-\textheight}
\setlength   {\footskip}  {.5in}
\addtolength {\footskip}  {\@tempdima}
%%% Spacing
\setlength{\lineskip}{1\p@}
\setlength{\normallineskip}{1\p@}
%%% This is a manual parskip package. Maybe it's better to use the
%%% real thing?.
\setlength{\parskip}{\@leading}
\setlength{\parindent}{\z@}
\renewcommand{\baselinestretch}{}
%%% Counters
\pagenumbering{arabic}
%% Core functionality
\newcounter{letter}
\def\@oddhead{\hspace*{-1in}\@printlogo}
\def\@oddfoot{%
  \ifx\@reference\empty
  \else
  \@referencelabel\space\@reference
  \fi
  \hfill
  \@rightfooterlabel{\thepage}{\pageref*{lastpage:\theletter}}}
\AtBeginDocument{%
  \def\today{\number\day-\number\month-\number\year}
  \frenchspacing}
\newcommand{\name}[2][]{%
  \def \@name {#2}
  \def \@function {#1}}
\newcommand{\subsender}[1]{\def \@subsender {#1}}
\newcommand{\visitingaddress}[1]{\def \@visitingaddress {#1}}
\newcommand{\telephone}[1]{\def \@telephone {#1}}
\newcommand{\fax}[1]{\def \@fax {#1}}
\newcommand{\email}[1]{\def \@email {#1}}
\newcommand{\website}[1]{\def \@website {#1}}
\newcommand{\toname}[2][]{%
  \def \@toname {#2}
  \def \@toinstitute {#1}}
\newcommand{\toaddress}[1]{\def \@toaddress {#1}}
\newcommand{\pobox}[1]{\def \@pobox {#1}}
\newcommand{\subject}[1]{\def \@subject {#1}}
\newcommand{\reference}[1]{\def \@reference {#1}}
\newcommand{\yourreference}[1]{\def \@yourreference {#1}}
\newcommand{\enclosure}[1]{\def \@enclosure {#1}}
\renewcommand*{\date}[1]{\def \@date {#1}}
\newcommand{\withsignature}{\@signaturetrue}
\name[]{}
\subsender{}
\telephone{}
\fax{}
\email{}
\website{}
\visitingaddress{}
\newcommand{\@clearcaches}{%
  \pobox{}
  \toname[]{}
  \toaddress{}
  \subject{}
  \reference{}
  \yourreference{}
  \enclosure{}
  \date{}
  \@signaturefalse}
\@clearcaches
\newcommand{\@printendline}[1]{%
  \if &#1&
  \else
  {#1}\\
  \fi}
\newcommand{\@printdetailline}[2]{%
  \if &#2&
  \else
  \textbf{\@smaller #1} & #2\\
  \fi}
\newcommand{\@printdate}{%
  \ifx \@date \empty
  \today
  \else
  \@date
  \fi}
\newcommand{\@printemail}{%
  \ifx \@email \empty
  \else
  \href{mailto:\@email}{\@email}
  \fi}
\newcommand{\@printwebsite}{%
  \ifx \@website \empty
  \else
  \href{\@website}{\@website}
  \fi}
\newcommand{\@printsignature}{%
  \if@signature
  \IfFileExists{signature-uuletter.png}{\includegraphics{signature-uuletter.png}\\}{%
    \fbox{Warning! Signature not found}\\
  \ClassWarning{uuletter}{You selected \protect\withsignature\space
    but LateX couldn't locate the signature. See readme.}}
  \else
  \fi}
\newcommand{\@printlogo}{%
  \if@dutch
  \IfFileExists{UU_logo_NL_CMYK.png}{\includegraphics{UU_logo_NL_CMYK.png}}{%
    \fbox{Warning! Logo not found.}
    \ClassWarning{uuletter}{Couldn't locate the Dutch logo file. Put
      it somewhere where LaTeX can find it. See readme.}}
  \else
  \IfFileExists{UU_logo_EN_CMYK.png}{\includegraphics{UU_logo_EN_CMYK.png}}{%
    \fbox{Warning! Logo not found.}
    \ClassWarning{uuletter}{Couldn't locate the English logo file. Put
      it somewhere where LaTeX can find it. See readme.}}
  \fi}
\newcommand{\@makeheader}{%
  \newpage
  \setcounter{page}{1}
  \stepcounter{letter}
  \parbox[t][5.48cm]{10.5cm}{%I didn't make those up
      \strut
      \textbf{\@smaller\@pobox}\\

      \vspace{\baselineskip}

      \@printendline{\@toname}
      \@printendline{\@toinstitute}
      \@toaddress
      \strut}
  \parbox[t][5.48cm]{6.5cm}{%
      \strut
      \textbf{\@name}\\
      \@subsender\\

      \vspace{\baselineskip}

      \textbf{\@smaller \@visitingaddresslabel}\\
      \@visitingaddress
      \strut}
  \break
  \parbox[t][5.35cm]{10.5cm}{%
    \strut
    \begin{tabular}{@{} p{2.97cm} @{} p{7.53cm} @{}}
      \@printdetailline{\@yourreferencelabel}{\@yourreference}
      \@printdetailline{\@referencelabel}{\@reference}
      \@printdetailline{\@telephonelabel}{\@telephone}
      \@printdetailline{\@faxlabel}{\@fax}
      \@printdetailline{\@emaillabel}{\@printemail}
      \@printdetailline{\@websitelabel}{\@printwebsite}
      \\
      \textbf{\@smaller \@datelabel} & \@printdate\\
      \@printdetailline{\@subjectlabel}{\@subject}
      \@printdetailline{\@enclosurelabel}{\@enclosure}
    \end{tabular}
    \strut}
  \hfill\break}
\newcommand{\opening}[1]{%
  \@makeheader
  #1\par}
\newcommand{\closing}[2][\@name]{%
  \stopbreaks
  \par
  \vspace{\baselineskip}
  #2
  \par
  \@printsignature
  \@printendline{#1}
  \@function
  \label{lastpage:\theletter}
  \startbreaks
  \clearpage
  \@clearcaches}
%%
%% EOF: 'uuletter2.cls'