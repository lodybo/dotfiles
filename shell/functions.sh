# Shell functions

# Create git changelog, usage: 'changelog <last tag>'
git_changelog() { git log --oneline --no-merges "$1"..HEAD; }

# Delete both remote and local branch
git_remove_branch()
{
  branch=$1
  git push -d origin "$branch"
  git branch -d "$branch"
}

# Show the git log history N commits long
glon()
{
  commits=$1
  git log --oneline -n"$commits"
}