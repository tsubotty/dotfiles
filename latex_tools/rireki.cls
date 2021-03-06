%% rireki.cls
%% $Date: 2002/02/03 09:50:06 $
%%
%% Copyright (C) 2002 MIYAMOTO Yusuke
%% All rights reserved.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{rireki}
\ProcessOptions
\LoadClass[twoside,11pt]{jarticle}
%% $BMQ;f%5%$%:(B (B5)
\setlength{\paperwidth}{181mm}
\setlength{\paperheight}{257mm}
\@settopoint{\paperwidth}
\@settopoint{\paperheight}

%% $BMQ;f:8>e$r86E@$H$9$k(B
\setlength{\voffset}{-1in}
\setlength{\hoffset}{-1in}

%% $BK5Cm$r:o=|(B
\setlength{\marginparsep}{0pt}
\setlength{\marginparwidth}{0pt}
\setlength{\marginparpush}{0pt}

%% $B:8%^!<%8%s(B
\setlength{\oddsidemargin}{20mm}
\setlength{\evensidemargin}{10.5mm}
\@settopoint{\oddsidemargin}
\@settopoint{\evensidemargin}

%% $B>e%^!<%8%s(B
\setlength{\headheight}{\z@}
\setlength{\headsep}{\z@}
\setlength{\topsep}{\z@}
\setlength{\topmargin}{16mm}
\@settopoint{\topmargin}

%% $B5SCmNN0h$r:o=|(B
\setlength{\footnotesep}{\z@}
\setlength{\footskip}{\z@}

%% $B%F%-%9%HNN0h(B
\setlength{\textwidth}{\paperwidth}
\addtolength{\textwidth}{-\oddsidemargin}
\addtolength{\textwidth}{-\evensidemargin}
\@settopoint{\textwidth}
\setlength{\textheight}{\paperheight}
\addtolength{\textheight}{-2\topmargin}
\@settopoint{\textheight}

%% picture $BIA2h%3%^%s%I(B
%% $B:BI8$N0\F0(B
\newcommand{\@x}{0}
\newcommand{\@y}{0}
\newcounter{pic@x}
\newcounter{pic@y}
\def\MoveTo(#1,#2){\gdef\@x{#1}\gdef\@y{#2}}
\def\RMoveTo(#1,#2){ %
  \@tempcnta=\number\@x
  \advance\@tempcnta by #1
  \xdef\@x{\the\@tempcnta}
  \@tempcnta=\number\@y
  \advance\@tempcnta by #2
  \xdef\@y{\the\@tempcnta}
}

%% $B:8>e$r86E@$H$9$k:BI87O$K$*$1$kAjBP;2>H$G(B \put
\def\Put(#1,#2){%
  \setcounter{pic@x}{\@x}
  \setcounter{pic@y}{\pic@height}
  \addtocounter{pic@x}{#1}
  \addtocounter{pic@y}{-\@y}
  \addtocounter{pic@y}{-#2}
  \put(\thepic@x, \thepic@y)%
}

\def\MultiPut(#1,#2)(#3,#4){
  \setcounter{pic@x}{\@x}
  \setcounter{pic@y}{\pic@height}
  \addtocounter{pic@x}{#1}
  \addtocounter{pic@y}{-\@y}
  \addtocounter{pic@y}{-#2}
  \multiput(\thepic@x,\thepic@y)(#3,-#4)%
}

%% $BMzNr=q$r:n@.$9$k%3%^%s%I!%(B\end{document} $B$G<B9T$5$l$k!%(B
\newcommand{\@makerireki}{%
\setlength\unitlength{1mm}
\@tempcnta=\number\textwidth
\divide\@tempcnta by \number\unitlength
\edef\pic@width{\the\@tempcnta}
\@tempcnta=\number\textheight
\divide\@tempcnta by \number\unitlength
\edef\pic@height{\the\@tempcnta}

%% picture $B4D6-(B
\noindent
\begin{picture}(\pic@width,\pic@height)

%% $B%?%$%H%k!$<L??0LCV(B
\MoveTo(0,0)
\Put(0,0){\Large\bfseries\kanjiskip=5mm\historyname}
\Put(100,2){\makebox(0,5)[rc]{\scriptsize\@date $B8=:_(B}}
\Put(105,31){\dashbox{0.5}(28,38)[c]{\scriptsize %
  \shortstack[c]{$B<L??$rE=$k0LCV(B\\$B=D(B 36 $B!A(B 40 mm\\$B2#(B 24 $B!A(B 30 mm}}}
\@tempcnta=\number\paperheight
\divide\@tempcnta by 2
\advance\@tempcnta by -\number\topmargin
\divide\@tempcnta by \unitlength
\Put(-16,\the\@tempcnta){$\triangleleft$}

%% $B;aL>!$8==;=j$J$I$N%W%m%U%!%$%k(B
\MoveTo(0,0)
\thicklines
\Put(0,2){\line(1,0){100}}
\Put(0,2){\line(0,-1){76}}
\Put(0,78){\line(1,0){151}}
\Put(100,2){\line(0,-1){32}}
\Put(100,34){\line(1,0){51}}
\Put(151,34){\line(0,-1){44}}

\thinlines
\Put(0,7){\dashbox{.5}(100,5)[l]{\scriptsize\hspace{1mm}\kananame}}
\Put(0,24){\line(1,0){100}}
\Put(1,8){\makebox(0,0)[tl]{\scriptsize\namename}}
\Put(1,24){\makebox(42,16)[r]{\LARGE\kanjiskip=3mm\@surname\hspace{12pt}}}
\Put(1,7){\makebox(42,5)[r]{\scriptsize\kana@surname\hspace{12pt}}}
\Put(42,24){\makebox(42,16)[l]{\LARGE\kanjiskip=3mm\hspace{12pt}\@forename}}
\Put(42,7){\makebox(42,5)[l]{\scriptsize\hspace{12pt}\kana@forename}}
\Put(87,2){\line(0,-1){22}}
\Put(88,24){\makebox(12,16)[tl]{\tiny $B0u(B}}
\Put(88,7){\makebox(12,5)[c]{\scriptsize\sexname\hskip 1ex\@sex}}

\Put(0,34){\makebox(100,10)[l]{\scriptsize\hspace{1ex}\birthdayname}}
\Put(0,34){\makebox(100,10)[r]{\@birthday\hskip 2em
    ($BK~(B\hbox to 2em{\hfil\@age\hfil}$B:P(B)\hspace{1em}}}
\Put(0,34){\line(1,0){100}}

\Put(0,39){\dashbox{.5}(151,5)[l]{\hspace{1mm}\scriptsize\kananame}}
\Put(20,38){\makebox(0,0)[lb]{\scriptsize\kana@address}}
\Put(1,40){\makebox(0,0)[tl]{\scriptsize\addressname}}
\Put(12,40){\makebox(0,0)[lt]{\small $B")(B \@postalcode}}
\Put(20,48){\makebox(148,5)[lb]{\@address}}
\Put(0,50){\line(1,0){151}}
\Put(1,51){\makebox(0,0)[tl]{\scriptsize\contactname}}
\Put(5,56){\makebox(151,6)[l]{\small\@phone\@email}}
\Put(0,56){\line(1,0){151}}
\Put(0,61){\dashbox{.5}(151,5)[l]{\hspace{1mm}\scriptsize\kananame}}
\Put(20,61){\makebox(0,5)[l]{\scriptsize\kana@anotheraddress}}
\Put(1,62){\makebox(0,0)[tl]{\scriptsize\anotheraddressname}}
\Put(12,62){\makebox(0,0)[lt]{\small $B")(B \@anotherpostalcode}}
\Put(20,70){\makebox(151,8)[lb]{\@anotheraddress}}
\Put(0,72){\line(1,0){151}}
\Put(1,78){\makebox(0,5)[tl]{\scriptsize\contactname}}
\Put(5,78){\makebox(151,6)[l]{\small\@anotherphone}}

%% $B3XNr!&?&Nr(B
\MoveTo(0,79)
\thicklines
\Put(0,0){\line(1,0){151}}
\Put(151,0){\line(0,-1){145}}
\Put(0,0){\line(0,-1){145}}
\Put(0,145){\line(1,0){151}}

\thinlines
\Put(0,145){\dashbox{.5}(17,145){}}
\Put(26,0){\line(0,-1){145}}
\Put(0,5){\line(1,0){151}}
\Put(0,5){\makebox(17,5)[c]{\scriptsize $BG/(B}}
\Put(17,5){\makebox(9,5)[c]{\scriptsize $B7n(B}}
\Put(26,5){\makebox(125,5)[c]{\scriptsize\backgroundname}}

\MultiPut(0,5)(0,7){20}{\line(1,0){151}}
\@starttoc{lob} % list of background
\@starttoc{loc} % list of career

\MoveTo(0,0)
\@firstpagehook
\end{picture}
\clearpage

%% $B1&%Z!<%8(B
\begin{picture}(\pic@width, \pic@height)

\MoveTo(0,0)
\thicklines
\Put(0,0){\line(1,0){151}}
\Put(0,0){\line(0,-1){224}}
\Put(151,0){\line(0,-1){224}}
\Put(0,224){\line(1,0){151}}

\Put(0,75){\line(1,0){151}}
\Put(0,164){\line(1,0){151}}
\Put(0,194){\line(1,0){151}}
\Put(0,203){\line(1,0){151}}

%% $BLH5v!&;q3J(B
\MoveTo(0,0)
\thinlines
\Put(0,75){\dashbox{.5}(17,75){}}
\Put(26,0){\line(0,-1){75}}
\Put(0,5){\makebox(17,5)[c]{\scriptsize $BG/(B}}
\Put(17,5){\makebox(9,5)[c]{\scriptsize $B7n(B}}
\Put(26,5){\makebox(125,5)[c]{\scriptsize\licensename}}
\Put(0,5){\line(1,0){151}}

\MultiPut(0,5)(0,7){10}{\line(1,0){151}}
\@starttoc{lol} % list of licenses

%% $BF@0U2JL\(B
\Put(75,75){\line(0,-1){56}}
\Put(1,103){\makebox(75,27)[lt]{\scriptsize\subjectname}}
\Put(1,103){\makebox(75,24){\@subject}}
%% $B<+8JJ,@O(B
\Put(76,103){\makebox(75,27)[lt]{\scriptsize\selfintroname}}
\Put(76,103){\makebox(75,24){\@selfintro}}
\Put(0,103){\line(1,0){151}}
%% $B<qL#(B
\Put(1,131){\makebox(75,27)[lt]{\scriptsize\hobbyname}}
\Put(1,131){\makebox(75,24){\@hobby}}
%% $BFC5;(B
\Put(76,131){\makebox(75,27)[lt]{\scriptsize\profname}}
\Put(76,131){\makebox(75,24){\@prof}}
\Put(0,131){\line(1,0){151}}
%% $BF05!(B
\Put(1,162){\makebox(150,30)[lt]{\scriptsize\motivename}}
\Put(1,162){\makebox(150,26){\@motive}}
%% $BK\?M4uK>(B
\Put(1,192){\makebox(150,27)[tl]{\scriptsize\wishname}}
\Put(1,192){\makebox(150,24){\@wish}}
%% $BDL6P;~4V(B
\Put(1,203){\makebox(47,8)[lt]{\scriptsize\commutename}}
\Put(1,203){\makebox(45,8)[r]{\@commute}}
\Put(48,194){\line(0,-1){9}}
%% $BI^M\2HB2(B
\Put(49,203){\makebox(34,8)[lt]{\scriptsize\dependentsname}}
\Put(49,203){\makebox(30,8)[r]{\@dependents}}
\Put(84,194){\line(0,-1){9}}
%% $BG[6v<T(B
\Put(85,203){\makebox(33,8)[lt]{\scriptsize\matename}}
\Put(85,203){\makebox(29,8)[r]{\@mate}}
\Put(116,194){\line(0,-1){9}}
%% $BG[6v<T$NI^M\5AL3(B
\Put(117,203){\makebox(34,8)[lt]{\scriptsize\matedependencename}}
\Put(117,203){\makebox(30,8)[r]{\@matedependence}}
%% $BJ]8n<T(B
\Put(0,212){\dashbox{.5}(151,9){}}
\Put(1,212){\makebox(124,8)[lt]{\scriptsize\guardianname}}
\Put(1,212){\makebox(124,5)[l]{\scriptsize\kananame}}
\Put(35,212){\line(0,-1){12}}
\Put(1,224){\makebox(34,11)[lt]{\scriptsize\namename}}
\Put(16,212){\makebox(0,5)[l]{\scriptsize\kana@guardian}}
\Put(1,224){\makebox(34,12)[c]{\@guardian}}
\Put(36,224){\makebox(89,11)[lt]{\small $B")(B \@guardianpostalcode}}
\Put(48,212){\makebox(77,5)[l]{\scriptsize\kana@guardianaddress}}
\Put(36,224){\makebox(89,8)[c]{\@guardianaddress}}
\Put(150,224){\makebox(0,11)[rt]{\scriptsize\@guardianphone}}

\MoveTo(0,0)
\@secondpagehook
\end{picture}
}

%% $B%U%C%/%^%/%mDj5A%3%^%s%I(B
\let\@firstpagehook\@empty
\let\@secondpagehook\@empty
\newcommand{\AtFirstPage}{\g@addto@macro\@firstpagehook}
\newcommand{\AtSecondPage}{\g@addto@macro\@secondpagehook}

%%$B:F@8;f(B
\newcommand{\RecycledPaper}{%
  \AtSecondPage{\Put(150,225){\makebox(0,0)[rt]{\scriptsize 
    $B$3$NMQ;f$K$O:F@8;f$rMxMQ$7$F$$$^$9!#(B}}}
}


%% $BMzNr=q(B $B:n@.F|(B
\renewcommand{\@date}{\today}
\renewcommand{\date}[1]{\edef\@date{#1}}

%% $B@+(B
\newcommand\@surname\@empty
\newcommand\kana@surname\@empty
\newcommand{\SurName}{\@testopt\surn@me{}}
\def\surn@me[#1]#2{%
  \def\@surname{#2}
  \def\kana@surname{#1}
}

%% $BL>(B
\newcommand\@forename\@empty
\newcommand\kana@forename\@empty
\newcommand{\ForeName}{\@testopt{\foren@me}{}}
\def\foren@me[#1]#2{%
  \def\@forename{#2}
  \def\kana@forename{#1}
}

%% $B8==;=j(B
\newcommand\@address\@empty
\newcommand\kana@address\@empty
\newcommand{\Address}{\@testopt{\@ddress}{}}
\def\@ddress[#1]#2{%
  \def\@address{#2}
  \def\kana@address{#1}
}

%% $BM9JXHV9f(B
\newcommand\@postalcode\@empty
\newcommand{\PostalCode}[1]{\def\@postalcode{\texttt{#1}}}

%% $BEEOCHV9f(B
\newcommand\@phone\@empty
\newcommand{\Phone}[1]{\def\@phone{\hskip 24pt $BEEOC(B: \texttt{#1}}}

%% $BEE;R%a!<%k(B
\newcommand\@email\@empty
\newcommand{\Email}[1]{\def\@email{\hskip 24pt $B%a!<%k(B: \texttt{#1}}}

%% $BO"Mm@h=;=j(B
\newcommand\@anotheraddress\@empty
\newcommand\kana@anotheraddress\@empty
\newcommand{\AnotherAddress}{\@testopt{\@nother@ddress}{}}
\def\@nother@ddress[#1]#2{%
  \def\@anotheraddress{#2}
  \def\kana@anotheraddress{#1}
}

%% $BO"Mm@hM9JXHV9f(B
\newcommand\@anotherpostalcode\@empty
\newcommand{\AnotherPostalCode}[1]{\def\@anotherpostalcode{\texttt{#1}}}

%% $BO"Mm@hEEOCHV9f(B
\newcommand\@anotherphone\@empty
\newcommand{\AnotherPhone}[1]{%
  \def\@anotherphone{\hskip 24pt $BEEOC(B: \texttt{#1}}}

%% $B@8G/7nF|(B
\newcommand{\Nengou}{\protect\@nengou}
\newcommand{\@nengou}[1]{%
  \@tempcnta=#1
  \ifnum\@tempcnta<1989
    \advance\@tempcnta by -1925
    $B><OB(B
  \else
    \advance\@tempcnta by -1988
    $BJ?@.(B
  \fi
  \ifnum\@tempcnta=1 $B85(B \else \the\@tempcnta \fi
}
\let\$BG/9f(B=\Nengou\relax
\newcounter{birth@year}
\newcounter{birth@month}
\newcounter{birth@day}
\newcounter{@ge}
\newcommand{\@birthday}\@empty
\newcommand{\Birthday}[3]{
  \setcounter{birth@year}{#1}
  \setcounter{birth@month}{#2}
  \setcounter{birth@day}{#3}
  \setcounter{@ge}{\year}
  \addtocounter{@ge}{-\thebirth@year}
  \ifnum\month=\thebirth@month
    \ifnum\day<\thebirth@day
      \addtocounter{@ge}{-1}
    \fi
  \else\ifnum\month<\thebirth@month
    \addtocounter{@ge}{-1}
  \fi\fi
  \def\@birthday{\$BG/9f(B\thebirth@year $BG/(B \thebirth@month $B7n(B \thebirth@day $BF|@8(B}
}

%% $BG/Np(B
\newcommand{\@age}{\expandafter\the@ge}
\newcommand{\Age}[1]{\def\@age{#1}}

%% $B@-JL(B
\newcommand{\@sex}{??}
\newcommand{\Sex}[1]{\def\@sex{#1}}

%% $BF@0U2JL\(B
\newcommand{\@subject}\@empty
\newcommand{\Subject}[1]{\long\def\@subject{\parbox{72mm}{#1}}}

%% $B<+8JJ,@O(B
\newcommand{\@selfintro}\@empty
\newcommand{\SelfIntro}[1]{\long\def\@selfintro{\parbox{72mm}{#1}}}

%% $B<qL#(B
\newcommand{\@hobby}\@empty
\newcommand{\Hobby}[1]{\long\def\@hobby{\parbox{72mm}{#1}}}

%% $BFC5;(B
\newcommand{\@prof}\@empty
\newcommand{\Prof}[1]{\long\def\@prof{\parbox{72mm}{#1}}}

%% $B;VK>F05!(B
\newcommand{\@motive}\@empty
\newcommand{\Motive}[1]{\long\def\@motive{\parbox{145mm}{#1}}}

%% $BK\?M4uK>(B
\newcommand{\@wish}\@empty
\newcommand{\Wish}[1]{\long\def\@wish{\parbox{145mm}{#1}}}

%% $BDL6P;~4V(B
\newcommand{\@commute}\@empty
\newcommand{\Commute}[1]{\def\@commute{#1}}

%% $BI^M\2HB2(B
\newcommand{\@dependents}\@empty
\newcommand{\Dependents}[1]{\def\@dependents{#1}}

%% $BG[6v<T(B
\newcommand{\@mate}\@empty
\newcommand{\Mate}[1]{\def\@mate{#1}}

%% $BG[6v<T$NI^M\5AL3(B
\newcommand{\@matedependence}\@empty
\newcommand{\MateDependence}[1]{\def\@matedependence{#1}}

%% $BJ]8n<T(B
\newcommand\@guardian\@empty
\newcommand\kana@guardian\@empty
\newcommand{\Guardian}{\@testopt{\gu@rdi@n}{}}
\def\gu@rdi@n[#1]#2{%
  \def\@guardian{#2}
  \def\kana@guardian{#1}
}

%% $BJ]8n<TM9JXHV9f(B
\newcommand{\@guardianpostalcode}\@empty
\newcommand{\GuardianPostalCode}[1]{\def\@guardianpostalcode{\texttt{#1}}}

%% $BJ]8n<T=;=j(B
\newcommand\@guardianaddress\@empty
\newcommand\kana@guardianaddress\@empty
\newcommand{\GuardianAddress}{\@testopt{\gu@rdi@n@ddress}{}}
\def\gu@rdi@n@ddress[#1]#2{%
  \def\@guardianaddress{#2}
  \def\kana@guardianaddress{#1}
}

%% $BJ]8n<TEEOCHV9f(B
\newcommand{\@guardianphone}\@empty
\newcommand{\GuardianPhone}[1]{%
  \def\@guardianphone{$B!JEEOC(B: \texttt{#1}$B!K(B}}

%% $B%j%9%H=PNOMQ%3%^%s%I(B
%% #1: y $B:BI8(B
%% #2: $BG/(B
%% #3: $B7n(B
%% #4: $BFbMF(B
\newcommand{\PutListEntry}[4]{
  \Put(0,#1){\makebox(17,7)[c]{#2}}
  \Put(17,#1){\makebox(9,7)[c]{#3}}
  \Put(28,#1){\makebox(121,7)[l]{#4}}
}

%% $B3XNr%j%9%HDI2C(B
\newcounter{@b}\setcounter{@b}{5}
\newcommand{\Background}[3]{%
  \addtocounter{@b}{7}
  \addtocontents{lob}{\protect\PutListEntry{\the@b}{#1}{#2}{#3}}
}
\newif{\if@bglastnewline}
\@bglastnewlinefalse
\newcommand{\BackgroundLastNewLine}{\@bglastnewlinetrue}

%% $B?&Nr%j%9%HDI2C(B
\newcounter{@c}\setcounter{@c}{0}
\newif\if@career
\@careertrue
\newcommand{\Career}[3]{%
  \@careerfalse
  \addtocounter{@c}{7}
  \addtocontents{loc}{\protect\PutListEntry{\the@c}{#1}{#2}{#3}}
}

%% $B;q3J!&LH5v%j%9%HDI2C(B
\newcounter{@l}\setcounter{@l}{5}
\newcommand{\License}[3]{%
  \addtocounter{@l}{7}
  \addtocontents{lol}{\protect\PutListEntry{\the@l}{#1}{#2}{#3}}
}

%% $B%3%^%s%I$NJLL>(B
\let\$B:F@8;f(B=\RecycledPaper\relax
\let\$BF|IU(B=\date\relax
\let\$B@+(B=\SurName\relax
\let\$BL>(B=\ForeName\relax
\let\$B@-JL(B=\Sex\relax
\let\$BG/Na(B=\Age\relax
\let\$BG/Np(B=\Age\relax
\let\$B@8G/7nF|(B=\Birthday\relax
\let\$BCB@8F|(B=\Birthday\relax
\let\$BM9JXHV9f(B\PostalCode\relax
\let\$B8==;=j(B=\Address\relax
\let\$BEEOCHV9f(B=\Phone\relax
\def\$B%a!<%k(B{\Email}
\def\$BEE;R%a!<%k(B{\Email}
\let\$BO"Mm@hM9JXHV9f(B\AnotherPostalCode\relax
\let\$BO"Mm@h=;=j(B=\AnotherAddress\relax
\let\$BO"Mm@hEEOCHV9f(B=\AnotherPhone\relax
\let\$B3XNr(B=\Background\relax
\let\$B?&Nr(B=\Career\relax
\let\$B;q3J(B=\License\relax
\let\$BLH5v(B=\License\relax
\let\Licence=\License\relax
\let\$BF@0U2JL\(B=\Subject\relax
\let\$B<+8JJ,@O(B=\SelfIntro\relax
\let\$B<qL#(B=\Hobby\relax
\let\$BFC5;(B=\Prof\relax
\let\$BF05!(B=\Motive\relax
\let\$B;VK>F05!(B=\Motive\relax
\let\$B4uK>(B=\Wish\relax
\let\$BK\?M4uK>(B=\Wish\relax
\let\$BDL6P;~4V(B=\Commute\relax
\let\$BI^M\2HB2(B=\Dependents\relax
\let\$BG[6v<T(B=\Mate\relax
\let\$BG[6v<TI^M\5AL3(B=\MateDependence\relax
\let\$BJ]8n<T(B=\Guardian\relax
\let\$BJ]8n<TM9JXHV9f(B\GuardianPostalCode\relax
\let\$BJ]8n<T=;=j(B=\GuardianAddress\relax
\let\$BJ]8n<TEEOCHV9f(B=\GuardianPhone\relax
\let\$B3XNr%j%9%H$N:G8e$G2~9T(B=\BackgroundLastNewLine

%% $B9`L\L>(B
\newcommand{\historyname}{$BMzNr=q(B}
\newcommand{\namename}{$B;a(B~~$BL>(B}
\newcommand{\kananame}{$B$U$j$,$J(B}
\newcommand{\addressname}{$B8=(B~$B=;(B~$B=j(B}
\newcommand{\anotheraddressname}{$BO"(B~$BMm(B~$B@h(B}
\newcommand{\contactname}{$BEEOC$J$I(B}
\newcommand{\birthdayname}{$B@8G/7nF|(B}
\newcommand{\sexname}{$B@-JL(B}
\newcommand{\backgroundname}{$B3XNr!&?&Nr(B}
\newcommand{\licensename}{$BLH5v!&;q3J(B}
\newcommand{\subjectname}{$BF@0U$J2JL\!&J,Ln(B}
\newcommand{\selfintroname}{$B<+8JJ,@O!J@-3J!&FCD'!&(BPR $B$J$I!K(B}
\newcommand{\hobbyname}{$B<qL#!&%9%]!<%D!&%5!<%/%k$J$I(B}
\newcommand{\profname}{$BFC5;$J$I(B}
\newcommand{\motivename}{$B;VK>$NF05!(B}
\newcommand{\wishname}{$BK\?M4uK>5-F~Ms!JFC$K5kNA!&?&<o!&6PL3;~4V!&6PL3CO!&(B
  $B$=$NB>$K$D$$$F$N4uK>$J$I$,$"$l$P5-F~!K(B}
\newcommand{\guardianname}{$BJ]8n<T(B ($BK\?M$,L$@.G/$N>l9g$N$_5-F~(B)}
\newcommand{\commutename}{$BDL6P;~4V(B}
\newcommand{\dependentsname}{$BI^M\2HB2?t(B}
\newcommand{\matename}{$BG[6v<T(B}
\newcommand{\matedependencename}{$BG[6v<T$NI^M\5AL3(B}

%% $B%U%C%/%^%/%m$NEPO?(B
\AtBeginDocument{\pagestyle{empty}}
\AtBeginDocument{\Background{}{}{\textbf{\hfil $B3XNr(B}}}
\AtBeginDocument{\Career{}{}{\textbf{\hfil $B?&Nr(B}}\@careertrue}

\AtEndDocument{\if@bglastnewline\Background{}{}{}\fi}
\AtEndDocument{\addtocontents{lob}{\protect\RMoveTo(0,\the@b)}}
\AtEndDocument{\if@career\Career{}{}{$B$J$7(B}\fi}
\AtEndDocument{\Career{}{}{\hfill $B0J>e(B\hspace{2em}}}
\AtEndDocument{\addtocontents{loc}{\protect\RMoveTo(0,-\the@b)}}
\AtEndDocument{\@makerireki}

\endinput
