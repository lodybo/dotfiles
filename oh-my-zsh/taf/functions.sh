# WSL-specific functions

############################################
# Dotfiles
############################################
local_ips() {
  # Get both IP's
  ips=$(ipconfig | awk "/IPv4/ {print $4}" | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}");

  echo "${ips}";
}
