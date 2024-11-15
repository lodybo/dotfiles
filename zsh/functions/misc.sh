#####################################
## Miscellaneous                   ##
#####################################

#############
## Dotfiles ##
#############
dotfiles_latest()
{
  dotfiles_version=$(git -C "$DOTFILES" tag --list | awk '{print $0}' | awk '{t=$0} END{print t}')
  dotfiles_latest_tag="$(git ls-remote --tags https://github.com/lodybo/dotfiles.git | awk '{print $2}' | awk -F/ '{print $3}' | awk '{t=$0} END{print t}')"
  upgrade_instructions="It seems like you're fine, Lody."

  if [[ "$dotfiles_version" != "$dotfiles_latest_tag" ]]; then
    upgrade_instructions="There's a newer version available, please update!"
  fi

  echo "I investigated some version info, and found the following:"
  echo ""
  echo "    Dotfiles current: $dotfiles_version"
  echo "    Dotfiles latest: $dotfiles_latest_tag"
  echo ""
  echo "$upgrade_instructions"
  echo ""
}

#####################
## Other           ##
#####################
# Time ZSH start up in order to measure performance
timezsh() {
  shell=${1-$SHELL}
  for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
}

# Run a cheat sheet for terminal commands.
# Powered by http://cheat.sh
cheat() {
  # Trim output of args because we want to check if '-h' was passed
  query=$1

  # Check whether '-h' is passed and if so, query the help command
  if [[ "$query" == "-h" ]]
  then
    # Curl for help
    curl cheat.sh/:help
  else
    # Curl cheat sheet
    curl cheat.sh/"$query"
  fi
}

# Print a QR code of a URL (or something else)
# Powered by http://qrenco.de
qrify() {
  query=$1

  printf "\n"
  echo "Printing QR code for $query:"
  printf "\n"
  curl qrenco.de/"$query"
  printf "\n"
}

# Print localised weather info, optionally with location param
# Taken from: https://www.jamieonkeys.dev/posts/calendar-and-weather-in-terminal/
weather() {
  if [ $# -eq 0 ] # If no argument has been passed to this function
    then
      curl wttr.in
    else
      curl wttr.in/"$1" # Append location
  fi
}
