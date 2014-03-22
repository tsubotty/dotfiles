# flag によって 環境を切り替える
flag="original" # 自分専用設定のみ
# flag="framework" # oh-my-zshを使用
ZSH_THEME="my_rprompt"

# 下記追加 PATHの設定を先に行う
source $HOME/dotfiles/.path.zsh

if [ $flag = "framework" ]; then
    ZSH=$HOME/.oh-my-zsh #フレームワークの基準ディレクトリ

    # CASE_SENSITIVE="true"

    # DISABLE_AUTO_UPDATE="true"

    # DISABLE_LS_COLORS="true"

    # DISABLE_AUTO_TITLE="true"

    # COMPLETION_WAITING_DOTS="true"

    plugins=(git)

    source $ZSH/oh-my-zsh.sh
else
    ZSH_SETTINGS="${HOME}/dotfiles/zsh_settings/"
    ZSH_THEMES="${HOME}/dotfiles/zsh_themes/"
    . $HOME/dotfiles/original_basic.zsh #中心となる設定
    . ${ZSH_THEMES}${ZSH_THEME}".zsh-theme" # 最後に選んだテーマで上書き
    for file in `ls $ZSH_SETTINGS`
    do
        . $ZSH_SETTINGS$file
    done
fi

# powerline の設定 http://mba-hack.blogspot.jp/2013/01/powerline-bash.html
#function powerline_precmd() {
#  export PS1="$(~/powerline-bash/powerline-bash.py $? --shell zsh)"
#}
# 
#function install_powerline_precmd() {
#  for s in "${precmd_functions[@]}"; do
#    if [ "$s" = "powerline_precmd" ]; then
#      return
#    fi
#  done
#  precmd_functions+=(powerline_precmd)
#}
# 
#install_powerline_precmd
###-begin-npm-completion-###
#
# npm command completion script
#
# Installation: npm completion >> ~/.bashrc  (or ~/.zshrc)
# Or, maybe: npm completion > /usr/local/etc/bash_completion.d/npm
#

COMP_WORDBREAKS=${COMP_WORDBREAKS/=/}
COMP_WORDBREAKS=${COMP_WORDBREAKS/@/}
export COMP_WORDBREAKS

if type complete &>/dev/null; then
  _npm_completion () {
    local si="$IFS"
    IFS=$'\n' COMPREPLY=($(COMP_CWORD="$COMP_CWORD" \
                           COMP_LINE="$COMP_LINE" \
                           COMP_POINT="$COMP_POINT" \
                           npm completion -- "${COMP_WORDS[@]}" \
                           2>/dev/null)) || return $?
    IFS="$si"
  }
  complete -F _npm_completion npm
elif type compdef &>/dev/null; then
  _npm_completion() {
    si=$IFS
    compadd -- $(COMP_CWORD=$((CURRENT-1)) \
                 COMP_LINE=$BUFFER \
                 COMP_POINT=0 \
                 npm completion -- "${words[@]}" \
                 2>/dev/null)
    IFS=$si
  }
  compdef _npm_completion npm
elif type compctl &>/dev/null; then
  _npm_completion () {
    local cword line point words si
    read -Ac words
    read -cn cword
    let cword-=1
    read -l line
    read -ln point
    si="$IFS"
    IFS=$'\n' reply=($(COMP_CWORD="$cword" \
                       COMP_LINE="$line" \
                       COMP_POINT="$point" \
                       npm completion -- "${words[@]}" \
                       2>/dev/null)) || return $?
    IFS="$si"
  }
  compctl -K _npm_completion npm
fi
###-end-npm-completion-###
