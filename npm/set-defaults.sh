# Set some sane configuration defaults for npm

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

