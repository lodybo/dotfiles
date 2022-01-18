# Linux-only aliases

# Update packages, update npm and node
# If I update this alias, I also will need to update the one in the TAF config
alias update='sudo apt update; sudo apt upgrade -y; nvm install --lts; npm install npm -g; npm update -g'
