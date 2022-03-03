# TAF-specific aliases

# Run the linux update alias, and add some own updates to it
alias powershell="powershell.exe"
alias padmin="powershell 'Start-Process powershell -Verb runAs'"
alias ipconfig="powershell ipconfig"
alias update='sudo apt update; sudo apt upgrade -y; nvm install --lts; npm install npm -g; npm update -g; powershell wsl --update';

alias wslb="powershell 'Start-Process PowerShell -Verb RunAs \"PowerShell -File \$env:USERPROFILE\\wsl2-bridge.ps1\"'"
alias wslbridge=wslb
