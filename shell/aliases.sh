# Default aliases

# Dotfiles
alias DOTFILES_VERSION='dotfiles_latest'

# ls
alias ls='ls -G'
alias lsa='ls -lah'

# Git
alias gb='git branch'
alias gs='git status'
alias glo='glon 5'
alias gll='git log --graph --pretty=oneline --abbrev-commit'
alias gu2l='git_update_to_latest'

# npm
alias nl='npm list'
alias nlg='npm -g list'

# Miscellaneous
alias grep='grep --color'
alias edit_bashrc='${EDITOR} ~/.bashrc_local'
alias edit_dotfiles_bashrc='${EDITOR} $DOTFILES/bash/bashrc'
alias restart_bash='clear && exec bash --login'
alias update='sudo apt update; sudo apt upgrade -y'
