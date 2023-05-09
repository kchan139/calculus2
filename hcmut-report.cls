\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{hcmut-report}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass[a4paper]{article}

\RequirePackage[utf8]{vntex,inputenc}
\RequirePackage{anyfontsize,amsmath,amssymb}
\RequirePackage[T5]{fontenc}

\RequirePackage{geometry,graphicx,indentfirst,setspace}
\RequirePackage{booktabs}
\RequirePackage[center]{caption}

\RequirePackage{fancyhdr,hyperref}
\RequirePackage[super,square,sort]{natbib}
\RequirePackage[nameinlink]{cleveref} % use \Cref{} instead of \ref{}

% Change to '[english,vietnamese]' to use Vietnamese labels
\RequirePackage[english]{babel}

% Draft watermark
% https://github.com/callegar/LaTeX-draftwatermark

% Custom commands
\newcommand{\Month}{
  \ifcase \the\month
  \or January
  \or February
  \or March
  \or April
  \or May
  \or June
  \or July
  \or August
  \or September
  \or October
  \or November
  \or December
  \fi
}

\newcommand{\@upperuniname}{Vietnam National University, Ho Chi Minh City}
\newcommand{\@uniname}{Ho Chi Minh City University of Technology}

\newcommand{\@deptname}{Faculty of Applied Science}
\newcommand{\deptname}[1]{\renewcommand{\@deptname}{#1}}

\newcommand{\@coursename}{Course name}
\newcommand{\coursename}[1]{\renewcommand{\@coursename}{#1}}

\newcommand{\@reporttype}{Assignment Report}
\newcommand{\reporttype}[1]{\renewcommand{\@reporttype}{#1}}

\renewcommand{\@title}{Report title}

\newcommand{\@reportplace}{Ho Chi Minh City}
\newcommand{\reportplace}[1]{\renewcommand{\@reportplace}{#1}}

\newcommand{\@advisor}{Advisor}
\newcommand{\advisor}[1]{\renewcommand{\@advisor}{#1}}

\newcommand{\@reporttime}{\Month \the\year}
\newcommand{\reporttime}[1]{\renewcommand{\@reporttime}{#1}}

% Configurations
%\graphicspath{{subdir1/}{subdir2/}{subdir3/}...{subdirn/}}

\geometry{
  paper=a4paper,
  left=3cm,
  right=2cm,
  vmargin=2cm,
  includeheadfoot=true,
  headheight=25pt
}

\onehalfspacing
\raggedbottom

% Allow page breaks inside align* environment
%\allowdisplaybreaks{}

% Makes a lot of things blue, avoid at all costs
%\everymath{\color{blue}}

% Numbering format
% {equation}{section} means <section number>.<equation number>
% {equation}{subsection} means <section number>.<subsection number>.<equation number>
%\numberwithin{equation}{section}

% Set depth of numbering for sections and table of contents
%\setcounter{secnumdepth}{3}
%\setcounter{tocdepth}{3}

\AtBeginDocument{\renewcommand*\bibname{Bibliography}}

\hypersetup{
  colorlinks=true,
  linkcolor=black,
  citecolor=red,
  urlcolor=blue
}

\renewcommand{\headrulewidth}{0.3pt}
\renewcommand{\footrulewidth}{0pt}

\pagestyle{fancy}
\fancyhf{}

%\renewcommand{\subsectionmark}[1]{\markright{\thesubsection.\ #1}}

\if@twoside
  \fancyhead[EL]{
    \bfseries
    \begin{tabular}{rl}
      \begin{picture}(25,15)(0,0)
        \put(0,-8){\includegraphics[width=8mm]{graphics/hcmut.png}}
      \end{picture}
      \begin{tabular}{l}
        \ttfamily\@uniname \\
        \ttfamily\@deptname \\
      \end{tabular}
    \end{tabular}
  }
  \fancyhead[OR]{
    \bfseries
    \begin{tabular}{rl}
      \begin{tabular}{r}
        \ttfamily\@uniname \\
        \ttfamily\@deptname \\
      \end{tabular}
      \begin{picture}(25,15)(0,0)
        \put(0,-8){\includegraphics[width=8mm]{graphics/hcmut.png}}
      \end{picture}
    \end{tabular}
  }
\else
  \fancyhead[R]{
    \bfseries
    \begin{tabular}{rl}
      \begin{tabular}{r}
        \ttfamily\@uniname \\
        \ttfamily\@deptname \\
      \end{tabular}
      \begin{picture}(25,15)(0,0)
        \put(0,-8){\includegraphics[width=8mm]{graphics/hcmut.png}}
      \end{picture}
    \end{tabular}
  }
\fi

\fancyfoot[C]{\thepage}

% Custom pages and sections
\newcommand{\coverpage}{
  \pagestyle{empty}

  \vspace*{-3\baselineskip}
  \begin{center}
    \MakeUppercase{\@upperuniname}

    \MakeUppercase{\@uniname}

    \MakeUppercase{\@deptname}
    \vfill
    \includegraphics[scale=0.4]{graphics/hcmut.png}
    \vfill
    \bfseries
    \begin{tabular}{c}
      % \Large\@coursename                                 \\
      % {}                                                 \\
      \midrule                                           \\
      {}                                                 \\
      \Huge\parbox[c]{0.8\linewidth}{\centering \@title} \\
      {}                                                 \\                                          \\
      \Large\@reporttype                                 \\
      {}                                                 \\
      
      \bottomrule
    \end{tabular}
    \vfill
    \mdseries
    Group Members: \\[10pt]
    \begin{tabular}{ll}
      Tran Dinh Dang Khoa & 2211649 \\
      Phan Quoc Khai      & 2252339 \\
      Ha Tuan Khang       & 2252289 \\
      Pham Nguyen Tue Lam & 2252425 \\
      Phan Dang Kien      & 2211730 \\
    \end{tabular}
    \vfill
    \MakeUppercase{\@reportplace, \@reporttime}
  \end{center}

  \cleardoublepage
  \pagestyle{fancy}
}
