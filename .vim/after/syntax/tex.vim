set t_Co=256
syn cluster texMathMatchGroup	add=texMyColorAlpha
syn cluster texMathZoneGroup	add=texMyColorAlpha
syn match   texMyColorAlpha      "\alpha"
hi texMyColorAlpha   ctermfg=149 ctermbg=black guifg=#b6ff93 guibg=black
