%===============================
% Class Declaration stuff
%===============================

% Necessary Preamble
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{homework}[2019/09/23 Homework Class]

% Load Base Class and identify arguments
\LoadClass[letterpaper, 11pt, twoside]{article}

% This is a dummy course, to indicate I've copied a template and forgot to change the argument.

% Real courses begin here.
\DeclareOption{220a}{
    \input{local/220a}
}

\DeclareOption{220b}{
    \input{local/220b}
}

\DeclareOption{220c}{
    \input{local/220c}
}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

% Standard packages
\usepackage{amsmath, amsthm, latexsym, amssymb, graphicx, amsthm, wasysym, enumitem}
\usepackage{fancyhdr}
\usepackage{mathrsfs}
\usepackage{xcolor}
\usepackage{graphicx}
\usepackage{xstring}
\usepackage{hyperref}
\usepackage{xifthen}
\usepackage{xparse}
\usepackage[utf8]{inputenc}
\usepackage[top=2cm, bottom=4.5cm, left=2.5cm, right=2.5cm]{geometry}
\usepackage[english]{babel}
\usepackage{enumitem}
\usepackage[all]{xy}
\usepackage{wrapfig}
\usepackage{fancyvrb}
\usepackage[T1]{fontenc}
\usepackage{listings}
\usepackage{tikz, pgfplots}
\usetikzlibrary{patterns}
\usetikzlibrary{cd}

\usepackage{centernot}
\usepackage{mathtools}
\DeclarePairedDelimiter{\ceil}{\lceil}{\rceil}
\DeclarePairedDelimiter{\floor}{\lfloor}{\rfloor}
\DeclarePairedDelimiter{\card}{\vert}{\vert}

%\pgfplotsset{compat=1.16}

%------------------------------------
% Read/Write
%------------------------------------

