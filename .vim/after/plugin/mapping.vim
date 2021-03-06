""" AltをMetaキーにする
let c = 'a'
while c <= 'z'
    execute "set <M-" . c . ">=\e" . c
    execute "imap \e" . c . " <M-" . c . ">"
    execute "set <M-S-" . c . ">=\e" . toupper(c)
    execute "imap \e" . toupper(c) . " <M-" . c . ">"
    let c = nr2char(1+char2nr(c))
endw

""" 自動で括弧の中に戻る######"
""inoremap { {}<Left>
""inoremap [ []<Left>
""inoremap ( ()<Left>
""inoremap " ""<Left>
""inoremap ' ''<Left>
""inoremap <> <><Left>

"oで改行した時にインデントの形跡を残す"
noremap o ob<BS>
""inoremap <TAB> <ESC>==i

""" #####コロンセミコロン入れ変え
noremap ; :
noremap : ;
map Y y$ "yyと同じように使える

"insert mode での移動
inoremap <C-e> <END>
inoremap <C-a> <HOME>

"M-sでセーブ
" nnoremap <M-s> :<C-u>write<CR>
" nnoremap <M-q> :<C-u>quit<CR>
nnoremap ,s :<C-u>write<CR>
nnoremap ,q :<C-u>quit<CR>

" Ev/Rvでvimrcの編集と反映
command! Ev edit $MYVIMRC
command! Rv source $MYVIMRC
command! Ni NeoBundleInstall
command! Nu NeoBundleUpdate

"##### Vim風のキーバインド #####"
"inoremap <C-j> <Down>
"inoremap <C-k> <Up>
"inoremap <C-h> <Left>
"inoremap <C-l> <Right>

"##### Emacs風のキーバインド #####"
"iunmap <C-n>
inoremap <C-n> <Down>
inoremap <C-p> <Up>
inoremap <C-b> <Left>
inoremap <C-f> <Right>

"移動系
nnoremap <C-H> <C-W>h
nnoremap <C-L> <C-W>l
nnoremap <C-K> <C-W>k
nnoremap <C-J> <C-W>j
nnoremap Q :q<CR>

"画面操作系
nnoremap ,v :<C-u>vsplit<CR>
nnoremap ,h :<C-u>split<CR>
nnoremap ,c :<C-u>close<CR>
nnoremap ,o :<C-u>only<CR>
nnoremap ,f :<C-u>call <SID>four_split()<CR>

func! s:four_split()
  vnew
  new
  wincmd l
  new
endfunc

"Ctrl+g をESCに
inoremap <C-g> <ESC>
noremap <C-g> <ESC>
vnoremap <C-g> <ESC>
cnoremap <C-g> <ESC>

"ESCキー２度押しでハイライトを消す
nnoremap <Esc><Esc> :<C-u>set nohlsearch<Return> 
" C-Oで下に空行挿入
nnoremap <C-o> o<ESC>

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
"inoremap <C-k>  <C-o>:<C-u>call <SID>kill_line()<CR>

""" unite.vim
" バッファ一覧
nnoremap <silent> <Space>b :<C-u>Unite buffer<CR>
" バッファのカレントディレクトリのファイル一覧
nnoremap <silent> <Space>f :<C-u>UniteWithBufferDir file_rec<CR>
" レジスタ一覧
nnoremap <silent> <Space>r :<C-u>Unite -buffer-name=register register<CR>
" 最近使用したファイル一覧
nnoremap <silent> <Space>m :<C-u>Unite file_mru<CR>
" 常用セット
nnoremap <silent> <Space>u :<C-u>Unite buffer file_mru<CR>
" 全部乗せ
nnoremap <silent> <Space>a :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
" カレントディレクトリ再帰的
nnoremap <silent> <Space>d :<C-u>Unite file_rec<CR>
" プラグイン検索
nnoremap <silent> <Space>s :<C-u>Unite neobundle/search<CR>
" アウトライン
nnoremap <silent> <Space>o :<C-u>Unite outline<CR>
" カラー
nnoremap <silent> <Space>c :<C-u>Unite colorscheme<CR>
" grep
nnoremap <silent> <Space>g :<C-u>Unite grep<CR>
" help
nnoremap <silent> <Space>h :<C-u>Unite help<CR>

"uniteを開いている間のキーマッピング
autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()"{{{
  "ctrl+jで縦に分割して開く
  nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
  inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
  "ctrl+jで横に分割して開く
  nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
  inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
  "ctrl+oでその場所に開く
  nnoremap <silent> <buffer> <expr> <C-o> unite#do_action('open')
  inoremap <silent> <buffer> <expr> <C-o> unite#do_action('open')
endfunction"}}}

"" ウィンドウを分割して開く
"au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
"au FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
"" ウィンドウを縦に分割して開く
"au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
"au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
"" ESCキーを2回押すと終了する
"au FileType unite nnoremap <silent> <buffer> <ESC><ESC> q
"au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q

" VimFiler
"nnoremap <silent> <Leader>v :<C-u>VimFiler<CR>
nnoremap <Leader>v :<C-u>VimFiler -split -winwidth=20 -toggle -no-quit -simple<CR>

" NERD-Commenter
nmap ,/ <Plug>NERDCommenterToggle
vmap ,/ <Plug>NERDCommenterToggle
nmap ,a <Plug>NERDCommenterAppend

" Open_Browser
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)
nmap <Leader>o <Plug>(openbrowser-open)
vmap <Leader>o <Plug>(openbrowser-open)
" ググる
nnoremap <Leader>g :<C-u>OpenBrowserSearch<Space><C-r><C-w><Enter>
nnoremap <Leader>s :<C-u>SyntasticCheck<CR>

"nnoremap T :tabe<CR>
"nnoremap <S-Tab> gt
"nnoremap <C-S-Tab> gT
"nnoremap L gt
"nnoremap H gT
nnoremap <C-U> :<C-u>Unite file_rec<CR>
nnoremap 1<CR> :b1<CR>
nnoremap 2<CR> :b2<CR>
nnoremap 3<CR> :b3<CR>
nnoremap 4<CR> :b4<CR>
nnoremap 5<CR> :b5<CR>
nnoremap 6<CR> :b6<CR>
" latex用
imap <C-k> <Plug>IMAP_JumpForward 

"for i in range(1, 9)
"    execute 'nnoremap <Tab>' . i . ' ' . i . 'gt'
"endfor

set tabline=%!MyTabLine()
 
function! MyTabLine()
  let s = ''
  for i in range(tabpagenr('$'))
    " select the highlighting
    if i + 1 == tabpagenr()
      let s .= '%#TabLineSel#'
    else
      let s .= '%#TabLine#'
    endif
 
    " set the tab page number (for mouse clicks)
    let s .= '%' . (i + 1) . 'T'
 
    " the label is made by MyTabLabel()
    let s .= ' %{MyTabLabel(' . (i + 1) . ')} '
  endfor
 
  " after the last tab fill with TabLineFill and reset tab page nr
  let s .= '%#TabLineFill#%T'
 
  " right-align the label to close the current tab page
  if tabpagenr('$') > 1
    let s .= '%=%#TabLine#%999XClose'
  endif
 
  return s
endfunction
 
 
function! MyTabLabel(n)
    let buflist = tabpagebuflist(a:n)
    let winnr = tabpagewinnr(a:n)
    let altbuf = bufname(buflist[winnr - 1])
 
    " $HOME を消す
    let altbuf = substitute(altbuf, expand('$HOME/'), '', '')
 
    " カレントタブ以外はパスを短くする
    if tabpagenr() != a:n
        let altbuf = substitute(altbuf, '^.*/', '', '')
        let altbuf = substitute(altbuf, '^.\zs.*\ze\.[^.]\+$', '', '')
    endif
 
    " vim-powerline のグリフを使う
    if g:use_Powerline_dividers
        let dividers = g:Pl#Parser#Symbols[g:Powerline_symbols].dividers
        let left_div = nr2char(get(dividers[3], 0, 124))
        let right_div = nr2char(get(dividers[1], 0, 124))
        let altbuf = left_div . altbuf . right_div
    else
        let altbuf = '|' . altbuf . '|'
    endif
 
    " タブ番号を付加
    let altbuf = a:n . ':' . altbuf
 
    return altbuf
endfunction
