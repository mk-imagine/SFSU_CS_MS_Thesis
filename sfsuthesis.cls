%% sfusthesis.cls 2021-12-11
%% Copyright (C) 1988-2019 Daniel Gildea, BBF, Ethan Munson, Paul Vojta.
%
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, either version 1.3
% of this license or (at your option) any later version.
% The latest version of this license is in
%   http://www.latex-project.org/lppl.txt
% and version 1.3 or later is part of all distributions of LaTeX
% version 2003/12/01 or later.
%
% The Current Maintainer of this work is Robert BRowder.
%
% This work consists of the files sfsuthesis.cls, README, sfsuthesis.pdf,
% sfsuthesis.tex, thesis.tex, abstract.tex, chap1.tex, chap2.tex, and
% references.bib.

%%% ====================================================================
%%%  @LaTeX-class-file{
%%%     filename        = "sfsuthesis.cls",
%%%     version         = "1.0",
%%%     date            = "11 December 2021",
%%%     license         = "LPPL",
%%%     codetable       = "ISO/ASCII",
%%%     keywords        = "LaTeX, sfsuthesis",
%%%     docstring       = "This file is the main file for the sfsuthesis
%%%                        class, which is intended to meet the requirements
%%%                        for the San Francisco State University masters thesis.
%%%			   It is derived from UCBTHESIS v3.6
%%%			   maintained by Paul Vojta which is a port of UCTHESIS 2.7 
%%%            by Ethan V. Munson. Modifications to the content and organization
%%%            of the template are significant. Please see a complete listing 
%%%            in the last entry in the following version notes.
%%%
%%%			   UCTHESIS.STY v2.7 is based on the standard
%%%			   report.sty as modified by Mittelbach and Schopf in
%%%			   Jan 1992.  The primary differences are (1) the use
%%%			   of pseudo-double-spacing, except in certain special
%%%                        environments; and (2) the use of a 6 inch line
%%%                        with 4em paragraph indentation.  It is only
%%%			   intended for single-sided printing.  Double-sided
%%%			   printing may be possible, but you're on
%%%			   your own.
%%%
%%%                        I know of no bugs in this implementation,
%%%                        but would be happy to hear of any problems
%%%                        that arise with it.
%%%
%%%			   Version 2.x fixes a bug in the previous
%%%			   version of 20 Jun 1988.  The bug was that
%%%			   ``draft'' optional mode didn't work because of
%%%			   problems in handling optional arguments.
%%%                        This file does not seem to work with earlier
%%%                        versions of LaTeX (pre-Jan 1992).
%%%
%%%			   Version 2.3 includes a single-spaced
%%%			   tabular* environment.
%%%
%%%			   Version 2.4 sets \evensidemargin correctly
%%%			   for two-sided style.  It also adds new
%%%			   environments (\smalltabular and
%%%			   \scriptsizetabular) which produce tables
%%%			   with smaller fonts.  The obvious methods
%%%			   of producing small-font tables don't work
%%%			   in ucthesis style.
%%%
%%%			   Version 2.5 adds support for the \maketitle
%%%			   macro.
%%%
%%%			   Version 2.6 adds support for complete and
%%%			   correct front matter.  Some dead code was
%%%			   removed, too.
%%%
%%%                        Version 2.7 adds front matter support for
%%%                        thesis committees of more than 3 people
%%%                        and for a labeled signature line on the
%%%                        abstract page.
%%%
%%%			   Version 3.0 is a direct port of version 2.7
%%%			   to LaTeX2e.  The major revisions in ucthesis.cls
%%%			   are converting option processing to LaTeX2e
%%%			   conventions.  The uct1x files have been revised
%%%			   to use the new font selection commands.
%%%
%%%			   Version 3.1 makes the following changes:
%%%				``U of C at CAMPUS'' is now ``U of C, CAMPUS''
%%%				new degreesemester variable
%%%				roman numeral frontmatter begins with page i,
%%%					not iii
%%%				``acknowledgments'' not ``acknowledgements''
%%%
%%%			   Version 3.2 explicitly states the license as LPPL.
%%%
%%%			   Version 3.3 updates the class for formatting changes
%%%			   made in late 2009 and early 2010, fixes a few minor
%%%			   bugs, and changes the name to sfsuthesis to reflect
%%%			   the fact that this class is specific to the Berkeley
%%%			   campus.
%%%
%%%			   Version 3.4 rewrites the class to build upon the
%%%			   memoir class (instead of the report class, which had
%%%			   been used previously).  It also switches Master's
%%%			   theses to single-spacing (and adds an ``oldmasters''
%%%			   option for theses submitted in 2011 and earlier).
%%%			   In addition, it added support for co-chairs on the
%%%			   dissertation/thesis committee, joint degrees, and
%%%			   degrees with a Designated Emphasis.
%%%
%%%			   Version 3.5 adds the designated emphasis to the
%%%			   abstract (which is required).
%%%
%%%			   Version 3.6 changes the title from bold font to
%%%			   regular and adjusts the spacing in the abstract page.
%%%			   It adds \cochairs to the documentation and makes some
%%%			   fixes and adds some material to the example thesis.
%%%
%%%%%%%%%%  SFSU Thesis Version 1.0 is the initial branch from
%%%         the UC Berkely Template found at: 
%%%         https://www.overleaf.com/latex/templates/uc-berkeley-thesis-template/mfzmtxfqvtxx
%%%         Changes are as follows
%%%         - SFSU specific comments have been added to aid users
%%%         - UCB comments that do not apply to SFSU users have been removed
%%%         - Separate files have been added for each of the following sections
%%%         - New commands and environments have been created to accommodate this modularization of content 
%%%         -- abstract
%%%         -- preface
%%%         -- acknowledgments
%%%         -- introduction
%%%         - Sample math equations have been added
%%%         - Placeholder text has been updated to standard loreum ipsum
%%%         - A readme file haw been added to the package to assist users in 
%%%         - getting familiar with the organization of the template
%%%
%%%			   A problem that some people have had is
%%%			   that you can't use \pagestyle{headings}
%%%			   and \markboth if you use \part.  The solution
%%%			   is to get the headerfooter style, which is
%%%			   nice and simple to use."
%%%  }
%%% ====================================================================

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{sfsuthesis}[2021/12/11 v1.0 San Francisco State University Thesis Class]

