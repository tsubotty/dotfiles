#! /bin/zsh
# A script to make using 256 colors in zsh less painful.
# P.C. Shyamshankar <sykora@lucentbeing.com>
# Copied from http://github.com/sykora/etc/blob/master/zsh/functions/spectrum/

typeset -Ag FX FG BG

FX=(
    reset     "%{[00m%}"
    bold      "%{[01m%}" no-bold      "%{[22m%}"
    italic    "%{[03m%}" no-italic    "%{[23m%}"
    underline "%{[04m%}" no-underline "%{[24m%}"
    blink     "%{[05m%}" no-blink     "%{[25m%}"
    reverse   "%{[07m%}" no-reverse   "%{[27m%}"
)

for color in {000..255}; do
    FG[$color]="%{[38;5;${color}m%}"
    BG[$color]="%{[48;5;${color}m%}"
done

# Show all 256 colors with color number
function spectrum_ls() {
  for code in {000..255}; do
    print -P -- "$code: %F{$code}Test%f"
  done
}

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