% Read Definitions
\newcommand*{\topic}[1]{\gdef\@topic{#1}}
\newcommand*{\courseNumber}[1]{\gdef\@courseNumber{#1}}

\input{local/my_info} % ~Library/texmf/tex/generic/my_info.tex

%------------------------------------
% Header/Footer
%------------------------------------
\pagestyle{fancy}
\setlength{\headheight}{40pt}
\fancyhf{}

% Outside Header 
%	(Course Info)
\fancyhead[LE,RO]{ %
	\@author \\ %
	\@date
}

% Inside Header 
%	(My Info)
\fancyhead[RE,LO]{ %
	\textbf{\@courseNumber}: \@courseName \\ %
	\textbf{\@topic} %
}

% Outside Footer 
% 	(Page Number)
\fancyfoot[LE,RO]{\small\thepage}

\newenvironment{tightcenter}{%
  \setlength\topsep{0pt}
  \setlength\parskip{0pt}
  \begin{center}
}{%
  \end{center}
}

% First Page Header 
%	(Student Info & Topic Title)
\renewcommand*{\maketitle}[1][]{%
	% student header
	%\begin{minipage}[t]{.48\textwidth}
	%	Name: \@author %
	%\end{minipage}
	\begin{tightcenter}
	    \large{\@author}\\
		\large\textbf{\@topic}
	\end{tightcenter}
	% Remove header if "NoHead" parameter passed.
	\IfEqCase{#1}{ 
		{NoHead}{\thispagestyle{empty}}%
	}
}

%-----------------------------------
% Spacing
%-----------------------------------
\setlength{\parindent}{0pt}
\setlength{\parskip}{11pt minus 1pt}

\def\indented#1{\list{}{}\item[]}
\let\indented=\endlist

%------------------------------------
% Environments
%------------------------------------
\newcommand{\exercisetype}{Exercise}
\newcommand{\writtensection}{-1}

% Counters
\newcounter{exerciseCounter}
\newcounter{partCounter}[exerciseCounter]

\newenvironment{namedexercise}[1][\arabic{exerciseCounter}]{%
    \addtocounter{exerciseCounter}{1}%
    \setcounter{partCounter}{0}%
    \vspace{.2in}%
        \noindent{\bf #1}%
    \vspace{0.3em} \hrule \vspace{.1in}%
}{}

\def\isanum#1{%
  \if!\ifnum9<1#1!\else_\fi
    \emph{#1}\else#1\fi}

\newenvironment{numedexercise}[0]{%
	\stepcounter{exerciseCounter}%
    \vspace{.2in}%
        \ifx\writtensection\undefined
        \noindent{\bf \exercisetype \; \arabic{exerciseCounter} }%
        \else
            \ifx\isanum
                \ifnum \writtensection = -1
                \noindent{\bf \exercisetype \; \arabic{exerciseCounter} }%
                \else
                \noindent{\bf \exercisetype \; \writtensection.\arabic{exerciseCounter} }%
                \fi
            
        \fi
    \vspace{0.3em} \hrule \vspace{.1in}%
}{}

\newenvironment{alphaparts}[0]{%
  \begin{enumerate}[label=\text{(\alph*)}]
}{\end{enumerate}}

\newenvironment{arabicparts}[0]{%
  \begin{enumerate}[label=\arabic*)]
}{\end{enumerate}}

\newenvironment{exercisepart}[0]{%
  \item
}{}

\newcommand{\answerbox}[1]{
\begin{framed}
\vspace{#1}
\end{framed}}
   
   

\pagecolor{white}

\makeatletter
\newenvironment{solution}[1][\textit{Solution}]{\par
  \pushQED{\qed}%
  \normalfont \topsep6\p@\@plus6\p@\relax
  \list{}{\leftmargin=2em
          \rightmargin=\leftmargin
          \settowidth{\itemindent}{\itshape#1}%
          \labelwidth=\itemindent
          % the following line is not needed with amsart, but might be with other classes
          \parsep=12pt \listparindent=\parindent 
  }
  \item[\hskip\labelsep
        \itshape
    #1\@addpunct{.}]\ignorespaces
}{%
  \popQED\endlist\@endpefalse
}
\makeatother

\makeatletter
\renewenvironment{proof}[1][\proofname]{\par
  \pushQED{\qed}%
  \normalfont \topsep6\p@\@plus6\p@\relax
  \list{}{\leftmargin=2em
          \rightmargin=\leftmargin
          \settowidth{\itemindent}{\itshape#1}%
          \labelwidth=\itemindent
          % the following line is not needed with amsart, but might be with other classes
          \parsep=12pt \listparindent=\parindent 
  }
  \item[\hskip\labelsep
        \itshape
    #1\@addpunct{.}]\ignorespaces
}{%
  \popQED\endlist\@endpefalse
}
\makeatother



%--------------------------
% Shortcuts
%--------------------------
\theoremstyle{definition}
\newtheorem{problem}[]{Problem}
\setlist[enumerate]{label=(\alph*)}

\DeclarePairedDelimiter\set\{\}
\newcommand{\ord}[1]{\text{ord}(#1)}
\newcommand{\zmodn}{\mathbb{Z}/n\mathbb{Z}}
\newcommand{\im}[1]{\text{im}(#1)}
\renewcommand{\ker}[1]{\mathrm{Ker}(#1)}
\newcommand{\aut}[1]{\mathrm{Aut}(#1)}
\newcommand{\idx}{\text{id}_X}
\newcommand{\gen}[1]{\langle #1 \rangle}
\newcommand{\normal}{\unlhd}
\newcommand{\mz}{\mathbb{Z}}
\newcommand{\mq}{\mathbb{Q}}
\newcommand{\mn}{\mathbb{N}}
\newcommand{\mr}{\mathbb{R}}
\newcommand{\ol}[1]{\overline{#1}}
\renewcommand{\char}{\mbox{ char }}
\newcommand{\sse}{\subseteq}
\renewcommand{\bar}[1]{\overline{#1}}
\newcommand{\rad}[1]{\mbox{rad}(#1)}
\newcommand{\mf}[1]{\mathfrak{#1}}
\theoremstyle{remark}
\newtheorem{claim}{\bf{Claim}}