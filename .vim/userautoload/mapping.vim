"#####自動で括弧の中に戻る######"
"imap {} {}<Left>
"imap [] []<Left>
"imap () ()<Left>
"imap “” “”<Left>
"imap ” ”<Left>
"imap <> <><Left>
"imap “ “<Left>
"
""#####コロンセミコロン入れ変え
noremap ; :
noremap : ;
map Y y$ "yyと同じように使える

"insert mode での移動
inoremap <C-e> <END>
inoremap <C-a> <HOME>
"inoremap <C-j> <Down>
"inoremap <C-k> <Up>
"inoremap <C-h> <Left>
inoremap <C-l> <Right>
"Ctrl+c をESCに
"inoremap <C-g> <ESC>
"noremap <C-g> <ESC>
"vnoremap <C-g> <ESC>

nnoremap <Esc><Esc> :<C-u>set nohlsearch<Return> 
"ESCキー２度押しでハイライトを消す

"Emacs風に <C-k>で行末まで削除
func! s:kill_line()
    let curcol = col('.')
    if curcol == col('$')
        join!
        call cursor(line('.'), curcol)
    else
        normal! D
    endif
endfunc
inoremap <C-k>  <C-o>:<C-u>call <SID>kill_line()<CR>

