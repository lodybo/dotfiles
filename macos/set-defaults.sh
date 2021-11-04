# Here's the place for some macos stuff...
# inspiration:
# https://github.com/anishathalye/dotfiles-local/blob/mac/macos
# https://github.com/holman/dotfiles/blob/master/macos/set-defaults.sh
# https://github.com/mathiasbynens/dotfiles/blob/master/.macos
# https://github.com/caarlos0/dotfiles/blob/master/macos/set-defaults.sh
#

# From Zach Holman (https://github.com/holman/dotfiles/blob/master/macos/install.sh)
# There's a nifty command line interface to handle updates and installables in the Mac App Store, that we can use to just install everything, so
# yeah, let's do that.

echo "› sudo softwareupdate -i -a"
sudo softwareupdate -i -a

# Pull exa and bat out of quarantine
xattr -d com.apple.quarantine $DOTFILES/bin/exa $DOTFILES/bin/bat
