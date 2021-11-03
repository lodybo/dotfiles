# Default aliases

# ls
alias ls='ls -G'
alias lsa='ls -lah'

# Git
alias gb='git branch'
alias gs='git status'
alias glo='git log --oneline -n5'
alias glon='git log --oneline -n$1'
alias gll='git log --graph --pretty=oneline --abbrev-commit'

# npm
alias nl='npm list --depth=0'
alias nlg='npm -g list --depth=0'

# Miscellaneous
alias grep='grep --color'
alias edit_bashrc='${EDITOR} ~/.bashrc'
alias restart_bash='clear && exec bash --login'