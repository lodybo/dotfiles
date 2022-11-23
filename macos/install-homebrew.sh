#!/bin/sh
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
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi

fi

# Add Homebrew to the path for M1 MacBooks
if  $(sysctl -n machdep.cpu.brand_string) =~ "M1"
then
  echo "Setting up Homebrew especially for a M1 MacBook.."
  echo eval "$(/opt/homebrew/bin/brew shellenv)" >> ~/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Install packages from a brewfile
brew bundle --file "$DOTFILES/macos/Brewfile"

exit 0
