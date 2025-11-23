% To Do
% perbaiki jarak setelah figure dengan subsubsection
% perbaiki jarak setelah table dengan subsubsection
% buat header table center tapi isinya rata kiri

%===========================================================
% Skripsi LaTeX Class Style
%
% Original author:
% Dir Sulaiman
% https://github.com/dirsulaiman/skripsi
% 
% Thanks and reference to:
% Andi Kresna Jaya, S.Si.M.Si (unhasskripsi-latex)
% Guntur D Putra (https://github.com/gtrdp/template-skripsi)
% 
% License:
% BSD 3-Clause "New" or "Revised" License
% https://github.com/dirsulaiman/skripsi/blob/master/LICENSE
%-----------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{lib/skripsi}[2020/03/11 Skripsi Class]
\LoadClass[a4paper, 12pt]{report}

%===========================================================
% Require Package
%-----------------------------------------------------------
% to add indent for first paragraph
\RequirePackage{indentfirst}

% to justify
\RequirePackage{ragged2e}

% Prevent hyphenating the words
\RequirePackage[none]{hyphenat}
\sloppy

% Times New Roman Font like
\RequirePackage{newtxtext, newtxmath}

% to use or import image
\RequirePackage{graphicx}
\RequirePackage[export]{adjustbox}

% to use color in table
\RequirePackage[table]{xcolor}

% use CSV to generate table
\RequirePackage{csvsimple}

% to set space of paragraph line
\RequirePackage{setspace}
\onehalfspacing

% to customize Table of contents
\RequirePackage{tocloft}

% to customize footer and header
\RequirePackage{fancyhdr}

% to hide Hyperlink color
\RequirePackage[bookmarks=true,hidelinks]{hyperref}

% Counter for figure, table and equation
\RequirePackage{chngcntr}

% Setup the caption of figure, table and equation
\RequirePackage[font=small, labelfont={it},textfont={it}, justification=centering]{caption}

% Setup label of enumerate item
\RequirePackage{enumitem}
% \renewcommand{\theenumi}{\Alph{enumi}}

% use Watermark
\RequirePackage[pages=some]{background}

% use listings for code script
\RequirePackage{listings}
\RequirePackage{color}

% float [H]
\RequirePackage{float}
%-----------------------------------------------------------
% End Require Package
%===========================================================

\renewcommand{\baselinestretch}{1.42}
\renewcommand{\UrlFont}{\small\rm}

\newcommand{\listappendicesname}{DAFTAR LAMPIRAN}
\newlistof{appendices}{apc}{\listappendicesname}
\newcommand{\appendices}[1]{\addcontentsline{apc}{appendices}{#1}}
\newcommand{\newappendix}[1]{\section{#1}\appendices{#1}}

%===========================================================
% Package Daftar Pustaka, bentuk citasi
% Config
% - style, citestyle = {authoryear, numeric, apa, mla}
% - sorting {year,name,title} = ynt
%-----------------------------------------------------------
\usepackage[
    backend=biber,
    style=apa
]{biblatex}
\DeclareLanguageMapping{english}{english-apa}
\addbibresource{bibtex/daftar-pustaka.bib}

% redefine "et al" in bib to "dkk"
\DefineBibliographyStrings{english}{andothers={et al\adddot}}
% force to use quote in title field of bibliographi
\DeclareFieldFormat
[article,inbook,incollection,inproceedings,patent,thesis,masterthesis,misc,unpublished, book]
{title}{\mkbibquote{#1\isdot}}

% new citation style
\let\oldcitate\cite
\newcommand*\thecite[1]{\hyperlink{cite.\therefsection @#1}{(\citeauthor*{#1} \citeyear{#1})}}
\renewcommand*\cite[1]{\hyperlink{cite.\therefsection @#1}{(\citeauthor*{#1} \citeyear{#1})}}
%-----------------------------------------------------------
% End Biblatex Config
%===========================================================


%===========================================================
% Setting footer, header and page number
%-----------------------------------------------------------
\pagestyle{fancy}
\fancyhf{}
\fancyfoot[R]{\thepage}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
\fancypagestyle{plain}{ %style for chapter page
    \fancyhf{} % clear all header and footer fields
    \fancyfoot[R]{\thepage}
    % \renewcommand{\headrulewidth}{0pt}
    % \renewcommand{\footrulewidth}{0pt}
}
\fancypagestyle{empty}{ %style for cover
    \fancyhf{}
    % \renewcommand{\headrulewidth}{0pt}
    % \renewcommand{\footrulewidth}{0pt}
}
\fancypagestyle{theheader}{ %style for header
    \fancyhead[R]{Universitas Hasanuddin}
}
%-----------------------------------------------------------
% End Setting footer, header and page number
%===========================================================


%===========================================================
% Code Script, Listing
%-----------------------------------------------------------
\definecolor{light-gray}{gray}{0.95}
\definecolor{dkgreen}{rgb}{0,0.6,0}
\definecolor{gray}{rgb}{0.5,0.5,0.5}
\definecolor{mauve}{rgb}{0.58,0,0.82}

\lstdefinestyle{python}{
    language=Python,
    emptylines=1,
    backgroundcolor=\color{light-gray},
    rulecolor=\color{light-gray},
    xleftmargin=1cm,
    framexleftmargin=1cm,
    columns=flexible,
    basicstyle={\linespread{0.85}\small\ttfamily},
    breaklines=true,
    breakatwhitespace=true,
    showstringspaces=false,
    tabsize=2,
    moredelim=**[is][\color{red}]{@}{@},
    keywordstyle=\color{blue},
    commentstyle=\color{dkgreen},
    stringstyle=\color{mauve},
}

\lstdefinestyle{shell}{
    language=bash,
    emptylines=1,
    backgroundcolor=\color{black},
    rulecolor=\color{black},
    columns=flexible,
    basicstyle={\small\ttfamily\color{white}},
    breaklines=true,
    breakatwhitespace=true,
    showstringspaces=false,
    tabsize=2,
    moredelim=**[is][\color{red}]{@}{@},
    keywordstyle=\color{blue},
    commentstyle=\color{dkgreen},
    stringstyle=\color{mauve},
}

\lstdefinestyle{plain}{
    emptylines=1,
    backgroundcolor=\color{light-gray},
    rulecolor=\color{light-gray},
    columns=flexible,
    basicstyle={\footnotesize\ttfamily\color{black}},
    breaklines=true,
    breakatwhitespace=true,
    tabsize=2
}
%-----------------------------------------------------------
% End Code Script, Listing
%===========================================================


%===========================================================
% Page Layout, Margin
%-----------------------------------------------------------
\setlength{\topmargin}{0cm}
\setlength{\headheight}{1cm}
\setlength{\headsep}{0.2cm}
\setlength{\topskip}{1ex}
\setlength{\oddsidemargin}{1.2cm}
\setlength{\evensidemargin}{1.2cm}
\setlength{\textwidth}{14.3cm}
\setlength{\textheight}{22.7cm}
\setlength{\footskip}{1cm}
\setlength{\marginparsep}{0pt}
\setlength{\marginparwidth}{0pt}
%to set indent approx 6 character
\setlength{\parindent}{3em}
%-----------------------------------------------------------
% End Page Layout, Margin
%===========================================================


%===========================================================
% Set Watermark
%-----------------------------------------------------------
\backgroundsetup{
    scale=1,
    angle=0,
    opacity=.2,
    hshift=3mm,
    contents={\includegraphics[width=14cm]{images/logo-binus-university.jpg}}
}
\newcommand\addwatermark{\BgThispage}
%-----------------------------------------------------------
% End Set Watermark
%===========================================================


%===========================================================
% Redefition Terms
%-----------------------------------------------------------
\def\prefacename{PRAKATA}
\def\contentsname{DAFTAR ISI}
\def\listfigurename{DAFTAR GAMBAR}
\def\listtablename{DAFTAR TABEL}
\def\listappendixname{DAFTAR LAMPIRAN}
\def\nomenclaturename{DAFTAR LAMBANG DAN SINGKATAN}
\def\partname{BAGIAN}
\def\chaptername{BAB}
\def\appendixname{LAMPIRAN}
\def\refname{DAFTAR PUSTAKA}
\def\bibname{DAFTAR PUSTAKA}
\def\indexname{Indek}
\def\figurename{Gambar}
\def\tablename{Tabel}
\def\pagename{Halaman}
%-----------------------------------------------------------
% End Redefinition Terms
%===========================================================


%===========================================================
% Define thesis's inputs
%-----------------------------------------------------------
\newcommand{\titleskripsi}[1]{\gdef\@titleskripsi{#1}}
\newcommand{\@titleskripsi}{}
\newcommand{\titleeng}[1]{\gdef\@titleeng{#1}}
\newcommand{\@titleeng}{}
\newcommand{\fullnameA}[1]{\gdef\@fullnameA{#1}}
\newcommand{\@fullnameA}{}

\newcommand{\idnumA}[1]{\gdef\@idnumA{#1}}
\newcommand{\@idnumA}{}

\newcommand{\fullnameB}[1]{\gdef\@fullnameB{#1}}
\newcommand{\@fullnameB}{}

\newcommand{\idnumB}[1]{\gdef\@idnumB{#1}}
\newcommand{\@idnumB}{}

\newcommand{\fullnameC}[1]{\gdef\@fullnameC{#1}}
\newcommand{\@fullnameC}{}

\newcommand{\idnumC}[1]{\gdef\@idnumC{#1}}
\newcommand{\@idnumC}{}

\newcommand{\datesubmit}[1]{\gdef\@datesubmit{#1}}
\newcommand{\@datesubmit}{}
\newcommand{\monthsubmit}[1]{\gdef\@monthsubmit{#1}}
\newcommand{\@monthsubmit}{}
\newcommand{\yearsubmit}[1]{\gdef\@yearsubmit{#1}}
\newcommand{\@yearsubmit}{}
\newcommand{\@examdate}{\@datesubmit \space \@monthsubmit \space \@yearsubmit}
\newcommand{\degree}[1]{\gdef\@degree{#1}}
\newcommand{\@degree}{}
\newcommand{\program}[1]{\gdef\@program{#1}}
\newcommand{\@program}{}
\newcommand{\dept}[1]{\gdef\@dept{#1}}
\newcommand{\@dept}{}
\newcommand{\faculty}[1]{\gdef\@faculty{#1}}
\newcommand{\@faculty}{}
\newcommand{\university}[1]{\gdef\@university{#1}}
\newcommand{\@university}{}
\newcommand{\city}[1]{\gdef\@city{#1}}
\newcommand{\@city}{}
\newcommand{\firstsupervisor}[1]{\gdef\@firstsupervisor{#1}}
\newcommand{\@firstsupervisor}{}
\newcommand{\firstsupervisorNIP}[1]{\gdef\@firstsupervisorNIP{#1}}
\newcommand{\@firstsupervisorNIP}{}
\newcommand{\secondsupervisor}[1]{\gdef\@secondsupervisor{#1}}
\newcommand{\@secondsupervisor}{}
\newcommand{\secondsupervisorNIP}[1]{\gdef\@secondsupervisorNIP{#1}}
\newcommand{\@secondsupervisorNIP}{}
\newcommand{\firstexaminer}[1]{\gdef\@firstexaminer{#1}}
\newcommand{\@firstexaminer}{}
\newcommand{\secondexaminer}[1]{\gdef\@secondexaminer{#1}}
\newcommand{\@secondexaminer}{}
\newcommand{\headprogram}[1]{\gdef\@headprogram{#1}}
\newcommand{\@headprogram}{}
\newcommand{\headprogramNIP}[1]{\gdef\@headprogramNIP{#1}}
\newcommand{\@headprogramNIP}{}
%-----------------------------------------------------------
% End Define thesis's inputs
%===========================================================


%===========================================================
% Define Cover Seminar Proposal/Hasil
%-----------------------------------------------------------
\def\coverproposal{
    \thispagestyle{empty}
    \pagenumbering{roman}
    \setcounter{page}{1}
    \begin{center}
        \begin{singlespace}
            \MakeUppercase{\normalfont\bfseries\@titleskripsi}\par\nobreak
            \vfill
            \includegraphics[height=4.85cm]{images/logo-binus-university}
            \vfill

            Oleh\\
            \normalfont\bfseries{\@fullnameA}\\
            \normalfont\bfseries{\@idnumA}\\[1em]

            \normalfont\bfseries{\@fullnameB}\\
            \normalfont\bfseries{\@idnumB}\\[1em]

            \normalfont\bfseries{\@fullnameC}\\
            \normalfont\bfseries{\@idnumC}\\

            \vfill

            % {\normalfont
            %   & Pembimbing Utama &: \@firstsupervisor\\
            %   & Pembimbing Pertama  &: \@secondsupervisor\\
            %  & Penguji  &: 1.\@firstexaminer\\
            % & & \hspace{1.8mm} 2.\@secondexaminer\\
            % \end{tabular}
            %}

            \vspace{2.0cm}
            {\normalfont
                \MakeUppercase{\normalfont\bfseries  \@program}\\
                %\MakeUppercase{\normalfont\bfseries  \@dept}\\
                \MakeUppercase{\normalfont\bfseries  \@faculty}\\
                \MakeUppercase{\normalfont\bfseries\@university}\\
                \MakeUppercase{\normalfont\bfseries\@city}\\

                \vspace{0.2cm}
                \normalfont\bfseries{\MakeUppercase{\@monthsubmit} {\@yearsubmit}}
            }
        \end{singlespace}
    \end{center}
    \pagebreak
}
%-----------------------------------------------------------
% End Define Cover Seminar Proposal/Hasil
%===========================================================


%===========================================================
% Define Cover Skripsi
%-----------------------------------------------------------
\def\cover{%
    \thispagestyle{empty}%
    \pagenumbering{roman}
    \setcounter{page}{1}
    \begin{center}
        \begin{singlespace}
            \MakeUppercase{\normalfont\bfseries Skripsi}
            \vspace{2.0cm}

            \MakeUppercase{\normalfont\bfseries\@titleskripsi}\\
            \par\nobreak
            \vspace{2cm}

            {\normalfont\large{Disusun dan diajukan oleh}}\\
            \vspace{1.5cm}

            \normalfont\bfseries{\@fullnameA}\\
            \normalfont\bfseries{\@idnumA}\\[1em]

            \normalfont\bfseries{\@fullnameB}\\
            \normalfont\bfseries{\@idnumB}\\[1em]

            \normalfont\bfseries{\@fullnameC}\\
            \normalfont\bfseries{\@idnumC}\\
            \vfill

            \includegraphics[height=4.85cm]{images/logo-binus-university}
            \vfill

            {\normalfont
                \MakeUppercase{\normalfont\bfseries \@program}\\
                \MakeUppercase{\normalfont\bfseries \@faculty}\\
                \MakeUppercase{\normalfont\bfseries\@university}\\
                \MakeUppercase{\normalfont\bfseries\@city}\\

                \vspace{0.2cm}
                \normalfont\bfseries{\MakeUppercase{\@yearsubmit}}
            }\\
        \end{singlespace}
    \end{center}
    \pagebreak
}

%-----------------------------------------------------------
% End Define Cover Skripsi
%===========================================================


%===========================================================
% Define Title Page
%-----------------------------------------------------------
\def\titlepage{
    \begin{center}
        \addwatermark
        \addcontentsline{toc}{chapter}{HALAMAN JUDUL}
        \begin{singlespace}
            \vspace*{2cm}
            \MakeUppercase{\normalfont\bfseries\@titleskripsi}\\
            \vfill

            \bfseries{SKRIPSI}
            \vfill

            \normalfont\bfseries{diajukan sebagai salah satu syarat}\\
            \normalfont\bfseries{untuk gelar kesarjanaan pada}\\
            \normalfont\bfseries{Program Studi Teknik Informatika}\\
            \normalfont\bfseries{Jenjang Pendidikan Strata-1}\\
            \vfill

            \normalfont\bfseries{oleh}\\
            \vfill

            {\normalfont\bfseries
                \@fullnameA \\[-0.2em]
                \@idnumA \\[1em]

                \@fullnameB \\[-0.2em]
                \@idnumB \\[1em]

                \@fullnameC \\[-0.2em]
                \@idnumC
            }\\
            \vfill

            {\normalfont
                \MakeUppercase{\normalfont\bfseries \@program}\\
                \MakeUppercase{\normalfont\bfseries \@faculty}\\
                \MakeUppercase{\normalfont\bfseries\@university}\\
                \MakeUppercase{\normalfont\bfseries\@city}\\
                \vspace{0.2cm}
                {\normalfont\bfseries{{\@monthsubmit} {\@yearsubmit}}}
                \vspace{2cm}
            }\\
        \end{singlespace}
    \end{center}
    \pagebreak
}
%-----------------------------------------------------------
% End Define Title Page
%===========================================================


%===========================================================
% Define Authentication Page
%-----------------------------------------------------------
\def\authenticationpage{
    \addwatermark
    \addcontentsline{toc}{chapter}{Pernyataan Kesiapan Skripsi untuk Sidang Skripsi}

    \begin{center}
        \MakeUppercase{\normalfont\large\bfseries\expandafter{Universitas Bina Nusantara}}\\
        \noindent\rule{\linewidth}{0.4pt}
        \normalfont\bfseries{Pernyataan Kesiapan Skripsi untuk Sidang Skripsi}
        \vspace{0.2cm}
    \end{center}

    \noindent
    \normalfont\bfseries{Pernyataan Penyusunan Skripsi:} \\
    \normalfont\bfseries{Kami,} \\

    \begin{center}
        \normalfont\bfseries{\@fullnameA}\\
        \normalfont\bfseries{\@fullnameB}\\
        \normalfont\bfseries{\@fullnameC}\\
    \end{center}

    % \begin{tabular}{ m{0.5cm} l c l }
    %     & Nama          & : & \@fullnameA \\
    %     & Nama          & : & \@fullnameB \\
    %     & Nama          & : & \@fullnameC \\
    % \end{tabular}


    \noindent
    dengan ini menyatakan bahwa Skripsi yang berjudul:

    \begin{center}
        \bfseries{\@titleskripsi}\\
        \bfseries{\@titleeng}
    \end{center}

    \noindent
    adalah benar hasil karya kami dan belum pernah diajukan sebagai karya ilmiah, sebagian atau seluruhnya, atas nama kami atau pihak lain. \\

    \vspace{1cm}

    \begin{center}
    \begin{tabular}{ccc}
        {\@fullnameA} & {\@fullnameB} & {\@fullnameC} \\
        NIM. {\@idnumA} & NIM. {\@idnumB} & NIM. {\@idnumC}
        \vspace{0.4cm}
    \end{tabular}
        \normalfont\bfseries{Disetujui oleh Pembimbing}\\
        \normalfont\bfseries{Saya setuju Skripsi tersebut layak diajukan untuk Sidang Skripsi}\\
    \end{center}

    \vspace{1cm}

    \begin{center}
    \begin{tabular}{c c c}
        {\@firstsupervisor} & & {23 November 2025} \\
        \cline{1-1} \cline{3-3}
        {\@firstsupervisorNIP} & & \\
        \vspace{0.4cm}
    \end{tabular}
    \end{center}

    \pagebreak
}
%-----------------------------------------------------------
% End Define Authentication Page
%===========================================================


%===========================================================
% Define Supervisor Approval Page
%-----------------------------------------------------------
\def\supervisorapprovalpage{
    \addwatermark
    \addcontentsline{toc}{chapter}{HALAMAN PERSETUJUAN PEMBIMBING}
    \begin{center}
        \MakeUppercase{\normalfont\large\bfseries\expandafter{\@titleskripsi}}\\
        \vspace{0.5cm}
    \end{center}

    \begin{center}
        Disusun dan diajukan oleh\\
        \begin{center}
            \begin{singlespace}
                \large\bfseries{\@fullnameA}\\
                \large\bfseries{\@idnumA}\\
                \vspace{1.0cm}

                \large\bfseries{\@fullnameB}\\
                \large\bfseries{\@idnumB}\\
                \vspace{1.0cm}

                \large\bfseries{\@fullnameC}\\
                \large\bfseries{\@idnumC}\\
            \end{singlespace}
        \end{center}

        Telah dipertahankan di hadapan Panitia Ujian yang dibentuk dalam rangka Penyelesaian Studi Program Sarjana pada Program Studi {\@program} Fakultas {\@faculty} {\@university} dan dinyatakan telah memenuhi syarat kelulusan \\

        \vspace{0.2cm}
        Menyetujui,
        \vspace{0.2cm}
    \end{center}

    \begin{table}[h]
        \centering
        \begin{tabular}{ >{\centering\arraybackslash}m{6cm}  m{2cm} >{\centering\arraybackslash}m{6cm} }
            Pembimbing Utama              &  & Pembimbing Pertama             \\
                                          &  &                                \\
                                          &  &                                \\
                                          &  &                                \\
                                          &  &                                \\
                                          &  &                                \\
            \underline{\@firstsupervisor} &  & \underline{\@secondsupervisor} \\
            NIP. \@firstsupervisorNIP     &  & NIP. \@secondsupervisorNIP
        \end{tabular}

        \vspace{1cm}
        \begin{tabular}{ >{\centering\arraybackslash}m{6cm} }
            Ketua Program Studi       \\
            \\
            \\
            \\
            \\
            \\
            \underline{\@headprogram} \\
            NIP. \@headprogramNIP
        \end{tabular}
    \end{table}
    \pagebreak
}
%-----------------------------------------------------------
% End Define Supervisor Approval Page
%===========================================================


%===========================================================
% Define Approval Page
%-----------------------------------------------------------
\def\approvalpage{%
    \addwatermark
                    \@fullnameA \\
                    NIM. \@idnumA \\
                    \vspace{0.3cm} \\
                    \@fullnameB \\
                    NIM. \@idnumB \\
                    \vspace{0.3cm} \\
                    \@fullnameC \\
                    NIM. \@idnumC \\
        \vspace{0.5cm}
    \end{center}

    \begin{singlespace}
        \noindent
        Skripsi ini diajukan oleh:
        \begin{center}
            \begin{tabular}{ p{3cm}  p{.1cm} p{10.5cm}}
                Nama          & : & \@fullnameA \\
                NIM           & : & \@idnumA \\
                \multicolumn{3}{c}{} \\[-0.3cm] 
                Nama          & : & \@fullnameB \\
                NIM           & : & \@idnumB \\
                \multicolumn{3}{c}{} \\[-0.3cm]
                Nama          & : & \@fullnameC \\
                NIM           & : & \@idnumC \\
                \multicolumn{3}{c}{} \\[0.2cm]
                Program Studi & : & \@program \\
                Judul Skripsi & : & \textbf{\@titleskripsi} \\
            \end{tabular}
        \end{center}
    \end{singlespace}

    \noindent
    Telah dipertahankan di depan Tim Penguji dan diterima sebagai bagian persyaratan untuk memperoleh gelar {\@degree} pada Program Studi {\@program} Fakultas {\@faculty} {\@university}.\\

    % \begin{center}
    %     \begin{doublespace}
    %         DEWAN PENGUJI\\
    %         \begin{tabular}{l l l c}
    %                &            &                      & Tanda Tangan               \\
    %             1. & Ketua      & : \@firstsupervisor  & (........................) \\ \\
    %             2. & Sekretaris & : \@secondsupervisor & (........................) \\ \\
    %             3. & Anggota    & : \@firstexaminer    & (........................) \\ \\
    %             4. & Anggota    & : \@secondexaminer   & (........................) \\
    %         \end{tabular}
    %     \end{doublespace}
    % \end{center}
    % \begin{tabular}{l l}
    %     Ditetapkan di & : \@city     \\
    %     Tanggal       & : \@examdate
    % \end{tabular}
    \pagebreak
}
%-----------------------------------------------------------
% End Define Approval Page
%===========================================================


%===========================================================
% Define Persetujuan Publikasi Karya Ilmiah
%-----------------------------------------------------------
\def\publicationapprovalpage{%
    % \addwatermark
    \addcontentsline{toc}{chapter}{PERSETUJUAN PUBLIKASI KARYA ILMIAH}
    \begin{center}
        \begin{singlespace}
            \MakeUppercase{\normalfont\large\bfseries\expandafter{PERNYATAAN PERSETUJUAN PUBLIKASI TUGAS AKHIR UNTUK KEPENTINGAN AKADEMIS}}\\
            \vspace{1.0cm}
        \end{singlespace}
    \end{center}

    \begin{singlespace}
        \noindent
        Sebagai civitas akademik {\@university}, saya yang bertanda tangan di bawah ini:
        \begin{center}
            \begin{tabular}{ @{} l c l @{} }
                Nama          & : & \@fullnameA \\[-0.2em]
                NIM           & : & \@idnumA    \\[0.8em]

                Nama          & : & \@fullnameB \\[-0.2em]
                NIM           & : & \@idnumB    \\[0.8em]

                Nama          & : & \@fullnameC \\[-0.2em]
                NIM           & : & \@idnumC    \\[1.0em]

                Program Studi & : & \@program   \\[-0.2em]
                Fakultas      & : & \@faculty   \\[-0.2em]
                Jenis Karya   & : & Skripsi
            \end{tabular}
        \end{center}
    \end{singlespace}

    \noindent
    Demi pengembangan ilmu pengetahuan, menyetujui untuk memberikan kepada {\@university} \textbf{Hak Predikator Royalti Noneksklusif} (\textit{Non-exclusive Royalty-Free Right}) atas tugas akhir saya yang berjudul:

    \begin{center}
        {\normalfont\bfseries\expandafter{"\@titleskripsi"}}\\
        % \vspace{1.0cm}
    \end{center}

    \noindent
    beserta perangkat yang ada (jika diperlukan). Terkait dengan hal diatas, maka pihak {\@university} berhak menyimpan, mengalih-media/format-kan, mengola dalam bentuk pangkalan data (\textit{database}), merawat dan mempublikasikan tugas akhir saya selama tetap mencantumkan nama saya sebagai penulis/pencipta dan sebagai pemilik Hak Cipta.

    \noindent
    Demikian surat pernyataan ini saya buat dengan sebenarnya.

    \vspace{0.5cm}
    \begin{center}
        \begin{tabular}{ccc}
            % --- Name A ---
            \begin{minipage}{0.3\textwidth}
                \centering
                \vspace{3cm}
                (\@fullnameA)\\
            \end{minipage}
            &
            % --- Name B ---
            \begin{minipage}{0.3\textwidth}
                \centering
                \vspace{3cm}
                (\@fullnameB)\\
            \end{minipage}
            &
            % --- Name C with location/date ---
            \begin{minipage}{0.3\textwidth}
                \centering
                Dibuat di \@city\\
                pada \@examdate\\[1.5cm]
                (\@fullnameC)\\
            \end{minipage}
        \end{tabular}
    \end{center}
    \pagebreak
}
%-----------------------------------------------------------
% End Define Persetujuan Publikasi Karya Ilmiah
%===========================================================


%===========================================================
% Redefine chapter and sections
%-----------------------------------------------------------
\renewcommand \thechapter {\@Roman\c@chapter}
\renewcommand \thesection {\@arabic\c@chapter.\@arabic\c@section}
\renewcommand \thesubsection {\@arabic\c@chapter.\@arabic\c@section.\@arabic\c@subsection}
\renewcommand \thesubsubsection {\@arabic\c@chapter.\@arabic\c@section.\@arabic\c@subsection.\@arabic\c@subsubsection}
\renewcommand{\@makechapterhead}[1]{%
    {\parindent \z@ \centering \normalfont
            \ifnum \c@secnumdepth >\m@ne
                \large\bfseries \@chapapp\space \thechapter
                \par\nobreak
                \vskip 0\p@
            \fi
            \interlinepenalty\@M
            \large \bfseries #1\par\nobreak
            \vskip 15\p@
        }
}
\renewcommand{\section}{
    \@startsection {section}{1}{\z@}
    {-3.3ex \@plus -1ex \@minus -.2ex}
    {2.1ex \@plus.2ex}
    {\normalfont\normalsize\bfseries}
}
\renewcommand{\subsection}{
    \@startsection{subsection}{2}{\z@}
    {-3.25ex\@plus -1ex \@minus -.2ex}
    {1.5ex \@plus .2ex}
    {\normalfont\normalsize\bfseries}
}
\renewcommand{\subsubsection}{
    \@startsection{subsubsection}{3}{\z@}
    {-3.25ex\@plus -1ex \@minus -.2ex}
    {1.5ex \@plus .2ex}
    {\normalfont\normalsize\bfseries}
}
\renewcommand{\@makeschapterhead}[1]{%
    {\parindent \z@ \centering \normalfont
            \large\bfseries #1
            \par\nobreak
            \vskip 20\p@}
}
%-----------------------------------------------------------
% End Redefine chapter and sections
%===========================================================


%===========================================================
% Setting Tabble of Content, list of figure, list of table
%-----------------------------------------------------------
% customize Table of contents
\renewcommand{\cftchappresnum}{BAB }
\renewcommand{\cftchapnumwidth}{3.7em}
\renewcommand{\cftchapdotsep}{\cftdotsep}
% table of contents
\renewcommand{\cftbeforetoctitleskip}{-0.25cm}
\renewcommand{\cftaftertoctitleskip}{0.75cm}
\renewcommand\cfttoctitlefont{\hfill\Large\bfseries\MakeUppercase}
\renewcommand\cftaftertoctitle{\hfill\mbox{}}
% list of figures
\renewcommand{\cftbeforeloftitleskip}{-0.25cm}
\renewcommand{\cftafterloftitleskip}{0.75cm}
\renewcommand\cftloftitlefont{\hfill\Large\bfseries\MakeUppercase}
\renewcommand\cftafterloftitle{\hfill\mbox{}}
% list of tables
\renewcommand{\cftbeforelottitleskip}{-0.25cm}
\renewcommand{\cftafterlottitleskip}{0.75cm}
\renewcommand\cftlottitlefont{\hfill\Large\bfseries\MakeUppercase}
\renewcommand\cftafterlottitle{\hfill\mbox{}}
% list of appendix
\renewcommand{\cftbeforeapctitleskip}{-0.25cm}
\renewcommand{\cftafterapctitleskip}{0.75cm}
\renewcommand\cftapctitlefont{\hfill\Large\bfseries\MakeUppercase}
\renewcommand\cftafterapctitle{\hfill\mbox{}}
%-----------------------------------------------------------
% End Setting Tabble of Content, list of figure, list of table
%===========================================================


%===========================================================
% Set Counter for figure, table, and equation
%-----------------------------------------------------------
\counterwithin{figure}{chapter}
\counterwithin{table}{chapter}
\counterwithin{equation}{chapter}
\renewcommand \thefigure {\@arabic\c@chapter.\@arabic\c@figure}
\renewcommand \thetable {\@arabic\c@chapter.\@arabic\c@table}
\renewcommand \theequation {\@arabic\c@chapter.\@arabic\c@equation}
%-----------------------------------------------------------
% End Set Counter for figure, table, and equation
%===========================================================

%===========================================================
% Set Table, Figure Environment
%-----------------------------------------------------------
% new environment for Figure
\newenvironment{afigure}
{\begin{figure}[ht]}
        {\end{figure}}

% new environment for Table
\newenvironment{atable}
{\begin{table}[ht] \renewcommand{\arraystretch}{1.3} \centering \small}
        {\end{table}}
%-----------------------------------------------------------
% End Set Table, Figure Environment
%===========================================================
