\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{lecturenotes}[2026/01/01 Desiment LaTeX class for lecture notes]
\LoadClass[twoside]{report}

% ============================================================================
% LOCALIZATION
% ============================================================================

\RequirePackage{fontspec}
\setmainfont{CMU Serif}
\setsansfont{CMU Sans Serif}
\setmonofont{CMU Typewriter Text}
%\setmonofont{Fira Code}[Contextuals=Alternate,Scale=0.9]
%\setmonofont{Inconsolata}

% Русский язык
\RequirePackage[babelshorthands]{polyglossia}
\setmainlanguage{russian}
\setotherlanguage{english}

% Smart quotes based on current language
\RequirePackage[autostyle]{csquotes}

% ============================================================================
% LAYOUT OPTIONS
% ============================================================================

\RequirePackage{etoc}
\RequirePackage{geometry}
\RequirePackage{epigraph}
\RequirePackage[pagestyles]{titlesec}
%
\geometry{%
  left=2cm,
  right=2cm,
  top=2cm,
  bottom=2cm,
  bindingoffset=0cm
}

\geometry{%
  a4paper,
  margin=1cm,
  includefoot,
  includehead
}

\titleformat{\chapter}[frame]{\Large}{%
  \filright
  \footnotesize
  \enspace ГЛАВА~\arabic{chapter}\enspace%
}{1.5ex}{\bfseries\filcenter}
\newpagestyle{headedpage}{%
    \headrule
    \sethead[\thepage][Глава~\thechapter. \chaptertitle][]%
        {}{\sectiontitle}{\thepage}%
}

% ============================================================================
% PREAMBLE
% ============================================================================

\usepackage[tikz,listings,memoization]{flsuite}
\definecolor{deepblue}{RGB}{53,102,161}
\usepackage[theorems, framedtheorems]{tssuite}

\NewDocumentTheorem{theorem}{Теорема}[][parent=section]
\MakeFramedTheorem{Theorem}{theorem}

\NewDocumentTheorem{lemma}{Лемма}[][sharenumber=theorem]
\MakeFramedTheorem{Lemma}{lemma}

\NewDocumentTheorem{corollary}{Следствие}[][sharenumber=theorem]
\MakeFramedTheorem{Corollary}{corollary}

\NewDocumentTheorem{proposition}{Предложение}[][sharenumber=theorem]
\MakeFramedTheorem{proprosition}{proposition}

\NewDocumentTheorem{definition}{Определение}[][sharenumber=theorem, style=definition]
\MakeFramedTheorem{Definition}{definition}

\NewStarredTheorem{example}{Пример}[style=definition]
\NewStarredTheorem{notation}{Нотация}[style=definition]
\NewStarredTheorem{remark}{Замечание}[style=remark]

\usepackage[all]{xamsmath}
\XAMSMathLoadPlugin{foundations}
\XAMSMathLoadPlugin{algebra}
\XAMSMathLoadPlugin{calculus}
\XAMSMathLoadPlugin{combinatorics}
\XAMSMathLoadPlugin{probability}

\usepackage[configuration=references.lua]{refsuite}

\AtBeginDocument{%
    \allowdisplaybreaks
    \pagestyle{headedpage}
    \tikzset{every picture/.style={line width=0.75pt}} %set default line width to 0.75pt
}

