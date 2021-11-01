source ~/.zshrc

# if [ -f $(brew --prefix)/etc/bash_completion ]; then
#    . $(brew --prefix)/etc/bash_completion
# fi

# Change terminal output
#GIT_PS1_SHOWDIRTYSTATE=true
# export PS1="\[\033[96m\]\u\[\033[m\]:\[\033[92m\]\W\[\033[37m\]\$(__git_ps1) \n\[\033[95m\]❯ \[\033[m\]"
#PROMPT="%n:%. "

# Improve 'ls' output (deprecated since the switch to exa)
# export CLICOLOR=1
# export LSCOLORS=GxFxCxDxBxegedabagaced
# alias ls='ls -GFha'

# NPM aliases
alias nl='npm list --depth=0'
alias nlg='npm -g list --depth=0'

# Git aliases/functions
alias gb='git branch'
alias gs='git status'
alias glo='git log --oneline -n5'
alias glon='git log --oneline -n$1'
alias gll='git log --graph --pretty=oneline --abbrev-commit'

# Create git changelog, usage: 'changelog <last tag>'
changelog() { git log --oneline --no-merges "$1"..HEAD; }

# Time ZSH start up in order to measure performance
timezsh() {
  shell=${1-$SHELL}
  for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
}

# Dev aliases
alias do_ssh='ssh -i ~/.ssh/digital_ocean_rsa $1'
alias do_rsync='rsync -av -e "ssh -i ~/.ssh/digital_ocean_rsa" $1'

# Misc. aliases
alias grep='grep --color'
alias edit_zprofile='${EDITOR} ~/.zprofile'
alias edit_zshrc='${EDITOR} ~/.zshrc'
alias restart_zsh='clear && exec zsh --login'

# bat aliases
alias cat='bat'
# alias tail='tail -f $1 | bat --paging=never -l log' # TODO: fix the input error bat gives out (not finding "-1")

# exa aliases
alias ls='exa'
alias lsa='exa -lah'
alias eagle_eye='exa --tree --level=2'
# alias eagle_eye_n='exa --tree --level=$1' # TODO: fix the "$1" parameter, it doesn't get recognized
alias eagle_eye_long='exa --tree --level=2 --long'
# alias eagle_eye_long_n='exa --tree --level=$1 --long' TODO: fix the same error as 'eagle_eye_n'


# This loads nvm
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
