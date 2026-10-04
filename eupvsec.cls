% =====================================================================
%  eupvsec.cls
%  Document class replicating the layout of
%  "EUPVSEC_2026_Instructions_for_Preparation_of_Papers.docx"
%
%  This file contains ONLY layout/formatting. Do not edit unless you
%  intend to change the house style - write your paper in a separate
%  .tex file that loads this class (see eupvsec_example.tex).
% =====================================================================
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{eupvsec}[2026/09/15 EU PVSEC conference paper class]

% ---------------------------------------------------------------------
% Base class: extarticle gives us the 9pt size option (plain "article"
% only supports 10/11/12pt); twocolumn switches on the two-column body.
% ---------------------------------------------------------------------
\LoadClass[9pt,twocolumn]{extarticle}

% ---------------------------------------------------------------------
% Page geometry: A4, top 32mm, bottom 19mm, left/right 25mm.
% Two EQUAL columns of 73.6mm, so columnsep = 160mm - 2*73.6mm = 12.8mm
% ---------------------------------------------------------------------
\RequirePackage[a4paper,top=32mm,bottom=19mm,left=25mm,right=25mm,
            columnsep=12.8mm,includehead=false,includefoot=false]{geometry}

% No page numbers, no headers/footers (per instructions)
\RequirePackage{fancyhdr}
\pagestyle{empty}

% ---------------------------------------------------------------------
% Font: Times New Roman, 9pt, single line spacing, justified.
% "times" (PSNFSS / URW Nimbus Roman) is the standard metric-compatible
% substitute for Times New Roman under pdflatex and is what most
% conference templates use. If you have compile access to XeLaTeX/
% LuaLaTeX and want the literal "Times New Roman" font file, replace
% this block with fontspec, e.g.:
%   \RequirePackage{fontspec}
%   \setmainfont{Times New Roman}
% ---------------------------------------------------------------------
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage{times}
\linespread{1.0}
\RequirePackage{ragged2e} % lets us fine-tune justification if needed
\frenchspacing

% ---------------------------------------------------------------------
% Useful packages
% ---------------------------------------------------------------------
\RequirePackage{graphicx}
\RequirePackage{caption}
\RequirePackage{amsmath,amssymb}
\RequirePackage{enumitem}   % bullet lists matching Word's bullet style
\RequirePackage[hidelinks]{hyperref}
\RequirePackage{titlesec}
\RequirePackage{xcolor}

% Numeric citation compression/formatting ("[1]" style is unchanged -
% that comes from the bibliography style - "cite" just sorts and
% compresses lists like [1-3] and tidies spacing).
\RequirePackage{cite}

% ---------------------------------------------------------------------
% Section heading style
%   - Numbered decimally (1, 2, 3 ... / 2.1, 2.2 ...)
%   - Normal weight (NOT bold), not underlined
%   - Section headings in CAPITALS, sub-sections in upper/lower case
%   - Two blank lines before a section, one blank line before a
%     sub-section heading, no blank line after a sub-section heading
% ---------------------------------------------------------------------
\setcounter{secnumdepth}{3}

\titleformat{\section}
  {\normalfont\fontsize{9pt}{11pt}\selectfont\MakeUppercase}
  {\thesection}{0.5em}{}
\titlespacing*{\section}{0pt}{2\baselineskip}{0.6\baselineskip}

\titleformat{\subsection}
  {\normalfont\fontsize{9pt}{11pt}\selectfont}
  {\thesubsection}{0.5em}{}
\titlespacing*{\subsection}{0pt}{1\baselineskip}{0pt}

\titleformat{\subsubsection}
  {\normalfont\fontsize{9pt}{11pt}\selectfont\itshape}
  {\thesubsubsection}{0.5em}{}
\titlespacing*{\subsubsection}{0pt}{0.6\baselineskip}{0pt}

% ---------------------------------------------------------------------
% Paragraph indentation: standard first-line indent, no extra
% inter-paragraph spacing (matches the Word body-text style).
% ---------------------------------------------------------------------
\setlength{\parindent}{4.2mm}
\setlength{\parskip}{0pt}
\RequirePackage{indentfirst} % indent the first paragraph after a heading too