%    ****************************************
%    *               OPTIONS                *
%    ****************************************
%
% Option values are now declared first thing.  Defaults are set to
% 12 point, onesided, phd (i.e., not masters), final (i.e., not draft) mode
% Only the phd/masters/oldmasters options are handled in this file (other
% than changing default values).

\newcommand\@masters{}
\DeclareOption{phd}{\renewcommand\@masters{0}}
\DeclareOption{masters}{\renewcommand\@masters{1}}
\DeclareOption{oldmasters}{\renewcommand\@masters{2}}
\ExecuteOptions{phd}

%  The Graduate Division requirements essentially require that theses be
%  formatted as if the oneside option had been used.  In the memoir class,
%  however, twoside is the default.  The following code relies on the memoir
%  class for oneside/twoside formatting, but changes the default to oneside.
%  Ideas for this code were adapted from an answer on stackexchange,
%    http://tex.stackexchange.com/questions/12933/new-options-and-loaded-class-options-bug
%  (accessed on 12 September 2011).

\newcommand\thes@sidedness{-1}
\DeclareOption{oneside}
  {\renewcommand\thes@sidedness{1}\PassOptionsToClass{\CurrentOption}{memoir}}
\DeclareOption{twoside}
  {\renewcommand\thes@sidedness{2}\PassOptionsToClass{\CurrentOption}{memoir}}

%  Changing the default point size from 10pt to 12pt uses a similar procedure,
%  but it's messier.

\newcommand\thes@ptsize{0}
\DeclareOption{9pt}
  {\renewcommand\thes@ptsize{9}\PassOptionsToClass{\CurrentOption}{memoir}}
\DeclareOption{10pt}
  {\renewcommand\thes@ptsize{10}\PassOptionsToClass{\CurrentOption}{memoir}}
\DeclareOption{11pt}
  {\renewcommand\thes@ptsize{11}\PassOptionsToClass{\CurrentOption}{memoir}}
\DeclareOption{12pt}
  {\renewcommand\thes@ptsize{12}\PassOptionsToClass{\CurrentOption}{memoir}}
\DeclareOption{14pt}
  {\renewcommand\thes@ptsize{14}\PassOptionsToClass{\CurrentOption}{memoir}}
