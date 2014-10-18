# ------------------------------
# シェル関数のロード
# ------------------------------
autoload -U compinit; compinit # 補完機能を有効にする
autoload history-search-end # マッチしたコマンドのヒストリを表示できるようにする
autoload -Uz colors; colors; # プロンプトに色を付ける

# ------------------------------
# 環境変数設定
# ------------------------------
export EDITOR=vim        # エディタをvimに設定
export PAGER=less        
export LESS='-R'
export LESSOPEN='| /usr/local/bin/src-hilite-lesspipe.sh %s' # less syntax highlight
export LANG=ja_JP.UTF-8  # 文字コードをUTF-8に設定
export KCODE=u           # KCODEにUTF-8を設定
export AUTOFEATURE=true  # autotestでfeatureを動かす
export LISTMAX=1000
export HISTFILE=~/.zsh_history   # ヒストリを保存するファイル
export HISTSIZE=100000            # メモリに保存されるヒストリの件数
export SAVEHIST=100000            # 保存されるヒストリの件数
export HISTTIMEFORMAT='%y/%m/%d %H:%M:%S ';
export LSCOLORS="Gxfxcxdxbxegedabagacad"
export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30' ## 補完時の色の設定
export ZLS_COLORS=$LS_COLORS ## ZLS_COLORSとは？ 多分下のzsytle ':の設定と重複
export CLICOLOR=true ## lsコマンド時、自動で色がつく(ls -Gのようなもの？)
export ZSH_SETTINGS="${HOME}/dotfiles/zsh_settings/"
export ZSH_THEMES="${HOME}/dotfiles/zsh_themes/"
export ZSH_THEME="my_rprompt"

# ------------------------------
# zle : ウィジェット作成の設定
# 書式：zle -N ウィジェット名　シェル関数名
# ------------------------------
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end

# ------------------------------
# キーバインド
# ウィジェットにキーをバインド
# 書式：bindkey キー　ウィジェット
# ------------------------------
bindkey -e               # キーバインドをemacsモードに設定
#bindkey -v              # キーバインドをviモードに設定
bindkey "^[[Z" reverse-menu-complete  # Shift-Tabで補完候補を逆順する("\e[Z"でも動作する)
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

# ------------------------------
# 有効オプション設定
# ------------------------------
setopt no_beep                 # ビープ音を鳴らさないようにする
setopt auto_cd                 # ディレクトリ名の入力のみで移動する 
setopt auto_pushd              # cd時にディレクトリスタックにpushdする
setopt correct_all                 # コマンドのスペルを訂正する
setopt magic_equal_subst       # =以降も補完する(--prefix=/usrなど)
setopt prompt_subst            # プロンプト定義内で変数置換やコマンド置換を扱う
setopt notify                  # バックグラウンドジョブの状態変化を即時報告する
setopt equals                  # =commandを`which command`と同じ処理にする
setopt complete_in_word
setopt auto_list               # 補完候補を一覧で表示する(d)
setopt auto_menu               # 補完キー連打で補完候補を順に表示する(d)
setopt always_to_end           # 補完後のカーソルを自動で文末まで動かす？
setopt auto_name_dirs          # 絶対ディレクトリと相対ディレクトリを自動判別？
setopt list_packed             # 補完候補をできるだけ詰めて表示する
setopt list_types              # 補完候補にファイルの種類も表示する
setopt extended_glob           # グロブ機能を拡張する
setopt bang_hist          # !を使ったヒストリ展開を行う(d)
setopt extended_history   # ヒストリに実行時間も保存する
setopt hist_ignore_dups   # 直前と同じコマンドはヒストリに追加しない
setopt hist_ignore_space  # コマンドがスペースで始まる場合、コマンド履歴に追加しない  例： <Space>echo hello と入力
setopt share_history      # 他のシェルのヒストリをリアルタイムで共有する
setopt hist_reduce_blanks # 余分なスペースを削除してヒストリに保存する

# ------------------------------
# 無効オプション設定
# ------------------------------
unsetopt caseglob    # ファイルグロブで大文字小文字を区別しない

# ------------------------------
# zstyle 補完に関する設定
# どのようなコンテクストでどのようなスタイルにするかを設定
# ------------------------------
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' # 補完時に大文字小文字を区別しない
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS} # 補完候補に色を付ける

# ------------------------------
# シェル関数定義
# ------------------------------
function history-all { history -E 1 }

# ------------------------------
# 外部ファイル読み込み
# ------------------------------

. ${ZSH_THEMES}${ZSH_THEME}".zsh-theme"    # テーマ読み込み

for file in `ls $ZSH_SETTINGS`
do
. $ZSH_SETTINGS$file
done

# ------------------------------
# シェル起動時、コマンド同時実行
# ------------------------------
[[ -z "$TMUX" && ! -z "$PS1" ]] && tmux

