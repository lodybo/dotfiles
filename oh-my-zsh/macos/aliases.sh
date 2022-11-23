# macOS-only aliases

# Lock the screen (when going AFK)
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

# Get macOS Software Updates, and update installed Homebrew, node, npm, and their installed packages
alias update='sudo softwareupdate -i -a; brew update; brew upgrade; brew cleanup; nvm install --lts; npm install npm -g; npm update -g'

# Print this MacBook's IP address
alias whatsmyip='ipconfig getifaddr en0'
