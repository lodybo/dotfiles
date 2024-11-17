#####################################
## Miscellaneous                   ##
#####################################

#####################
## Dotfiles        ##
#####################
# Print the latest version of the dotfiles (see dotfiles_latest in shell/functions)
alias DOTFILES_VERSION='dotfiles_latest'

#####################
## Other           ##
#####################
# Print grep results in color
alias grep='grep --color'

# Edit the zshrc_local file
alias edit_zshrc='${EDITOR} ~/.zshrc_local'

# Reload the shell
alias reload_shell='clear && exec zsh --login'

# Print the directory stack
alias d='dirs -v'

# Quickly navigate to the directory stack with cd
for index ({1..9}) alias "$index"="cd +${index} > /dev/null"; unset index # directory stack

#####################
## System          ##
#####################
# Reboot system
alias reboot='sudo reboot'

# Shutdown system
alias shutdown='sudo shutdown now'

#####################
## Miscellaneous   ##
#####################
# Calculator
alias calc='bc'

# Pass environment (and config) when doing sudo
alias sudo='sudo -E'

alias EDIT_HOSTS="sudo vim /etc/hosts"
alias phpstorm="open -na \"PhpStorm.app\" --args \"$@\""
alias lps="phpstorm -e"

alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"
alias ts="tailscale"
alias '??'='ghcs'
alias 'git?'='gh copilot suggest -t git'
alias 'explain'='gh copilot explain'
alias news=newsboat
