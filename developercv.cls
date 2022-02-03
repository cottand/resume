%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Developer CV
% LaTeX Class
% Version 1.0 (28/1/19)
%
% This class originates from:
% http://www.LaTeXTemplates.com
%
% Authors:
% Jan Vorisek (jan@vorisek.me)
% Based on a template by Jan Küster (info@jankuester.com)
% Modified for LaTeX Templates by Vel (vel@LaTeXTemplates.com)
%
% License:
% The MIT License (see included LICENSE file)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%----------------------------------------------------------------------------------------
%	CLASS CONFIGURATION
%----------------------------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{developercv}[2019/01/28 Developer CV class v1.0]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{extarticle}} % Pass through any options to the base class
\ProcessOptions\relax % Process given options

\LoadClass{extarticle} % Load the base class

%----------------------------------------------------------------------------------------
%	PACKAGES AND OTHER DOCUMENT CONFIGURATIONS
%----------------------------------------------------------------------------------------

\setlength{\parindent}{0mm} % Suppress paragraph indentation

\usepackage[hidelinks]{hyperref} % Required for links but hide the default boxes around links

\pagestyle{empty} % No headers or footers

\RequirePackage{moresize} % Provides more font size commands (\HUGE and \ssmall)

%----------------------------------------------------------------------------------------
%	PAGE LAYOUT
%----------------------------------------------------------------------------------------

\RequirePackage{geometry} % Required for adjusting page dimensions and margins
\RequirePackage{xcolor}

\geometry{
    paper=a4paper, % Paper size, change to letterpaper for US letter size
    top=1cm, % Top margin
    bottom=1cm, % Bottom margin
    left=1.75cm, % Left margin
    right=1.75cm, % Right margin
    headheight=0.5cm, % Header height
    footskip=0.5cm, % Space from the bottom margin to the baseline of the footer
    headsep=0.5cm, % Space from the top margin to the baseline of the header
%showframe, % Uncomment to show how the type block is set on the page
}

%----------------------------------------------------------------------------------------
%	FONTS
%----------------------------------------------------------------------------------------

\usepackage[utf8]{inputenc} % Required for inputting international characters
\usepackage[T1]{fontenc} % Output font encoding for international characters

\usepackage[default]{raleway}
%\usepackage[defaultsans]{droidsans}
%\usepackage{cmbright}
%\usepackage{fetamont}
%\usepackage[default]{gillius}
%\usepackage{roboto}

\renewcommand*\familydefault{\sfdefault} % Force the sans-serif version of any font used
\definecolor{accent}{rgb}{0.149, 0.467, 0.541}
%	\definecolor{accent}{rgb}{0.0, 0.0, 0.0}
\RequirePackage{fontawesome} % Required for FontAwesome icons

\newcommand{\valignTwo}[2]{
    $
    \begin{array}{l}
        #1
    \end{array}
    $
    #2
}

% Command to output an icon in a black square box with text to the right
\newcommand{\icon}[3]{% The first parameter is the FontAwesome icon name, the second is the box size and the third is the text
    \valignTwo{
        \colorbox{accent}{\makebox(#2, #2){\textcolor{white}{\large\csname fa#1\endcsname}}}
    }{
        \hspace{-0.15cm}% Whitespace
        \vcenteredhbox{\textcolor{black}{#3}}% Text
    }
}
% Black Icon with no box
% #1 icon name, #2 size #3 text
\newcommand{\plainicon}[3]{
%    \hspace{0.01cm}% Whitespace
    \valignTwo{
        \colorbox{white}{\makebox(#2, #2){\textcolor{accent}{\large\csname fa#1\endcsname}}}
    }{
        \hspace{-1.2em}
        \textcolor{black}{#3}
    }
}


%----------------------------------------------------------------------------------------
%	CUSTOM SECTIONS
%----------------------------------------------------------------------------------------

% Command to output section title headings
\newcommand{\cvsect}[1]{% The only parameter is the section text
%    \vspace{0.2em} % Whitespace before the section title
    \colorbox{accent}{\textcolor{white}{\MakeUppercase{\textbf{#1}}}}\\% Section title
}

\newcommand{\cvsectdesc}[2]{% The only parameter is the section text
    \vspace{\baselineskip} % Whitespace before the section title
    \colorbox{accent}{\textcolor{white}{\MakeUppercase{\textbf{#1}}}}% Section title
    \space \colorbox{white}{\textcolor{black}{\small{\textit{#2}}}}\\% Section title
}

%----------------------------------------------------------------------------------------
%	ENTRY LIST
%----------------------------------------------------------------------------------------

\RequirePackage{longtable} % Required for tables that span multiple pages
\setlength{\LTpre}{0pt} % Remove default whitespace before longtable
\setlength{\LTpost}{0pt} % Remove default whitespace after longtable

\setlength{\tabcolsep}{0pt} % No spacing between table columns

% Environment to hold a new list of entries
\newenvironment{entrylist}{
    \begin{longtable}[H]{l l}
    }{
    \end{longtable}
}

\newcommand{\entryWidth}{0.15}
\newcommand{\entryWidthRight}{0.85}

\newcommand{\entry}[4]{% First argument for the leftmost date(s) text, second is for the bold entry heading, third is for the bold right-aligned entry qualifier and the fourth is for the entry description
    \parbox[t]{\entryWidth\textwidth}{
            {\small    #1 }
    }
    &\parbox[t]{\entryWidthRight\textwidth}{
            {\large\textbf{#2}, at \textbf{#3} }
%        \hfill% Horizontal whitespace
%        {\small \textbf{\textcolor{black}{#3}}}\\% Right-aligned entry qualifier text
    \para
    \\
    #4 % Entry description text
    }\\\\}

% Command to output a separator slash between lists, e.g. '  /  '
\newcommand{\slashsep}{\hspace{3mm}/\hspace{3mm}}

% #1 Name, #2 Github, #3 Techs, #4 Desc
\newcommand{\projGhEntry}[4]{
    \parbox[t]{0.14\textwidth}{% 17.5% of the text width of the page
            {\small\texttt{#3}}
    }%
    \hspace{0.01\textwidth}
    &\parbox[t]{\entryWidthRight\textwidth}{% 82.5% of the text width of the page
            {\large\textbf{#1} }
        \hfill% Horizontal whitespace
        {\small \plainicon{Github}{10}{\href{https://github.com/#2}{\textcolor{black}{#2}}}}\\% Right-aligned entry qualifier text
        #4 % Entry description text
    }\\\\
}

% #1 Name, #2 Github, #3 Techs, #4 Desc
\newcommand{\projEntry}[4]{
    \parbox[t]{0.14\textwidth}{% 17.5% of the text width of the page
            {\small\texttt{#3}}
    }%
    \hspace{0.01\textwidth}
    &\parbox[t]{\entryWidthRight\textwidth}{% 82.5% of the text width of the page
            {\large\textbf{#1} }
        \hfill% Horizontal whitespace
        {\small \plainicon{Globe}{10}{#2}}\\% Right-aligned entry qualifier text
        #4 % Entry description text
    }\\\\
}

