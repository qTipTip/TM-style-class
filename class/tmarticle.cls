\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{TMarticle}
\LoadClass{article} % we use a standard article as a base-class

\RequirePackage{listings} % for our code listings
\RequirePackage[usenames, dvipsnames, svgnames, table]{xcolor}
\RequirePackage{mdframed}
\RequirePackage{graphicx}
\RequirePackage{calc}

% color definitions
\definecolor{TMgreen}{RGB}{14, 191, 48}
\definecolor{TMorange}{RGB}{243, 126, 25}
\definecolor{TMred}{RGB}{230, 6, 85}
\definecolor{TMcodeBackground}{RGB}{224, 224, 224}
\definecolor{TMcodeFrame}{RGB}{109, 108, 109}
\definecolor{TMtableHead}{RGB}{211, 47, 0}
\definecolor{TMtableRowOne}{RGB}{230, 230, 230}
\definecolor{TMtableRowTwo}{RGB}{240, 240, 240}
\definecolor{TMemphasis}{RGB}{165, 32, 23}
\definecolor{TMwarning}{RGB}{250, 175, 52}
\definecolor{TMcritical}{RGB}{229, 0, 72}
\definecolor{TMnormal}{RGB}{54, 160, 220}
\definecolor{TMbulletinBackground}{RGB}{224, 224, 224}

% we now start creating the TM-styled code listing environments
% the lstlisting environment is wrapped in an MD-frame
% first of all we need to define the mdframestyle that
% takes care of the background and the left bar

\mdfdefinestyle{TMstyleCode}{
            skipabove=4mm,
            skipbelow=0mm,
            %remove borders
            rightline=false,
            topline=false,
            bottomline=false,
            linewidth=1mm,
            %margins
            innertopmargin=2mm,
            innerleftmargin=0mm,
            innerbottommargin=0mm,
            innerrightmargin=10pt,
            linecolor=TMcodeFrame,
            backgroundcolor=TMcodeBackground
}

\lstdefinestyle{TMstyle}{
    showstringspaces=false,
    numbers=left,
    numbersep=7mm,
    numberstyle=\color{Black},
    stepnumber=1,
    tabsize=3,
    breakatwhitespace=false,
    breaklines=true,
    captionpos=b,
    basicstyle=\color{Black}\ttfamily,
    commentstyle=\color{TMgreen},
    keywordstyle=\color{TMorange}\bfseries,
    stringstyle=\color{TMred},
    frame=leftline,
    framesep=0mm,
    xleftmargin=3mm,
    framesep=2mm,
    framerule=0mm,
    abovecaptionskip=5mm,
    aboveskip=\baselineskip,
    belowskip=\baselineskip
}

% need to use inner commands to avoid the verbatim nature
% of listing environments!

\lstnewenvironment{TMcode}[3]
{
    \lstset{style=TMstyle, language=#1, caption=#2}
    \mdfsetup{style=TMstyleCode}
    \mdframed
    \hspace*{3mm}
    \minipage{0.75cm}
    \includegraphics[width=\linewidth]{images/code.png}
    \endminipage
    \hspace*{1mm}
    \minipage{\textwidth-1.05cm}
        {\sffamily\Large #3}
    \endminipage
    \vspace*{-2mm}
}
{
    \endmdframed
}
