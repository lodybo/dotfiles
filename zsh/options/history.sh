#####################################
## History                         ##
#####################################

setopt HIST_IGNORE_ALL_DUPS   # History won't save duplicates.
setopt HIST_FIND_NO_DUPS      # History won't show duplicates on search.
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt share_history          # share command history data