\DeclareOption{17pt}
  {\renewcommand\thes@ptsize{17}\PassOptionsToClass{\CurrentOption}{memoir}}
\DeclareOption{20pt}
  {\renewcommand\thes@ptsize{20}\PassOptionsToClass{\CurrentOption}{memoir}}
\DeclareOption{25pt}
  {\renewcommand\thes@ptsize{25}\PassOptionsToClass{\CurrentOption}{memoir}}
\DeclareOption{30pt}
  {\renewcommand\thes@ptsize{30}\PassOptionsToClass{\CurrentOption}{memoir}}
\DeclareOption{36pt}
  {\renewcommand\thes@ptsize{36}\PassOptionsToClass{\CurrentOption}{memoir}}
\DeclareOption{48pt}
  {\renewcommand\thes@ptsize{48}\PassOptionsToClass{\CurrentOption}{memoir}}
\DeclareOption{60pt}
  {\renewcommand\thes@ptsize{60}\PassOptionsToClass{\CurrentOption}{memoir}}
\DeclareOption{*pt}
  {\renewcommand\thes@ptsize{99}\PassOptionsToClass{\CurrentOption}{memoir}}

% Other options are passed on to the memoir class.

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{memoir}}

% The \ProcessOptions command causes the execution of every option command
% FOO which is declared and for which the user typed the FOO option in his
% \documentclass.  For every undeclared option BAR there will be a warning
% message. (BBF 10/31/94)

\ProcessOptions\relax

% Take care of changed defaults

\ifnum\thes@sidedness<0
  \PassOptionsToClass{oneside}{memoir}
  \renewcommand\thes@sidedness{1}
\fi

\ifnum\thes@ptsize=0
  \PassOptionsToClass{12pt}{memoir}
  \renewcommand\thes@ptsize{12}
\fi

% Now load the memoir class, and configure it appropriately.

\LoadClass{memoir}

\setlrmarginsandblock{1in}{*}{*}
  \@tempdima=1in  \advance\@tempdima 25pt \advance\@tempdima\normalbaselineskip
  \@tempdimb=.75in  \advance\@tempdimb 30pt
\setulmarginsandblock{\@tempdima}{\@tempdimb}{*}

\AtBeginDocument{\checkandfixthelayout}

% The Grad. Division requires that "Placement of page numbers must be
% consistent throughout."

\pagestyle{simple}
\aliaspagestyle{book}{simple}
\aliaspagestyle{part}{simple}
\aliaspagestyle{chapter}{simple}
\aliaspagestyle{title}{simple}

% Issue warnings if the settings are not appropriate for a final copy

\ifnum\thes@sidedness=2\relax
  \ifdraftdoc\else
  \ClassWarningNoLine{sfsuthesis}{^^J\@spaces
 ****** Use the twoside option only for drafts. \@spaces\@spaces ******}
\fi\fi

\ifnum\thes@ptsize<12\relax
  \ifdraftdoc\else
  \ClassWarningNoLine{sfsuthesis}{^^J\@spaces
 ****** Use the \thes@ptsize pt option only for drafts. \@spaces\@spaces
 ******^^J\@spaces
 ****** The Graduate Division requires 12-point type ******^^J\@spaces
 ****** or larger for the final version.\space\@spaces\@spaces\@spaces
 ******}
\fi\fi

% For some environments we switch back to single-spacing, also
% provides \dsp in case you need double-spacing where single-spacing
% is otherwise used.

\newcommand\ssp{\SingleSpacing}
\newcommand\dsp{\setSpacing{1.37}}

% Table of contents, lists of figures, and lists of tables should always
% be single-spaced.  If one wants them to be double-spaced instead (in a
% double-spaced document), the original macros are available as
% \memoirtableofcontents, \memoirlistoffigures, and \memoirlistoftables.

\let\memoirtableofcontents=\tableofcontents


\renewcommand{\contentsname}{Table of Contents}

\renewcommand\tableofcontents{\begin{SingleSpace}\memoirtableofcontents
  \end{SingleSpace}}

\let\memoirlistoffigures=\listoffigures
\renewcommand\listoffigures{\begin{SingleSpace}\memoirlistoffigures
  \end{SingleSpace}}

\let\memoirlistoftables=\listoftables
\renewcommand\listoftables{\begin{SingleSpace}\memoirlistoftables
  \end{SingleSpace}}

