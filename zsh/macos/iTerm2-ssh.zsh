# Changing iTerm2 color in MacOSX when SSHing (so you know at a glance that you're no longer in Kansas)
# Adapted from https://gist.github.com/porras/5856906
# 1. Create a theme in your terminal setting with the name "SSH" and the desired colors, background, etc.
# 2. Add this to your .bash_profile (or .bashrc, I always forget the difference ;))
# 3. Optional but useful: in the terminal, go to Settings > Startup and set "New tabs open with" to
#    "default settings" (otherwise, if you open a new tab from the changed one, you get a local tab with
#    the SSH colors)

DOTFILES_ITERM_SSH_PROFILES=""

function tabc() {
  NAME=$1; if [ -z "$NAME" ]; then NAME="Default"; fi # if you have trouble with this, change
                                                      # "Default" to the name of your default theme
  echo -e "\033]50;SetProfile=$NAME\a"
}

function tab-reset() {
    NAME="Lody"
    echo -e "\033]50;SetProfile=$NAME\a"
    trap - INT EXIT
}

function colorssh() {
  if [[ -n "$ITERM_SESSION_ID" ]]; then
      trap "tab-reset" INT EXIT
      # shellcheck disable=SC2076
      if [[ "$*" =~ $DOTFILES_ITERM_SSH_PROFILES ]]; then
          tabc SSH
      fi
  fi
  ssh "$@"
}
compdef _ssh tabc=ssh

alias ssh="colorssh"
compdef _ssh colorssh=ssh

# This would be easy to extend to check if a theme with the name of the server exists and set it, and
# fall back to the SSH theme. This way you can have different colors for different remote environments
# (per project, production, staging, etc.)

