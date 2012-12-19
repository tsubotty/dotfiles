case ${UID} in
  0)
  PROMPT="%{$fg_bold[red]%}%n%{$reset_color%}%{$FG[239]%}@%{$reset_color%}%{$FG[033]%}%m%{$reset_color%}%{$FG[239]%}%#%{$reset_color%} "
  PROMPT2="%{$fg[magenta]%}%_%{$reset_color%}%{$fg_bold[white]%}>>%{$reset_color%} "
  ;;
  *)
  PROMPT="%{$fg[green]%}%n%{$reset_color%}%{$FG[239]%}@%{$reset_color%}%{$FG[033]%}%m%{$reset_color%}%{$FG[239]%}%#%{$reset_color%} "
  PROMPT2="%{$fg[magenta]%}%_%{$reset_color%}%{$fg_bold[white]%}>>%{$reset_color%} "
  ;;
esac 

RPROMPT="%{$fg[yellow]%}%{$reset_color%}%{$FG[239]%}[%{$reset_color%}%{$fg[cyan]%}%~%{$reset_color%}%{$FG[239]%}]%{$reset_color%}"

SPROMPT="%{$fg_bold[red]%}correct: %R -> %r (y or n)?%{$reset_color%} "