%  draft option (this is where the draft option is actually implemented)
%
\ifnum\@masters>1			% if oldmasters
  \ifdraftdoc \else
    \dsp				% Set to double spacing
  \fi
\fi

% \smallssp is used to produce tabular environments in the small font.
% This is required because single-spacing requires a change in font size.
% \scriptsizessp is a still smaller version of the same thing.
% Removed 09/2011

% \def\smallssp{\small\SingleSpacing}
% \def\scriptsizessp{\scriptsize\SingleSpacing}


%  Masters theses may not be called dissertations
%

\newcommand\@dissertation{\ifnum\@masters=0
  dissertation
\else
  thesis
\fi}


% PREPARING A FOREIGN LANGUAGE VERSION:
%
% This document class is for documents prepared in the English language.
% To prepare a version for another language, various English words must
% be replaced.  Many of the English words that require replacement are
% indicated in the documentation for the memoir class, currently in
% Section 18.20, Words and Phrases.
%
% Other English words that need replacement can be found in the macros
% supporting the title and approval pages.
%

% abstract environment:
\newcommand\abstracttitle{Abstract}

% preface environment:
\newcommand\prefacename{Preface}

% acknowledge environment:
\newcommand\acknowledgename{Acknowledgments}

% introduction environment:
\newcommand\introductionname{Introduction}

%    ****************************************
%    *             FRONT MATTER             *
%    ****************************************
%

% DECLARATIONS
%
% These macros are used to declare arguments needed for the
% construction of the front matter.

% The year the degree will be officially conferred
\def\degreeyear#1{\gdef\@degreeyear{#1}}

% The semester (Fall or Spring) the degree will be officially conferred
\def\degreesemester#1{\gdef\@degreesemester{#1}}

% The full (unabbreviated) name of the degree
\def\degree#1{\gdef\@degree{#1}}

% The Joint Institution of your degree (optional, and rare)
\def\jointinstitution#1{\gdef\@jointinst{#1}}

% All previous degrees: one per line in chronological order
% This is no longer used, but is provided for backwards compatibility.
\def\prevdegrees#1{\gdef\@prevdegrees{#1}}

% The name of your committee's chair
\def\chair#1{\gdef\@chair{#1}\gdef\@chairtitle{Chair}}

% The your committee chair's degree
\def\chairdegree#1{\gdef\@chairdegree{#1}}

% The your committee chair's rank
\def\chairrank#1{\gdef\@chairrank{#1}}

% The name of your committee's secondary chair (for chair + co-chair)
\def\cochair#1{\gdef\@cochair{#1}}

% The name of your committee's secondary chair (for chair + co-chair)
\def\cochairdegree#1{\gdef\@cochairdegree{#1}}

% The name of your committee's secondary chair (for chair + co-chair)
\def\cochairrank#1{\gdef\@cochairrank{#1}}

% The name of your committee's secondary chair (for chair + co-chair)
\def\memberthree#1{\gdef\@memberthree{#1}}

% The name of your committee's secondary chair (for chair + co-chair)
\def\memberthreedegree#1{\gdef\@memberthreedegree{#1}}

% The name of your committee's secondary chair (for chair + co-chair)
\def\memberthreerank#1{\gdef\@memberthreerank{#1}}

% The name of your committee's secondary chair (for chair + co-chair)
\def\memberfour#1{\gdef\@memberfour{#1}}

% The name of your committee's secondary chair (for chair + co-chair)
\def\memberfourdegree#1{\gdef\@memberfourdegree{#1}}

% The name of your committee's secondary chair (for chair + co-chair)
\def\memberfourrank#1{\gdef\@memberfourrank{#1}}

% The names of your committee's co-chairs (for two equal co-chairs)
\def\cochairs#1#2{\gdef\@chair{#1}\gdef\@cochair{#2}\gdef\@chairtitle{Co-chair}}

% The names of your other committee members, one per line
\def\othermembers#1{\gdef\@othermembers{#1}}

% The number of committee members
\def\@numberofmembers{3}
\def\numberofmembers#1{\gdef\@numberofmembers{#1}}

% The name of your degree's field (e.g. Psychology, Computer Science)
\def\field#1{\gdef\@field{#1}}

% The name of your degree's designated emphasis (optional, and rare)
\def\emphasis#1{\gdef\@emphasis{#1}}

