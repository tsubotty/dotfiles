# karasuhaneto theme by Tsubone Seiya

function prompt_char {
    git branch >/dev/null 2>/dev/null && echo '±' && return
    echo '○'
}

local current_dir='${PWD/#$HOME/~}'
local git_info='$(git_prompt_info)'

PROMPT="╭─%{$FG[040]%}%n%{$reset_color%} %{$FG[239]%}at%{$reset_color%} %{$FG[033]%}%m%{$reset_color%} %{$FG[239]%}in%{$reset_color%} %{$terminfo[bold]$FG[226]%}${current_dir}%{$reset_color%}${git_info}
╰─$(prompt_char) "
#RPROMPT="[%*]"
if [ ${UID} -eq 0 ]; then
PROMPT="╭─%B%U%{$fg[red]%}%n%{$reset_color%}%U%B %{$FG[239]%}at%{$reset_color%} %{$FG[033]%}%m%{$reset_color%} %{$FG[239]%}in%{$reset_color%} %{$terminfo[bold]$FG[226]%}${current_dir}%{$reset_color%}${git_info}
╰─$(prompt_char) "
fi
ZSH_THEME_GIT_PROMPT_PREFIX=" %{$FG[239]%}on%{$reset_color%} %{$fg[255]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$FG[202]%}×"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$FG[040]%}◯"
