#####################################
## Aliases for git commands        ##
#####################################

#####################
## Branches        ##
#####################
alias gb='git branch'
alias gba='git branch -a'
alias gbd='git branch -d'
alias gbD='git branch -D'
alias gco='git checkout'
alias gpsup='git push --set-upstream origin $(git_current_branch)'

#####################
## Status & logs   ##
#####################
alias gs='git status'
alias glo='glon 5'
alias gll='git log --graph --pretty=oneline --abbrev-commit'

#####################
## Mutations       ##
#####################
alias gu2l='git_update_to_latest'
