#!/bin/sh -e

# Run the WSL bridge script
powershell.exe 'Start-Process PowerShell -Verb RunAs \"PowerShell -File \$env:USERPROFILE\\wsl2-bridge.ps1\"'

exit 0
