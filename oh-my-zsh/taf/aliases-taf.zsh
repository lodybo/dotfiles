# TAF-specific aliases

# Run the linux update alias, and add some own updates to it
alias update='sudo apt update; sudo apt upgrade -y; nvm install --lts; npm install npm -g; npm update -g; powershell.exe wsl --update';
