%
% ociamthesis v2.2
% By Keith A. Gillow <gillow@maths.ox.ac.uk>
% Version 1.0 released 26/11/1997
%-------------------------- identification ---------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ociamthesis}[2010/11/22 v2.2 OCIAM thesis class]
%-------------------------- initial code -----------------------
\def\logoversion{squarelogo}
\DeclareOption{beltcrest}{\def\logoversion{beltcrest}}
\DeclareOption{shieldcrest}{\def\logoversion{shieldcrest}}
\DeclareOption{rectanglelogo}{\def\logoversion{rectanglelogo}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions\relax
\LoadClass[a4paper, twoside, openright]{report}
% As an alternative to the above could use next line for twosided output
%\LoadClass[a4paper,twoside,openright]{report}

\RequirePackage{graphicx} % needed for latest frontpage logo
\RequirePackage{ifthen}   % needed for option parsing for logo
\RequirePackage{fontenc}
\RequirePackage{watermark}
\RequirePackage[a4paper, top=1in, twoside]{geometry}
\RequirePackage{tocloft}
\RequirePackage{caption}
\RequirePackage{titlesec}
\RequirePackage{mathfont}
\RequirePackage{amssymb}
\RequirePackage{fancyhdr}
\RequirePackage{emptypage}
%\RequirePackage{amsmath}
\RequirePackage{euler}
\RequirePackage{physics}
%\RequirePackage{unicode-math}
\RequirePackage[T1]{fontenc}
\RequirePackage{paratype}
\RequirePackage{setspace}
\RequirePackage{natbib}
\RequirePackage[hidelinks]{hyperref}
%\RequirePackage{subfigures}
\RequirePackage{multirow}
\RequirePackage{longtable}

\doublespacing
\captionsetup[table]{font=doublespacing}     %% change 1.2 as you like
\captionsetup[figure]{font=doublespacing}  

\setcounter{secnumdepth}{3}
\setcounter{tocdepth}{3}

% Format section headings
\renewcommand{\listfigurename}{List of figures} 
\titleformat{\chapter}[display]{\Huge \usefont{T1}{PTSans-TLF}{m}{n}}{Chapter \ \thechapter}{0.5ex}{}[]
\titleformat{\section}[hang]{\Large \usefont{T1}{PTSans-TLF}{m}{n}}{\thesection}{0.5em}{}[]
\titleformat{\subsection}[hang]{\large \usefont{T1}{PTSans-TLF}{m}{n}}{\thesubsection}{0.5em}{}[]
\titleformat{\subsubsection}[hang]{\usefont{T1}{PTSans-TLF}{m}{it}}{\thesubsubsection}{0.5em}{}[]
\titleformat{\paragraph}[runin]{\usefont{T1}{PTSans-TLF}{m}{sl}}{}{0.5em}{}[]

% Sets the number mathfont to PT serif
\mathfont[digits]{PT Serif}

% Format captions
\DeclareCaptionFont{captionlabel}{\usefont{T1}{PTSansCaption-TLF}{b}{n}}
\DeclareCaptionFont{captiontext}{\usefont{T1}{PTSerif-TLF}{m}{n}}
\captionsetup{labelfont=captionlabel, textfont=captiontext}

% Format toc and lof
\renewcommand{\cfttoctitlefont}{\Huge \usefont{T1}{PTSans-TLF}{m}{n}}
\renewcommand{\cftloftitlefont}{\Huge \usefont{T1}{PTSans-TLF}{m}{n}}

\renewcommand{\cftchapfont}{\usefont{T1}{PTSans-TLF}{b}{n}}
\renewcommand{\cftsecfont}{\usefont{T1}{PTSans-TLF}{m}{n}}
\renewcommand{\cftsubsecfont}{\usefont{T1}{PTSans-TLF}{m}{n}}
\renewcommand{\cftsubsubsecfont}{\usefont{T1}{PTSans-TLF}{m}{it}}

\renewcommand{\cftchappagefont}{\usefont{T1}{PTSans-TLF}{m}{n}}
\renewcommand{\cftsecpagefont}{\usefont{T1}{PTSans-TLF}{m}{n}}
\renewcommand{\cftsubsecpagefont}{\usefont{T1}{PTSans-TLF}{m}{n}}
\renewcommand{\cftsubsubsecpagefont}{\usefont{T1}{PTSans-TLF}{m}{n}}

\renewcommand{\cftfigpagefont}{\usefont{T1}{PTSans-TLF}{m}{n}}
\renewcommand{\cftfigfont}{\usefont{T1}{PTSans-TLF}{m}{n}}
%\renewcommand{\cftsubfigfont}{\usefont{T1}{PTSans-TLF}{m}{it}}

\renewcommand{\cfttabpagefont}{\usefont{T1}{PTSans-TLF}{m}{n}}
\renewcommand{\cfttabfont}{\usefont{T1}{PTSans-TLF}{m}{n}}
%\renewcommand{\cftsubtabfont}{\usefont{T1}{PTSans-TLF}{m}{it}}


\assignpagestyle{\page}{\usefont{T1}{PTSans-TLF}{m}{n}}

\raggedbottom

%define the default submitted text
\newcommand{\submittedtext}{{A thesis submitted for the degree of}}
\newcommand{\doi}[1]{\href{http://dx.doi.org/#1}{doi: #1}}
%
% DECLARATIONS
%
% These macros are used to declare arguments needed for the
% construction of the title page and other preamble.

% The year and term the thesis is submitted 
\def\degreedate#1{\gdef\@degreedate{#1}}
% The full (unabbreviated) name of the degree
\def\degree#1{\gdef\@degree{#1}}
% The name of your Oxford college (e.g. Christ Church, Pembroke)
\def\college#1{\gdef\@college{#1}}


%
% Setup choosen crest/logo
%

\ifthenelse{\equal{\logoversion}{shieldcrest}}%
{
% Traditional Oxford shield crest
%Using latex metafont (Mathematical Institute system)
\font\crestfont=oxcrest40 scaled\magstep3
\def\logo{{\crestfont \char1}}
%For comlab system replace 1st line above with
%\font\crestfont=crest scaled\magstep3
}{}

\ifthenelse{\equal{\logoversion}{beltcrest}}%
{
% Newer Oxford Belt crest
%Using latex metafont (Mathematical Institute system)
\font\beltcrestfont=oxbeltcrest
\def\logo{{\beltcrestfont \char0}}
%For comlab system replace 1st line above with
%\font\beltcrestfont=newcrest
}{}

\ifthenelse{\equal{\logoversion}{squarelogo}}%
{
% Latest Logo, Square version (the default!)
% you need an oxlogo.eps or oxlogo.pdf file as appropriate
\def\logo{{\includegraphics[width=32mm]{oxlogo}}}
}{}

\ifthenelse{\equal{\logoversion}{rectanglelogo}}%
{
% Latest Logo, Square version (the default!)
% you need an oxlogo.eps or oxlogo.pdf file as appropriate
\def\logo{{\includegraphics[width=7cm]{oxford_logo}}}
}{}

%
% Define text area of page and margin offsets
%
\setlength{\topmargin}{0.0in}
\setlength{\oddsidemargin}{0.33in}
\setlength{\evensidemargin}{-0.08in}
\setlength{\textheight}{9.0in}
\setlength{\textwidth}{6.0in}

%
% Environments
%

% This macro define an environment for front matter that is always 
% single column even in a double-column document.

\newenvironment{alwayssingle}{%
       \@restonecolfalse
       \if@twocolumn\@restonecoltrue\onecolumn
       \else\if@openright\cleardoublepage\else\clearpage\fi
       \fi}%
       {\if@restonecol\twocolumn
       \else\newpage\thispagestyle{plain}\fi}

%define title page layout
\renewcommand{\maketitle}{%
\thiswatermark{\centering \put(-50pt,-880pt){\includegraphics[scale=1]{../figures/Cover.png}} }

\begin{alwayssingle}
    \newgeometry{hmargin={3cm, 8cm}, vmargin={0pt,0pt}}
    \renewcommand{\footnotesize}{\small}
    \renewcommand{\footnoterule}{\relax}
    \thispagestyle{empty}
  \begin{flushleft}
  \vspace*{10mm}
    {\usefont{T1}{PTSans-TLF}{m}{n} \Huge {{\@title}} \par}
{\large \vspace*{10mm} }
    {{\Large {\usefont{T1}{PTSansNarrow-TLF}{m}{n} \@author}} \par}
{\large \vspace*{1ex}
    {{\usefont{T1}{PTSansNarrow-TLF}{m}{n} \@college} \par}
\vspace*{0.5ex}
    {\usefont{T1}{PTSansNarrow-TLF}{m}{n} University of Oxford \par}
\vspace*{100mm}
    {{\usefont{T1}{PTSansNarrow-TLF}{m}{n} \submittedtext} \par}
\vspace*{1ex}
    {\usefont{T1}{PTSansNarrow-TLF}{m}{sl} \@degree \par}
\vspace*{1ex}
    {\usefont{T1}{PTSansNarrow-TLF}{m}{n} \@degreedate} \par} \vspace*{10mm}
    {\logo \par}
  \end{flushleft}
  \null\vfill
  \restoregeometry
\end{alwayssingle}}

% DEDICATION
%
% The dedication environment makes sure the dedication gets its
% own page and is set out in verse format.

\newenvironment{dedication}
{\begin{alwayssingle} \thispagestyle{plain}
  \begin{center}
  \vspace*{1.5cm}
  {\LARGE }
  \end{center}
  \vspace{0.5cm}
  \begin{verse}\begin{center}}
{\end{center}\end{verse}\end{alwayssingle}}


% ACKNOWLEDGEMENTS
%
% The acknowledgements environment puts a large, bold, centered 
% "Acknowledgements" label at the top of the page. The acknowledgements
% themselves appear in a quote environment, i.e. tabbed in at both sides, and
% on its own page.

\newenvironment{acknowledgements}
{\begin{alwayssingle} \thispagestyle{plain}
\begin{center}
\vspace*{1.5cm}
{\Large \usefont{T1}{PTSans-TLF}{m}{n} Acknowledgements}
\end{center}
\vspace{0.5cm}
\begin{quote}}
{\end{quote}\end{alwayssingle}}

% The acknowledgementslong environment puts a large, bold, centered 
% "Acknowledgements" label at the top of the page. The acknowledgement itself 
% does not appears in a quote environment so you can get more in.

\newenvironment{acknowledgementslong}
{\begin{alwayssingle} \thispagestyle{plain}
\begin{center}
\vspace*{1.5cm}
{\Large \bfseries Acknowledgements}
\end{center}
\vspace{0.5cm}}
{\end{alwayssingle}}

% STATEMENT OF ORIGINALITY (AS SUGGESTED BY GSW)
%
% The originality environment puts a large, bold, centered 
% "Statement of originality" label at the top of the page. The statement 
% of originality itself appears in a quote environment, i.e. tabbed in at 
% both sides, and on its own page.

\newenvironment{originality}
{\begin{alwayssingle} \thispagestyle{plain}
\begin{center}
\vspace*{1.5cm}
{\Large \bfseries Statement of Originality}
\end{center}
\vspace{0.5cm}
\begin{quote}}
{\end{quote}\end{alwayssingle}}

% The originalitylong environment puts a large, bold, centered 
% "Statement of originality" label at the top of the page. The statement 
% of originality itself does not appears in a quote environment so you can 
% get more in.

\newenvironment{originalitylong}
{\begin{alwayssingle} \thispagestyle{plain}
\begin{center}
\vspace*{1.5cm}
{\Large \bfseries Statement of Originality}
\end{center}
\vspace{0.5cm}}
{\end{alwayssingle}}


%ABSTRACT
%
%The abstract environment puts a large, bold, centered "Abstract" label at
%the top of the page. The abstract itself appears in a quote environment,
%i.e. tabbed in at both sides, and on its own page.

\renewenvironment{abstract} {\begin{alwayssingle} \thispagestyle{plain}
  \begin{center}
  \vspace*{1.5cm}
  {\Large \usefont{T1}{PTSans-TLF}{m}{n}  Abstract}
  \end{center}
  \vspace{0.5cm}
   \begin{quote}}
{\end{quote}\end{alwayssingle}}

%The abstractlong environment puts a large, bold, centered "Abstract" label at
%the top of the page. The abstract itself does not appears in a quote
%environment so you can get more in.

\newenvironment{abstractlong} {\begin{alwayssingle} \thispagestyle{plain}
  \begin{center}
  \vspace*{1.5cm}
  {\Large \bfseries  Abstract}
  \end{center}
  \vspace{0.5cm}}
{\end{alwayssingle}}

%The abstractseparate environment is for running of a page with the abstract
%on including title and author etc as required to be handed in separately

\newenvironment{abstractseparate} {\begin{alwayssingle} \thispagestyle{plain}
  \vspace*{-1in}
 \begin{center}
    { \Large {\bfseries {\@title}} \par}
    {{\large \vspace*{1ex} \@author} \par}
{\large \vspace*{1ex}
    {{\@college} \par}
    {University of Oxford \par}
\vspace*{1ex}
    {{\it \submittedtext} \par}
    {\it {\@degree} \par}
\vspace*{2ex}
    {\@degreedate}}
  \end{center}}
{\end{alwayssingle}}

%ROMANPAGES
%
% The romanpages environment set the page numbering to lowercase roman one
% for the contents and figures lists. It also resets
% page-numbering for the remainder of the dissertation (arabic, starting at 1).

\newenvironment{romanpages}
{\cleardoublepage\setcounter{page}{1}\renewcommand{\thepage}{\roman{page}}}
{\cleardoublepage\renewcommand{\thepage}{\arabic{page}}\setcounter{page}{1}}