% The name of your CSU Campus (e.g. San Francisco, Los Angeles)
\def\@campus{San Francisco}  % default value is San Francisco
\def\campus#1{\gdef\@campus{#1}}

% The alwayssingle environment ensures that front matter is always
% single column even in a double-column document.

\newenvironment{alwayssingle}
  {\if@twocolumn\@restonecoltrue\onecolumn \else \@restonecolfalse\newpage \fi}
  {\if@restonecol \twocolumn \else \newpage \fi}

% \maketitle outputs the complete titlepage.  It requires all the
% above macros.  It is probably not correct for joint (e.g. UCSD/SDSU) degrees.

% Set the font that will be used in the front matter headings
\def\fmfont{\fontsize\@xiipt{14.5}\selectfont}
\def\fmsmallfont{\fontsize\@xiipt{14pt}\selectfont}

\def\maketitle{
{\ssp
  \makeatletter
    \setlength{\@tempdima}{28pt}\advance\@tempdima-\baselineskip
    \parskip=\@tempdima minus 4pt
  \makeatother
\begin{alwayssingle}
  \hrule height 0pt
  % Fix things so that they're vertically centered
  % \@tempdima = 2 * ((\stockheight-\textheight) / 2 - \uppermargin) - \topskip
    \@tempdima=\stockheight
    \advance\@tempdima-\textheight
    \advance\@tempdima-2\uppermargin
    \advance\@tempdima-\topskip
    \vspace{\@tempdima}
  \vfill
  \let\footnotesize\small
  \let\footnoterule\relax
  \thispagestyle{empty}
  \setcounter{page}{1}

  \begin{center}
    \fmfont
    \textbf{\huge\@title}\par
    \vspace{34pt minus 4pt}
    
    A Thesis submitted to the faculty of \par
    San Francisco State University \par
    In partial satisfaction of the \par
    requirements for \par
    the Degree \par
    \vspace{24pt minus 4pt}
    
    
    \ifdefined\@jointinst
      Joint {\@degree}\\with {\@jointinst}\par
    \else
      {\@degree}\par
    \fi
    in \par
    {\@field}\par
    \ifdefined\@emphasis
      and the Designated Emphasis\par
      in\par
      {\@emphasis}\par
    \fi
    \vspace{28pt minus 8pt}
    by \par
    {\@author}\par
    San Francisco, California\par
    \@degreesemester \ \@degreeyear\par
    \vspace{34pt minus 8pt}
   
  \end{center}
  \vfill
  \hrule height 0pt
\end{alwayssingle}

\setcounter{footnote}{0}
}}

% COPYRIGHTPAGE
%
% This is a macro, not an environment, because it can be generated
% with the \title, \author, and \year macros.

\def\copyrightpage{
\begin{alwayssingle}
\thispagestyle{empty}
\begin{center}
{\fmfont
\vspace*{200pt minus 4pt}
Copyright by \par
\@author} \par
\@degreeyear\par
\end{center}
\end{alwayssingle}}

% APPROVALPAGE
%
% The \approvalpage macro emits a SFSU-approved approval page ready for
% your committee's signatures. It requires that
% the \year, \author, \title, and \campus macros have been defined.

