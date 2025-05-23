#!/bin/bash
# Set some sane configuration defaults for npm

# Check whether $DOTFILES_INSTALL_NPM_DEFAULTS is set, and determine whether to run this script.
# If it's not set, check whether the user wants to set up defaults for npm.
# If it is set to "1", run the script.
if [[ -z "$DOTFILES_INSTALL_NPM_DEFAULTS" ]]; then
  read -r -p "Would you like to set up defaults for npm? (y/n): " response
  if [[ "$response" =~ ^([nN][oO]|[nN])$ ]]; then
    echo "Skipping npm defaults"
    exit 0
  fi
else
  if [[ "$DOTFILES_INSTALL_NPM_DEFAULTS" != "1" ]]; then
    echo "Skipping npm defaults"
    exit 0
  fi
fi

echo "Setting up sane npm defaults"
echo ""

# When creating a new package, set the initial version tot "0.1.0"
echo "  › When creating a new package, set the initial version tot 0.1.0"
npm config -g set init-version=0.1.0

# Set the prerelease identifier to "beta"
echo "  › Set the prerelease identifier to beta"
npm config -g set preid=beta

# Set the shell to use for npm run, npm exec or other scripts, to bash (for fastness)
echo "  › Set the shell to use for npm run, npm exec or other scripts, to bash (for fastness)"
npm config -g set script-shell=/bin/bash

# Install some global npm modules
echo "  › Installing global npm modules"
npm install --global --registry https://registry.npmjs.org \
  npm-check \
  rimraf

