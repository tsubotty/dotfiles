# zshの設定ファイルを分割する ~/dotfiles/.zsh/の*.zshを読み込む
ZSHHOME="${HOME}/dotfiles/.zsh"

if [ -d $ZSHHOME -a -r $ZSHHOME -a -x $ZSHHOME ]; then
for i in $ZSHHOME/*; do
    [[ ${i##*/} = *.zsh ]] && [ \( -f $i -o -h $i \) -a -r $i ] && . $i
done
fi

# zsh-git-promptを読み込む
source ~/dotfiles/.zsh/git-prompt/zshrc.sh

# ------------------------------
# General Settings
# ------------------------------
export EDITOR=vim        # エディタをvimに設定
export PAGER=less        
export LESS='-R'
export LESSOPEN='| /usr/local/bin/src-hilite-lesspipe.sh %s' # less syntax highlight
export LANG=ja_JP.UTF-8  # 文字コードをUTF-8に設定
export KCODE=u           # KCODEにUTF-8を設定
export AUTOFEATURE=true  # autotestでfeatureを動かす
export LISTMAX=1000

bindkey -e               # キーバインドをemacsモードに設定
#bindkey -v              # キーバインドをviモードに設定

setopt no_beep           # ビープ音を鳴らさないようにする
setopt auto_cd           # ディレクトリ名の入力のみで移動する 
setopt auto_pushd        # cd時にディレクトリスタックにpushdする
setopt correct_all           # コマンドのスペルを訂正する
setopt magic_equal_subst # =以降も補完する(--prefix=/usrなど)
setopt prompt_subst      # プロンプト定義内で変数置換やコマンド置換を扱う
setopt notify            # バックグラウンドジョブの状態変化を即時報告する
setopt equals            # =commandを`which command`と同じ処理にする
setopt complete_in_word

### Complement ###
autoload -U compinit; compinit # 補完機能を有効にする
setopt auto_list               # 補完候補を一覧で表示する(d)
setopt auto_menu               # 補完キー連打で補完候補を順に表示する(d)
setopt always_to_end
setopt auto_name_dirs
setopt list_packed             # 補完候補をできるだけ詰めて表示する
setopt list_types              # 補完候補にファイルの種類も表示する
bindkey "^[[Z" reverse-menu-complete  # Shift-Tabで補完候補を逆順する("\e[Z"でも動作する)
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' # 補完時に大文字小文字を区別しない

### Glob ###
setopt extended_glob # グロブ機能を拡張する
unsetopt caseglob    # ファイルグロブで大文字小文字を区別しない

### History ###
HISTFILE=~/.zsh_history   # ヒストリを保存するファイル
HISTSIZE=100000            # メモリに保存されるヒストリの件数
SAVEHIST=100000            # 保存されるヒストリの件数
setopt bang_hist          # !を使ったヒストリ展開を行う(d)
setopt extended_history   # ヒストリに実行時間も保存する
setopt hist_ignore_dups   # 直前と同じコマンドはヒストリに追加しない
setopt share_history      # 他のシェルのヒストリをリアルタイムで共有する
setopt hist_reduce_blanks # 余分なスペースを削除してヒストリに保存する
HISTTIMEFORMAT='%y/%m/%d %H:%M:%S ';

# マッチしたコマンドのヒストリを表示できるようにする
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

# すべてのヒストリを表示する
function history-all { history -E 1 }


# ------------------------------
# Look And Feel Settings
# ------------------------------
### Ls Color ###
## 補完時の色の設定
export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
## ZLS_COLORSとは？ 多分下のzsytle ':の設定と重複
export ZLS_COLORS=$LS_COLORS
## lsコマンド時、自動で色がつく(ls -Gのようなもの？)
export CLICOLOR=true
## 補完候補に色を付ける
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
#### Prompt ###
## プロンプトに色を付ける
autoload -Uz colors; colors;
export LSCOLORS="Gxfxcxdxbxegedabagacad"
# precmdを複数 
autoload -Uz add-zsh-hook

#### Title PWD:user@hostname ###
#case "${TERM}" in
#kterm*|xterm*|)
#  _precmd_1() {
#      print -Pn "\e]0;%~:%n@%m\a"
#  }
#  add-zsh-hook precmd _precmd_1
#  ;;
#esac

# z (easy jump)
_Z_CMD=j
source $HOME/dotfiles/.zsh/z.sh
_precmd_2() {
    _z --add "$(pwd -P)"
}
add-zsh-hook precmd _precmd_2

#=============================
# source auto-fu.zsh
#=============================
if [ -f $HOME/dotfiles/.zsh/auto-fu.zsh ]; then
    source ~/dotfiles/.zsh/auto-fu.zsh
    function zle-line-init () {
    auto-fu-init
}
zle -N zle-line-init
zstyle ':completion:*' completer _oldlist _complete
fi

# ------------------------------
# Other Settings
# ------------------------------
### RVM ###
if [[ -s ~/.rvm/scripts/rvm ]] ; then source ~/.rvm/scripts/rvm ; fi

### rbenv(ruby version controll) ###
#if [ -n "`which rbenv 2>/dev/null`" ]; then
if [ -d ~/.rbenv/ ]; then
    eval "$(rbenv init -)"
fi
