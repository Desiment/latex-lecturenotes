\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{lecturenotes}[2026/01/01 v0.1.0 Desiment LaTeX class for lecture notes]
%
% Public class entrypoint. This file declares engine requirements, passes unknown
% options to report, then loads class-local modules for localization, layout, and
% mathematical/reference setup.

\RequirePackage{iftex}
\RequireLuaTeX

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions\relax

\LoadClass[twoside]{report}

% ============================================================================
% IMPLEMENTATION MODULES
% ============================================================================
%
% Localization loads before layout and math modules so theorem names, headings,
% and package-generated text inherit the correct language setup.

\input{code/lecturenotes.localization.tex}
\input{code/lecturenotes.layout.tex}
\input{code/lecturenotes.math.tex}

\endinput
