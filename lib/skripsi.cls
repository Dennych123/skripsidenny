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
\LoadClass[a4paper, 12pt, twoside]{report}

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
\renewcommand{\theappendices}{L\arabic{appendices}}
\newcommand{\appendices}[1]{\addcontentsline{apc}{appendices}{#1}}
\newcommand{\newappendix}[1]{%
    \clearpage
    \refstepcounter{appendices}
    
    % Konfigurasi Header/Footer Khusus Lampiran
    \pagestyle{fancy}
    \fancyhf{} 
    
    % Aturan Halaman Selanjutnya: LE (Kiri Genap), RO (Kanan Ganjil)
    \fancyhead[LE,RO]{\thepage} 
    \fancyfoot{}
    
    % Aturan Halaman Pertama Lampiran: Tengah Bawah
    \fancypagestyle{plain}{
        \fancyhf{}
        \fancyfoot[C]{\thepage}
        \renewcommand{\headrulewidth}{0pt}
    }
    \thispagestyle{plain}

    \begin{center}
        \normalfont\large\bfseries LAMPIRAN \theappendices\\[0.2cm]
        \MakeUppercase{#1}
    \end{center}
    \vspace{0.5cm}
    
    % PERBAIKAN DI SINI:
    % Ganti \theappendices menjadi \thepage agar muncul L6, L8, dst.
    \addcontentsline{apc}{appendices}{#1\protect\numberline{}\hfill \thepage}
}
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
\fancyhf{} % Bersihkan semua header dan footer

% AGAR HEADER MENJOLOK KE LUAR (TIDAK MENABRAK TEKS)
% Sesuaikan angka 0.5cm jika ingin nomor lebih ke tepi kertas
\fancyhfoffset[L]{0.7cm} 
\fancyhfoffset[R]{0cm}

% Pengaturan Header untuk halaman selanjutnya (Mirror)
% LE: Left Even (Kiri Genap), RO: Right Odd (Kanan Ganjil)
\fancyhead[LE,RO]{\thepage} 

\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}

% Style untuk halaman AWAL BAB (Otomatis dipanggil oleh \chapter)
\fancypagestyle{plain}{ 
    \fancyhf{} 
    \fancyfoot[C]{\thepage} % Nomor di Tengah Bawah
    \renewcommand{\headrulewidth}{0pt}
}

% Style untuk cover atau halaman kosong
\fancypagestyle{empty}{ 
    \fancyhf{}
}

% Style kustom jika diperlukan header khusus
\fancypagestyle{theheader}{ 
    \fancyhead[LE,RO]{\thepage}
    \fancyhead[RE,LO]{Universitas Bina Nusantara} % Contoh penyesuaian nama kampus
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
\setlength{\topmargin}{-0.5cm}
\setlength{\headheight}{0.5cm}
\setlength{\headsep}{1.5cm}
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
    contents={\includegraphics[width=14cm]{images/LOGO-BINUS-ONLINE.jpg}}
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
\newcommand{\@examdate}{23 November 2025}
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
            \includegraphics[height=4.85cm]{images/LOGO-BINUS-ONLINE.jpg}
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

    \addcontentsline{toc}{chapter}{Halaman Sampul}
    \begin{center}
        \begin{singlespace}
            \MakeUppercase{\normalfont\bfseries Skripsi}
            \vspace{2.0cm}

            \MakeUppercase{\normalfont\bfseries\@titleskripsi}\\
            \par\nobreak
            \vspace{2cm}

            {\normalfont\large{Disusun dan diajukan oleh}}\\
            \vspace{1.5cm}

            \begin{tabular}{lcc}
                \normalfont\bfseries{\@fullnameA} & & \normalfont\bfseries{\@idnumA}\\
                \normalfont\bfseries{\@fullnameB} & & \normalfont\bfseries{\@idnumB}\\
                \normalfont\bfseries{\@fullnameC} & & \normalfont\bfseries{\@idnumC}\\
            \end{tabular}\\[0.5cm]
            \normalfont\bfseries{Kelas/Kelompok: TQCA/Kelompok 1}

            \vfill

            \includegraphics[height=4.85cm]{images/LOGO-BINUS-ONLINE.jpg}
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
    \clearpage
    \setcounter{page}{2}  % Forces this page to be 'ii'

    \begingroup % <--- Memulai Group agar perubahan tidak bocor ke luar
    
    % Konfigurasi Khusus Halaman Judul (Kanan Bawah)
    \pagenumbering{roman}
    \setcounter{page}{2} 
    \thispagestyle{fancy}
    \fancyhf{}
    \fancyfoot[R]{\thepage} 
    \renewcommand{\headrulewidth}{0pt}
    
    \begin{center}
        \addcontentsline{toc}{chapter}{Halaman Judul}
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

            \begin{tabular}{lcc}
                \normalfont\bfseries{\@fullnameA} & & \normalfont\bfseries{\@idnumA}\\
                \normalfont\bfseries{\@fullnameB} & & \normalfont\bfseries{\@idnumB}\\
                \normalfont\bfseries{\@fullnameC} & & \normalfont\bfseries{\@idnumC}\\
            \end{tabular}\\[0.5cm]
            \normalfont\bfseries{Kelas/Kelompok: TQCA/Kelompok 1}
            \vfill

            \includegraphics[height=4.85cm]{images/LOGO-BINUS-ONLINE.jpg}
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
    \endgroup % <--- Mengakhiri Group, settingan kembali ke global (Mirror/Center)
}
%-----------------------------------------------------------
% End Define Title Page
%===========================================================


%===========================================================
% Define Authentication Page
%-----------------------------------------------------------
\def\authenticationpage{
    %\addwatermark
    \addcontentsline{toc}{chapter}{PERNYATAAN KESIAPAN SKRIPSI UNTUK SIDANG SKRIPSI}

    \begin{center}
        \MakeUppercase{\normalfont\large\bfseries Universitas Bina Nusantara}\\
        \noindent\rule{\linewidth}{0.4pt}
        \normalfont\bfseries{Pernyataan Kesiapan Skripsi untuk Sidang Skripsi}
    \end{center}

    \noindent \textbf{Pernyataan Penyusunan Skripsi:} \\
    \textbf{Kami,}

    \begin{center}
        \textbf{\@fullnameA}\\[-2pt]
        \textbf{\@fullnameB}\\[-2pt]
        \textbf{\@fullnameC}
    \end{center}

    \noindent
    dengan ini menyatakan bahwa Skripsi yang berjudul:

    \begin{center}
        \bfseries{\@titleskripsi}\\[-1pt]
        \bfseries{\@titleeng}
    \end{center}

    \noindent
    adalah benar hasil karya kami dan belum pernah diajukan sebagai karya ilmiah pihak lain. \\[-2pt]

    \begin{center}
    \begin{tabular}{ccccc}
        \includegraphics[height=2cm]{images/ttd_denny-removebg-preview.png} & &
        \includegraphics[height=2cm]{images/ttd_frans-removebg-preview.png} & &
        \includegraphics[height=2cm]{images/ttd_gilang-removebg-preview.png} \\
        \textbf{\@fullnameA} & & \textbf{\@fullnameB} & & \textbf{\@fullnameC} \\
        \cline{1-1} \cline{3-3} \cline{5-5}
        \@idnumA & & \@idnumB & & \@idnumC
    \end{tabular}

    \vspace{0.2cm}

    \textbf{Disetujui oleh Pembimbing}\\[-2pt]
    \textbf{Saya setuju Skripsi tersebut layak diajukan untuk Sidang Skripsi}
    \end{center}

    \vspace{0.5cm}

    \begin{center}
    \begin{tabular}{c c c}
        \includegraphics[height=2cm]{images/ttd_pembimbing.png} & &  \\
        \textbf{\@firstsupervisor} & & \@examdate \\
        \cline{1-1} \cline{3-3}
        \@firstsupervisorNIP & &
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
    \clearpage
    \thispagestyle{plain}
    \addcontentsline{toc}{chapter}{Halaman Persetujuan Dosen Pembimbing}
    \begin{center}
        \MakeUppercase{\normalfont\large\bfseries\expandafter{\@titleskripsi}}\\
        \vspace{0.5cm}
        \MakeUppercase{\normalfont\large\bfseries\expandafter{Skripsi}}\\
    \end{center}

    \begin{center}
    \normalfont\large\bfseries Disusun oleh:\\
    \end{center}

    \begin{center}
    \begin{tabular}{ccccc}
        \includegraphics[height=2cm]{images/ttd_denny-removebg-preview.png} & &
        \includegraphics[height=2cm]{images/ttd_frans-removebg-preview.png} & &
        \includegraphics[height=2cm]{images/ttd_gilang-removebg-preview.png} \\
        \textbf{\@fullnameA} & & \textbf{\@fullnameB} & & \textbf{\@fullnameC} \\
        \cline{1-1} \cline{3-3} \cline{5-5}
        \@idnumA & & \@idnumB & & \@idnumC
    \end{tabular}
    \end{center}
    \vspace{0.5cm}

    \begin{center}
    \normalfont\large\bfseries Disetujui oleh :\\
    \normalfont\large\bfseries Pembimbing dan Head of  Study Program\\
    \end{center}


    \begin{table}[h]
        \centering
        \begin{tabular}{c}
            Pembimbing\\[0.5cm]
            \includegraphics[height=2cm]{images/ttd_pembimbing.png}\\
            \textbf{\@firstsupervisor}\\
            \cline{1-1}
            \@firstsupervisorNIP
        \end{tabular}

        \vspace{1cm}
        \begin{tabular}{ >{\centering\arraybackslash}m{6cm} }
            Head of  Study Program       \\[0.5cm]
            \\
            \\
            \\
            \\
            \\
            \textbf{\underline{\@headprogram}} \\
            \@headprogramNIP
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
\def\publicationapprovalpage{
    \clearpage
    \begingroup % <--- Start local group
    \pagestyle{plain} % <--- Forces centered numbering for all pages in this group

    \addcontentsline{toc}{chapter}{Pernyataan Persetujuan Publikasi Karya Ilmiah}
    \begin{center}
        \begin{singlespace}
            \MakeUppercase{\normalfont\large\bfseries\expandafter{PERNYATAAN}}\\
            \vspace{1.0cm}
        \end{singlespace}
    \end{center}

    \begin{singlespace}
        \noindent
        Dengan ini, saya:
        \begin{center}
            \begin{tabular}{@{} l c p{10cm} @{}}
                Nama    & : & \@fullnameA \\
                NIM     & : & \@idnumA    \\
                Judul Skripsi & : & \@titleskripsi \\
            \end{tabular}
        \end{center}
    \end{singlespace}

    \noindent
    Memberikan kepada Universitas Bina Nusantara \textit{hak non-eksklusif} untuk menyimpan, memperbanyak, dan menyebarluaskan Skripsi karya saya, secara keseluruhan atau hanya sebagian atau hanya ringkasannya saja, dalam bentuk format tercetak dan atau elektronik.\\

    \noindent
    Menyatakan bahwa saya, akan mempertahankan \textbf{hak eksklusif} saya, untuk menggunakan seluruh atau sebagian isi skripsi saya, guna pengembangan karya di masa depan, misalnya bentuk artikel, buku, perangkat lunak, ataupun sistem informasi.


    \vspace{0.5cm}
    \begin{center}
        \begin{tabular}{c @{\hspace{2cm}} c}

            \@city, \@examdate & \@city, \@examdate \\[0.8cm]

            \includegraphics[height=2cm]{images/ttd_denny-removebg-preview.png} &
            \includegraphics[height=2cm]{images/ttd_pembimbing.png} \\[0.5cm]

            \textbf{\@fullnameA} &
            \textbf{\@firstsupervisor} \\
            \rule{4cm}{0.4pt} & \rule{5cm}{0.4pt} \\
            \@idnumA & \@firstsupervisorNIP

        \end{tabular}
    \end{center}

    \pagebreak

    \begin{center}
        \begin{singlespace}
            \MakeUppercase{\normalfont\large\bfseries\expandafter{PERNYATAAN}}\\
            \vspace{1.0cm}
        \end{singlespace}
    \end{center}

    \begin{singlespace}
        \noindent
        Dengan ini, saya:
        \begin{center}
            \begin{tabular}{@{} l c p{10cm} @{}}
                Nama    & : & \@fullnameB \\
                NIM     & : & \@idnumB    \\
                Judul Skripsi & : & \@titleskripsi \\
            \end{tabular}
        \end{center}
    \end{singlespace}

    \noindent
    Memberikan kepada Universitas Bina Nusantara \textit{hak non-eksklusif} untuk menyimpan, memperbanyak, dan menyebarluaskan Skripsi karya saya, secara keseluruhan atau hanya sebagian atau hanya ringkasannya saja, dalam bentuk format tercetak dan atau elektronik.\\

    \noindent
    Menyatakan bahwa saya, akan mempertahankan \textbf{hak eksklusif} saya, untuk menggunakan seluruh atau sebagian isi skripsi saya, guna pengembangan karya di masa depan, misalnya bentuk artikel, buku, perangkat lunak, ataupun sistem informasi.


    \vspace{0.5cm}
    \begin{center}
        \begin{tabular}{c @{\hspace{2cm}} c}

            \@city, \@examdate & \@city, \@examdate \\[0.8cm]

            \includegraphics[height=2cm]{images/ttd_frans-removebg-preview.png} &
            \includegraphics[height=2cm]{images/ttd_pembimbing.png} \\[0.5cm]

            \textbf{\@fullnameB} &
            \textbf{\@firstsupervisor} \\
            \rule{4cm}{0.4pt} & \rule{5cm}{0.4pt} \\
            \@idnumB & \@firstsupervisorNIP

        \end{tabular}
    \end{center}
    \pagebreak

    \begin{center}
        \begin{singlespace}
            \MakeUppercase{\normalfont\large\bfseries\expandafter{PERNYATAAN}}\\
            \vspace{1.0cm}
        \end{singlespace}
    \end{center}

    \begin{singlespace}
        \noindent
        Dengan ini, saya:
        \begin{center}
            \begin{tabular}{@{} l c p{10cm} @{}}
                Nama    & : & \@fullnameC \\
                NIM     & : & \@idnumC    \\
                Judul Skripsi & : & \@titleskripsi \\
            \end{tabular}
        \end{center}
    \end{singlespace}

    \noindent
    Memberikan kepada Universitas Bina Nusantara \textit{hak non-eksklusif} untuk menyimpan, memperbanyak, dan menyebarluaskan Skripsi karya saya, secara keseluruhan atau hanya sebagian atau hanya ringkasannya saja, dalam bentuk format tercetak dan atau elektronik.\\

    \noindent
    Menyatakan bahwa saya, akan mempertahankan \textbf{hak eksklusif} saya, untuk menggunakan seluruh atau sebagian isi skripsi saya, guna pengembangan karya di masa depan, misalnya bentuk artikel, buku, perangkat lunak, ataupun sistem informasi.


    \vspace{0.5cm}
    \begin{center}
        \begin{tabular}{c @{\hspace{2cm}} c}

            \@city, \@examdate & \@city, \@examdate \\[0.8cm]

            \includegraphics[height=2cm]{images/ttd_gilang-removebg-preview.png} &
            \includegraphics[height=2cm]{images/ttd_pembimbing.png} \\[0.5cm]

            \textbf{\@fullnameC} &
            \textbf{\@firstsupervisor} \\
            \rule{4cm}{0.4pt} & \rule{5cm}{0.4pt} \\
            \@idnumC & \@firstsupervisorNIP

        \end{tabular}
    \end{center}
    \pagebreak

    \begin{center}
        \begin{singlespace}
            \MakeUppercase{\normalfont\large\bfseries\expandafter{SURAT PERNYATAAN}}\\
            \vspace{1.0cm}
        \end{singlespace}
    \end{center}

    \noindent
    Kami, yang bertandatangan di bawah ini:

    \noindent
    \small
    \resizebox{0.9\textwidth}{!}{%
    \begin{tabular}{p{0.2cm} p{4cm} p{0.1cm} p{9cm}}
        1.  & NIM & : & \@idnumA \\
            & Nama & : & \@fullnameA \\
            & Program -- Program Studi & : & Binus Online Learning -- Computer Science Study Program \\[0.2cm]

        2.  & NIM & : & \@idnumB \\
            & Nama & : & \@fullnameB \\
            & Program -- Program Studi & : & Binus Online Learning -- Computer Science Study Program \\[0.2cm]

        3.  & NIM & : & \@idnumC \\
            & Nama & : & \@fullnameC \\
            & Program -- Program Studi & : & Binus Online Learning -- Computer Science Study Program \\[0.4cm]
    \end{tabular}%
    }


    \noindent
    Dengan ini menyatakan bahwa karya yang berjudul:

    \small
    \begin{center}
        \bfseries{\@titleskripsi}\\
    \end{center}

    \noindent
    Di bawah bimbingan dosen:\\
    \begin{tabular}{p{0.2cm} p{1cm} p{0.1cm} p{9cm}}
        1.  & \@firstsupervisorNIP & - & \@firstsupervisor \\[0.4cm]
    \end{tabular}

    \noindent
    Telah dijadikan sebagai Tugas Akhir/Skripsi pada Program Studi di Universitas Bina Nusantara dan telah diuji pada semester Ganjil tahun 2025/2026, disetujui untuk dielaborasi dan diajukan bersama-sama sebagai publikasi internasional, dengan ketentuan:\\
    Denny Chrisnanda: sebagai Penulis Pertama;\\
    Frans Sebastian: sebagai Penulis Kedua;\\
    Gilang Hansagita: sebagai Penulis Ketiga;\\
    Dr. Sarwo, S.Kom, M.Kom.: sebagai Penulis Keempat;\\
    Para penulis di atas sekaligus merupakan pemegang hak cipta atas publikasi internasional tersebut.\\
    Pernyataan ini dibuat dengan penuh kesadaran dan tanpa paksaan dari pihak manapun.\\


    \noindent
    \begin{center}
    \resizebox{0.9\textwidth}{!}{%
    \begin{tabular}{c c c c}
        \textbf{\@city, \@examdate} & & & \\[0.2cm]

        Penulis Pertama, &
        Penulis Kedua, &
        Penulis Ketiga, &
        Penulis Keempat, \\

        \includegraphics[height=2cm]{images/ttd_denny-removebg-preview.png} &
        \includegraphics[height=2cm]{images/ttd_frans-removebg-preview.png} &
        \includegraphics[height=2cm]{images/ttd_gilang-removebg-preview.png} &
        \includegraphics[height=2cm]{images/ttd_pembimbing.png} \\[0.3cm]

        \underline{\textbf{\@fullnameA}} &
        \underline{\textbf{\@fullnameB}} &
        \underline{\textbf{\@fullnameC}} &
        \underline{\textbf{\@firstsupervisor}} \\
    \end{tabular}%
    }
    \end{center}
    \pagebreak
    \clearpage % <--- Finish the last page before ending group
    \endgroup % <--- End local group (Automatically reverts to fancy/Right-align)
}
%-----------------------------------------------------------
% End Define Persetujuan Publikasi Karya Ilmiah
%===========================================================

%===========================================================
% Define abstract page
%-----------------------------------------------------------
\def\abstractpage{
    \clearpage
    \begingroup % <--- Start local group
    \pagestyle{plain} % <--- Forces centered numbering for all pages in this group

    \addcontentsline{toc}{chapter}{ABSTRAK}

    \begin{center}
        \MakeUppercase{\normalfont\large\bfseries\expandafter{Universitas Bina Nusantara}}\\
        \noindent\rule{\linewidth}{0.4pt}
        \normalfont{\@program}\\
        \normalfont{\@faculty}\\
        \normalfont{Skripsi Sarjana Komputer}\\
        \normalfont{Semester Ganjil 2025/2026}\\
        \vspace{0.5cm}

        \MakeUppercase{\normalfont\bfseries\@titleskripsi}\\
        \vspace{0.5cm}

        \begin{tabular}{lcc}
            \normalfont\bfseries{\@fullnameA} & & \normalfont\bfseries{\@idnumA}\\
            \normalfont\bfseries{\@fullnameB} & & \normalfont\bfseries{\@idnumB}\\
            \normalfont\bfseries{\@fullnameC} & & \normalfont\bfseries{\@idnumC}\\
        \end{tabular}\\[0.5cm]
        \normalfont\bfseries{Kelas/Kelompok: TQCA/Kelompok 1}
        \vspace{0.8cm}

        \normalfont\bfseries{Abstrak}
    \end{center}

    \normalfont{\input{include/halaman-abstrak.tex}}
    \clearpage % <--- Finish the last page before ending group
    \endgroup % <--- End local group (Automatically reverts to fancy/Right-align)
}

%-----------------------------------------------------------
% End Define abstract page
%===========================================================


%===========================================================
% Redefine chapter and sections
%-----------------------------------------------------------
\renewcommand \thechapter{\arabic{chapter}}
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
% increase spacing between chapter entries in TOC
\setlength{\cftbeforechapskip}{0pt}
% table of contents
\renewcommand{\cftbeforetoctitleskip}{-0.25cm}
\renewcommand{\cftaftertoctitleskip}{0.75cm}
\renewcommand\cfttoctitlefont{\hfill\normalsize\bfseries\MakeUppercase}
\renewcommand\cftaftertoctitle{\hfill\mbox{}}
% list of figures
\renewcommand{\cftbeforeloftitleskip}{-0.25cm}
\renewcommand{\cftafterloftitleskip}{0.75cm}
\renewcommand\cftloftitlefont{\hfill\normalsize\bfseries\MakeUppercase}
\renewcommand\cftafterloftitle{\hfill\mbox{}}
% list of tables
\renewcommand{\cftbeforelottitleskip}{-0.25cm}
\renewcommand{\cftafterlottitleskip}{0.75cm}
\renewcommand\cftlottitlefont{\hfill\normalsize\bfseries\MakeUppercase}
\renewcommand\cftafterlottitle{\hfill\mbox{}}
% list of appendix
\renewcommand{\cftbeforeapctitleskip}{-0.25cm}
\renewcommand{\cftafterapctitleskip}{0.75cm}
\renewcommand\cftapctitlefont{\hfill\normalsize\bfseries\MakeUppercase}
\renewcommand\cftafterapctitle{\hfill\mbox{}}
\cftpagenumbersoff{appendices}
% Ensure TOC entries are not bold
\renewcommand{\cftchapfont}{\normalfont}
\renewcommand{\cftsecfont}{\normalfont}
\renewcommand{\cftsubsecfont}{\normalfont}
\renewcommand{\cftsubsubsecfont}{\normalfont}
\renewcommand{\cftchappagefont}{\normalfont}
\renewcommand{\cftsecpagefont}{\normalfont}
\renewcommand{\cftsubsecpagefont}{\normalfont}
\renewcommand{\cftsubsubsecpagefont}{\normalfont}
% remove dotted leaders in Table of Contents: use \hfill to preserve spacing
\renewcommand{\cftchapleader}{\hfill}
\renewcommand{\cftsecleader}{\hfill}
\renewcommand{\cftsubsecleader}{\hfill}
\renewcommand{\cftsubsubsecleader}{\hfill}
% remove dotted leaders in Lists (Figures, Tables, Appendices)
\renewcommand{\cftfigleader}{\hfill}
\renewcommand{\cfttableader}{\hfill}
\renewcommand{\cftappendicesleader}{\hfill}
% configure indentation in section in TOC
\setlength{\cftsecindent}{0pt}
\setlength{\cftsubsecindent}{1.5em}
\setlength{\cftsubsubsecindent}{3.0em}


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
