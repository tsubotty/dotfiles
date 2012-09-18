syntax on "色分け
set hidden "バッファを保存しなくても他のバッファを表示
set wildmenu "コマンドライン補完を便利に
set showcmd "タイプ途中のコマンドを画面最下行に表示
set incsearch "インクリメンタルサーチ
set hlsearch "検索語を強調表示
set ignorecase "大文字/小文字の区別なく検索する
set smartcase "検索文字列に大文字が含まれている場合は区別して検索する
set autoindent "オートインデント
set nostartofline "移動コマンドを使った時、行頭に移動しない
set ruler "ルーラーを表示
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L] "ステータスラインを強化
set laststatus=2 "ステータスラインを常に表示
set confirm "バッファが変更されている時、コマンドをエラーにするのでは無く、保存するかどうかの確認
set visualbell "ビープ音の代わりに画面フラッシュ
set t_vb= "画面フラッシュをオフ
set mouse=a "全モードでマウスをオン
set cmdheight=2 "コマンドラインの高さを2行に
set number "行番号を表示する
set notimeout ttimeout ttimeoutlen=200 "キーコードはすぐにタイムアウト。マッピングはタイムアウトしない
set pastetoggle=<F11> "<F11>でpasteとnopasteを入れ替える
set noswapfile "swapファイルを作らない
set nobackup "bakcupファイルを作らない
set formatoptions-=ro "コメントアウトで改行時の自動をやめる
autocmd FileType * set formatoptions-=ro

"####インデント関連#####"
set tabstop=4
set shiftwidth=4
set softtabstop=0
set smarttab
set listchars=eol:¬,tab:▸\

set title "編集中のファイル名を表示
set showmatch "括弧入力時の対応する括弧を表示

"#####検索設定#####
set wrapscan "検索時に最後まで行ったら最初に戻る
"サイズ変更
"set lines=50 columns=100

"###エンコード####
set fileencoding=utf-8
"クリップボード関連
set clipboard+=autoselect
" clipboard=autoselect

"NeoComplcache有効
let g:neocomplcache_enable_at_startup = 1

"vimを使ってくれてありがとう非表示
set notitle
