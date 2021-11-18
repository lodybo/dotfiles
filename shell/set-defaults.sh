# Set defaults for the default config

DOTFILES_VERSION="$(awk '/version:/ {print $2}' "$DOTFILES/README.md")"
export DOTFILES_VERSION