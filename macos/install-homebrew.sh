#!/bin/bash
#
# Homebrew
#
# This installs some of the common dependencies needed (or at least desired)
# using Homebrew.

# Check for Homebrew
if test ! "$(which brew)"
then
  echo "  Installing Homebrew for you."

  # Install the correct homebrew for each OS type
  if test "$(uname)" = "Darwin";
  then
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi

fi

echo >> ~/.zprofile
echo eval "$(/opt/homebrew/bin/brew shellenv)" >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# Install packages from a brewfile
brew bundle --file "$DOTFILES/macos/Brewfile"

exit 0
