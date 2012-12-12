ZSH=$HOME/.oh-my-zsh #フレームワークの基準ディレクトリ

ZSH_THEME="my_rprompt"

# CASE_SENSITIVE="true"

# DISABLE_AUTO_UPDATE="true"

# DISABLE_LS_COLORS="true"

# DISABLE_AUTO_TITLE="true"

# COMPLETION_WAITING_DOTS="true"

plugins=(git)

# 下記追加 PATHの設定を先に行う
source $HOME/dotfiles/.path.zsh
source $ZSH/oh-my-zsh.sh