\def\approvalpage{%
\ifnum\@masters=0
  \ifdraftdoc\else
    \ClassWarning{sfsuthesis}%
      {The final submitted version should not have an approval page}%
\fi\fi

\begin{alwayssingle}
\thispagestyle{empty}

\fmfont \noindent
\begin{center}
\textbf{\huge Certification of Approval} \par
\end{center}
\vspace{14pt minus 4pt}
I certify that I have read \@approvaltitle\ by \@author\ and that in my opinion this work meets the criteria for approving a thesis submitted in partial fulfillment of the requirement for the degree \@degree\ at San Francisco State University.
% \begin{SingleSpacing}

\vspace*{46pt minus 4pt}

\raggedleft
\noindent\begin{tabular}{ll}
\makebox[2.5in]{\hrulefill}\\
\end{tabular}

\@chair, \@chairdegree\par
\@chairrank\par
Thesis Committee Chair

\vspace{44pt minus 8pt}

\noindent\begin{tabular}{ll}
\makebox[2.5in]{\hrulefill}\\
\end{tabular}

\@cochair, \@cochairdegree\par
\@cochairrank\par

\vspace{44pt minus 8pt}

\noindent\begin{tabular}{ll}
\makebox[2.5in]{\hrulefill}\\
\end{tabular}

\@memberthree, \@memberthreedegree\par
\@memberthreerank\par

% \vspace{44pt minus 4pt}

% \noindent\begin{tabular}{ll}
% \makebox[2.5in]{\hrulefill}\\
% \end{tabular}

% \@memberfour, \@memberfourdegree\par
% \@memberfourrank\par
% \end{SingleSpacing}

%\vfil
%{\baselineskip=36pt
%\settowidth\@tempdima{\ifdefined\@cochair Co-chair\else\@chairtitle\fi\quad}
%\hbox to\textwidth{\raise 3pt\hbox to\@tempdima{\@chairtitle\hfil}%
%  \leaders\hrule\hskip 0pt plus .75fill\qquad
%  \raise 3pt\hbox{Date}\quad \leaders\hrule\hskip 0pt plus .25fill}
% \hbox to\textwidth{\raise 3pt\hbox to\@tempdima{\ifdefined\@cochair Co-chair\fi
%    \hfil}%
%  \leaders\hrule\hskip 0pt plus .75fill\qquad
%  \raise 3pt\hbox{Date}\quad \leaders\hrule\hskip 0pt plus .25fill}
% \hbox to\textwidth{\hskip\@tempdima \leaders\hrule\hskip 0pt plus .75fill\qquad
% \raise 3pt\hbox{Date}\quad \leaders\hrule\hskip 0pt plus .25fill}
% \ifnum \@numberofmembers > 3
% \hbox to\textwidth{\hskip\@tempdima \leaders\hrule\hskip 0pt plus .75fill\qquad
%  \raise 3pt\hbox{Date}\quad \leaders\hrule\hskip 0pt plus .25fill}
% \fi
% \ifnum \@numberofmembers > 4
% \hbox to\textwidth{\hskip\@tempdima \leaders\hrule\hskip 0pt plus .75fill\qquad
%  \raise 3pt\hbox{Date}\quad \leaders\hrule\hskip 0pt plus .25fill}
% \fi
% \ifnum \@numberofmembers > 5
% \hbox to\textwidth{\hskip\@tempdima \leaders\hrule\hskip 0pt plus .75fill\qquad
%   \raise 3pt\hbox{Date}\quad \leaders\hrule\hskip 0pt plus .25fill}
% \fi
% }

%\vfil
\end{alwayssingle}
}



% ABSTRACT
%
% The ABSTRACT environment allows for multi-page abstracts. It requires definition
% of the \title, \author, \degree, \field, \campus, and \chair macros.

\renewenvironment{abstract}
  {\begin{alwayssingle}
    % \pagestyle{simple}
    \thispagestyle{empty}
    \setlength{\parindent}{0pt}
    \setlength{\parskip}{\baselineskip}
    \setcounter{page}{1}
    \begin{center}
    {\huge \bfseries \abstracttitle}
    \end{center}
    \setlength{\parskip}{.6\baselineskip}
    \vspace{.4\baselineskip}
  }
  {\par\end{alwayssingle}}


% PREFACE
%
% The preface environment just makes sure the preface gets its
% own page.

\newenvironment{preface}
  {\begin{alwayssingle}
      \begin{center}
    {\huge \bfseries \prefacename}
    \end{center}
  }
  {\end{alwayssingle}}
  

% INTRODUCTION
%
% The introduction environment just makes sure the introduction gets its
% own page.

\newenvironment{introduction}
  {\begin{alwayssingle}
      \begin{center}
    {\huge \bfseries \introductionname}
    \end{center}
  }
  {\end{alwayssingle}}

% ACKNOWLEDGMENTS
%
% The acknowledgements environment puts a large, bold, centered
% "Acknowledgements" label at the top of the page.

\newenvironment{acknowledgments}
  {\begin{alwayssingle}
    \begin{center}
    {\huge \bfseries \acknowledgename}
    \end{center}
  }
  {\end{alwayssingle}}

% FRONTMATTER environment
%
% The FRONTMATTER environment makes sure that page numbering is set
% correctly (roman, lower-case, starting at 3) for the front matter
% that follows the abstract.  It also resets page-numbering for
% the remainder of the dissertation (arabic, starting at 1).

