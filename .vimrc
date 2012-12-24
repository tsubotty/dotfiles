"vunlde.vimで管理してるpluginを読み込む
source ~/dotfiles/.vimrc.bundle

"基本設定
source ~/dotfiles/.vimrc.basic
"インデント設定
source ~/dotfiles/.vimrc.indent
"補完
source ~/dotfiles/.vimrc.completion
"Color関連
source ~/dotfiles/.vimrc.colors
"マッピングの設定
source ~/dotfiles/.vimrc.mapping

"filetype plugin on
let tex_flavor = 'latex'
set grepprg=grep\ -nH\ $*
set shellslash
let g:Tex_DefaultTargetFormat = 'pdf' "Macの人はデフォルトでpdfなので必要ない その他のOSの人はデフォルトがdviなので必要
let g:Tex_CompileRule_dvi = 'platex --interaction=nonstopmode $*'
let g:Tex_CompileRule_pdf = 'dvipdfmx $*.dvi'
let g:Tex_FormatDependency_pdf = 'dvi,pdf'
"let g:Tex_DefaultTargetFormat = 'pdf' "標準で.pdfにコンパイルして開いてね
let g:Tex_ViewRule_pdf = 'open -a Preview' "PDFはPreview.appで開いてね
"let g:Tex_CompileRule_pdf = 'pdflatex $*.tex' "pdflatexを使って.texから.pdfに変換してね
inoremap <C-L> <ESC>:w<CR>:!latex_preview %<CR><CR>
