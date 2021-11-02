bat_binary="unknown"
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    bat_binary="bat-linux"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    bat_binary="bat-macos"
fi

alias bat="${bat_binary}"
alias cat='bat'
# alias tail='tail -f $1 | bat --paging=never -l log' # TODO: fix the input error bat gives out (not finding "-1")