\renewenvironment{frontmatter}
  {\setcounter{page}{5}\renewcommand{\thepage}{\roman{page}}}
  {\newpage\renewcommand{\thepage}{\arabic{page}}\setcounter{page}{1}}


% Rename environments to allow them to switch back to double spacing

\ifnum\@masters>1

  % These were taken from memoir.cls 2010/09/19
  \newenvironment{memoirquotation}%
               {\list{}{\listparindent 1.5em%
                        \itemindent    \listparindent
                        \rightmargin   \leftmargin
                        \parsep        \z@ \@plus\p@}%
                \item[]}%
               {\endlist}

  \newenvironment{memoirquote}%
               {\list{}{\rightmargin\leftmargin}%
                \item[]}%
               {\endlist}

  \newenvironment{memoirverse}[1][\linewidth]{%
    \refstepcounter{verse}%
    \setcounter{poemline}{0}\refstepcounter{poemline}%
    \setcounter{vslineno}{1}%
    \let\\=\@vscentercr
    \list{}{\itemsep     \z@
          \itemindent  -\vindent
          \listparindent\itemindent
          \leftmargin   \vleftmargin
          \parsep       \stanzaskip
          \ifdim #1<\linewidth%   %% short line
            \rightmargin        \z@
            \leftmargin         \linewidth
            \advance\leftmargin -#1\relax
            \advance\leftmargin -0.5\leftmargin
            \advance\leftmargin \vindent
          \else
            \ifdim #1>\linewidth%  %% long line
              \rightmargin \z@
              \leftmargin  \vindent
            \else%                   %% default
              \rightmargin \leftmargin
              \advance\leftmargin \vindent
            \fi
          \fi}
    \item[]}{\endlist}

  \ifdraftdoc\else

    \renewenvironment{quotation}%
               {\list{}{\listparindent 1.5em%
                        \itemindent    \listparindent
                        \rightmargin   \leftmargin
                        \parsep        \z@ \@plus\p@}%
                \SingleSpacing\item[]}%
               {\endlist}

    \renewenvironment{quote}%
               {\list{}{\rightmargin\leftmargin}%
                \SingleSpacing\item[]}%
               {\endlist}

    \renewenvironment{verse}[1][\linewidth]{%
      \refstepcounter{verse}%
      \setcounter{poemline}{0}\refstepcounter{poemline}%
      \setcounter{vslineno}{1}%
      \let\\=\@vscentercr
      \list{}{\itemsep     \z@
          \itemindent  -\vindent
          \listparindent\itemindent
          \leftmargin   \vleftmargin
          \parsep       \stanzaskip
          \ifdim #1<\linewidth%   %% short line
            \rightmargin        \z@
            \leftmargin         \linewidth
            \advance\leftmargin -#1\relax
            \advance\leftmargin -0.5\leftmargin
            \advance\leftmargin \vindent
          \else
            \ifdim #1>\linewidth%  %% long line
              \rightmargin \z@
              \leftmargin  \vindent
            \else%                   %% default
              \rightmargin \leftmargin
              \advance\leftmargin \vindent
            \fi
          \fi}
    \SingleSpacing\item[]}{\endlist}

  \fi
\fi

% smalltabular and smalltabular* are alternative tabular environments
% in the \small font.  They are required because single-spacing implies a
% change of font to a particular size.
% EVM, 7/20/93
% Removed 09/2011

% \def\smalltabular{\par\small\SingleSpacing\let\@halignto\@empty\@tabular}
% \let\endsmalltabular = \endtabular

% \@namedef{smalltabular*}#1{\par\small\SingleSpacing
%  \setlength\dimen@{#1}%
%    \edef\@halignto{to\the\dimen@}\@tabular}
% \expandafter \let \csname endsmalltabular*\endcsname = \endtabular

% \scriptsizetabular and \scriptsizetabular* are analogs of \smalltabular

% \def\scriptsizetabular{\par\scriptsize\SingleSpacing
%   \let\@halignto\@empty\@tabular}
% \let\endscriptsizetabular = \endtabular

% \@namedef{scriptsizetabular*}#1{\par\scriptsize\SingleSpacing
%  \setlength\dimen@{#1}%
%    \edef\@halignto{to\the\dimen@}\@tabular}
% \expandafter \let \csname endscriptsizetabular*\endcsname = \endtabular

\endinput