% ---------------------------------------------------------------------
% Figure / table captions: bold label ("Figure 1:" / "Table I:")
% followed by normal-weight caption text, same 9pt font as body text.
% Table captions sit ABOVE the table, figure captions BELOW the figure.
% ---------------------------------------------------------------------
\DeclareCaptionFont{ninept}{\fontsize{9pt}{11pt}\selectfont}
\captionsetup{font=ninept,labelfont=bf,justification=justified,
              singlelinecheck=false}
\captionsetup[table]{position=above}
\captionsetup[figure]{position=below}
% Table numbering in Roman numerals (Table I, Table II, ...)
\renewcommand{\thetable}{\Roman{table}}

% Tighter figure/table spacing typical of two-column proceedings
\setlength{\intextsep}{8pt}
\setlength{\textfloatsep}{10pt}
\setlength{\floatsep}{8pt}

% Bullet list appearance close to Word's default round bullet
\setlist[itemize]{leftmargin=*,itemsep=2pt,topsep=2pt,label=\textbullet}

% ---------------------------------------------------------------------
% References
%   Two ways to typeset the reference list, both ending up in the same
%   "[1] ..." hanging-indent style as the master document:
%
%   1) Manual entries -> the "references" environment below.
%   2) BibTeX (recommended) -> \bibliographystyle{unsrt} + \bibliography
%      combined with \cite{} (via the "cite" package loaded above).
%      We only need to retune \thebibliography's spacing/font to match
%      the house style; its default "[1]" numbering already does.
% ---------------------------------------------------------------------
\newenvironment{references}
  {\begin{list}{[\arabic{enumi}]}
    {\usecounter{enumi}\setlength{\labelwidth}{2.4em}
     \setlength{\labelsep}{0.3em}\setlength{\leftmargin}{2.7em}
     \setlength{\itemsep}{2pt}\setlength{\parsep}{0pt}}}
  {\end{list}}

\let\oldthebibliography\thebibliography
\let\oldendthebibliography\endthebibliography
\renewenvironment{thebibliography}[1]{%
  \fontsize{9pt}{11pt}\selectfont
  \oldthebibliography{#1}%
  \setlength{\itemsep}{2pt}%
  \setlength{\parsep}{0pt}%
  \setlength{\labelsep}{0.3em}%
  \setlength{\leftmargin}{2.7em}%
}{\oldendthebibliography}

% =====================================================================
%  TITLE BLOCK
%  Populated via \title{...}, \paperauthors{...}, \paperaffiliation{...},
%  \paperaddress{...}, \paperabstract{...} and \paperkeywords{...},
%  then typeset with \maketitle - see eupvsec_example.tex.
%
%  \maketitle prints the block with \twocolumn[...] so it spans the
%  FULL page width, exactly like the Word master document: title,
%  blank lines, author block, blank lines, abstract, keywords, blank
%  lines - THEN the two-column body begins.
% =====================================================================
\newcommand{\@paperauthors}{}
\newcommand{\paperauthors}[1]{\renewcommand{\@paperauthors}{#1}}

\newcommand{\@paperaffiliation}{}
\newcommand{\paperaffiliation}[1]{\renewcommand{\@paperaffiliation}{#1}}

\newcommand{\@paperaddress}{}
\newcommand{\paperaddress}[1]{\renewcommand{\@paperaddress}{#1}}

\newcommand{\@paperabstract}{}
\newcommand{\paperabstract}[1]{\renewcommand{\@paperabstract}{#1}}

\newcommand{\@paperkeywords}{}
\newcommand{\paperkeywords}[1]{\renewcommand{\@paperkeywords}{#1}}

\renewcommand{\maketitle}{%
  \twocolumn[
    {\centering
     \fontsize{11pt}{13pt}\selectfont\bfseries \@title \par}
    \vspace{2\baselineskip}
    {\centering
     \fontsize{9pt}{11pt}\selectfont
     \@paperauthors\\[2pt]
     \@paperaffiliation\\[2pt]
     \@paperaddress \par}
    \vspace{2\baselineskip}
    \begin{minipage}{\textwidth}
    \leftskip=5mm\relax
    \parindent=0pt\relax
    \fontsize{9pt}{11pt}\selectfont
    ABSTRACT: \@paperabstract
    \par\vspace{6pt}
    \@paperkeywords
    \end{minipage}
    \vspace{1.4\baselineskip}
  ]
}

\endinput
