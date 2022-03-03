# Shell functions

############################################
# Dotfiles
############################################
dotfiles_latest()
{
  dotfiles_version=$(git -C "$DOTFILES" tag --list | awk '{print $0}' | awk '{t=$0} END{print t}')
  dotfiles_latest_tag="$(git ls-remote --tags https://github.com/lodybo/dotfiles.git | awk '{print $2}' | awk -F/ '{print $3}' | awk '{t=$0} END{print t}')"
  upgrade_instructions="It seems like you're fine, Lody."

  if [[ "$dotfiles_version" != "$dotfiles_latest_tag" ]]; then
    upgrade_instructions="There's a newer version available, please update!"
  fi

  echo "I investigated some version info, and found the following:"
  echo ""
  echo "    Dotfiles current: $dotfiles_version"
  echo "    Dotfiles latest: $dotfiles_latest_tag"
  echo ""
  echo "$upgrade_instructions"
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
  git fetch origin "$branch":"$branch"
  git merge "$branch"
}
