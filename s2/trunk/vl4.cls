%% vl4.cls
%% class for extended abstracts for the Workshop Viscous Liquids IV
%% Thomas Voigtmann (tv) 2014-06-26
%% heavily based on revtex4.1
\ProvidesClass{vl4}[2014/06/26]

\def\multiaffil{\clo@superscriptaddress}
\def\singleaffil{\clo@runinaddress}
\DeclareOption{multiaddr}{\multiaffil}
\ProcessOptions

\IfFileExists{revtex4-1.cls}{
\PassOptionsToClass{prl,twocolumn,amsfonts,amsmath,a4paper}{revtex4-1}
\LoadClass{revtex4-1}[2010/02/25]
}{
\PassOptionsToClass{prl,twocolumn,amsfonts,amsmath,a4paper}{revtex4}
\LoadClass{revtex4}
}

\RequirePackage{graphicx}

\setlength\textwidth{170mm}
\setlength\textheight{260mm}
% kill the revtex-typical line above the references:
\def\bib@device#1#2{\phantomsection
  \addcontentsline {toc}{section}{\protect\numberline{}\refname}%
}
%\def\frontmatter@affiliationfont{\small\it\parskip1.5\p@\relax}

\AtBeginDocument{\parindent0em\relax\parsep1ex plus.5ex minus.5ex
\parskip\parsep}

% fixed 2009-12-11: \@author@finish is needed to update affil counter
\let\omti\maketitle
\def\maketitle{\@author@finish%
  \ifnum\value{affil}>1\relax\multiaffil\else\singleaffil\fi%
  \ifcorrespondingauthor\else%
    \typeout{ERROR: please define a corresponding author}%
    \undefined%
  \fi\omti}

\newif\ifcorrespondingauthor\correspondingauthorfalse
\newcommand\correspondingauthor[1]{
  \email[Corresponding author: ]{#1}
  \correspondingauthortrue
}
