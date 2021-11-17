# Shell functions

############################################
# Dotfiles
############################################
dotfiles_latest()
{
  dotfiles_version="$DOTFILES_VERSION"
  dotfiles_latest_tag="$(git describe --tags --abbrev=0)"

  echo "I investigated some version info, and found the following"
  echo ""
  echo "    Dotfiles current: $dotfiles_version"
  echo "    Dotfiles latest: $dotfiles_latest_tag"
  echo ""
}

############################################
# Git
############################################
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

# Update the current with the latest state of another branch
git_update_to_latest()
{
  branch=$1
  git checkout "$branch"
  git pull
  git checkout -
  git merge "$branch"
}
