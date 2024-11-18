#####################################
## Exa (replacement for ls)        ##
#####################################

#####################
## Treeview        ##
#####################
function eagle_eye_n() {
  local level=$1
  eza --tree --level="$level"
}

function eagle_eye_long_n() {
  local level=$1
  eagle_eye_n "$level" --long
}
