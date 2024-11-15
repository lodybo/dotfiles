#####################################
## Git                             ##
#####################################

##############
## Branches ##
##############

# Get the current branch name
function git_current_branch() {
  local ref
  ref=$(git symbolic-ref --quiet HEAD 2> /dev/null)

  local ret=$?
  if [[ $ret != 0 ]]; then
    return $ret
  fi
  echo "${ref#refs/heads/}"
}

# Update the current with the latest state of another branch
git_update_to_latest()
{
  git fetch
  glo --all --quiet FETCH_HEAD..HEAD
  git merge
}

############################
## Logs and status checks ##
############################

# Show the git log history N commits long
glon()
{
  commits=$1
  git log --oneline -n"$commits"
}
