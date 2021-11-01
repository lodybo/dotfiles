# Create git changelog, usage: 'changelog <last tag>'
changelog() { git log --oneline --no-merges "$1"..HEAD; }