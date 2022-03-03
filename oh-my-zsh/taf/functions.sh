# WSL-specific functions

############################################
# Dotfiles
############################################
local_ips() {
  # Get the IP's from WSL itself, the virtual Ethernet adapter of WSL and of the Windows laptop
  wsl="$(hostname -I)"
  wsl_virt=$(powershell '(Get-NetIPAddress -AddressFamily IPv4 -InterfaceAlias "vEthernet (WSL)").IPAddress')
  win="$(powershell "(Get-NetIPAddress -AddressFamily IPv4 -InterfaceAlias Wi-Fi).IPAddress")"

  echo "";
  echo "Local IP information";
  echo "----------------------------------------";
  echo -e "WSL              \t $wsl";
  echo -e "WSL (virtual eth)\t $wsl_virt";
  echo -e "Windows          \t $win";
  echo "----------------------------------------";
  echo "";
}
