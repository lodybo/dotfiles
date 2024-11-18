# TODO: Remove username from prompt, add clock to right hand side

NEWLINE=$'\n'
PROMPT='$(get_battery_status) %{$FG[green]%}%~ $(git_prompt_info)'
PROMPT+="${NEWLINE}%{$fg[magenta]%}❯%{$reset_color%} "

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg_bold[white]%}(%{$fg[white]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[white]%})%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN=""
# See more variables and functions here: https://github.com/robbyrussell/oh-my-zsh/blob/master/lib/git.zsh
# And ZSH_THEME_GIT_PROMPT_* variables: https://gist.github.com/vergenzt/33a45a9a9218b38bd4bf

function get_battery_status() {
  $DOTFILES/bin/mac-battery-status
}

function git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return

  # Checks if working tree is dirty
  local STATUS=''
  local FLAGS
  FLAGS=('--porcelain')
  if [[ "$(command git config --get oh-my-zsh.hide-dirty)" != "1" ]]; then
    if [[ $POST_1_7_2_GIT -gt 0 ]]; then
      FLAGS+='--ignore-submodules=dirty'
    fi
    if [[ "$DISABLE_UNTRACKED_FILES_DIRTY" == "true" ]]; then
      FLAGS+='--untracked-files=no'
    fi
    STATUS=$(command git status ${FLAGS} 2> /dev/null | tail -n1)
  fi

  if [[ -n $STATUS ]]; then
    GIT_PROMPT_COLOR="%{$fg[red]%}"
    GIT_DIRTY_STAR="*"
  else
    GIT_PROMPT_COLOR="%{$fg[white]%}"
    unset GIT_DIRTY_STAR
  fi

  echo "$ZSH_THEME_GIT_PROMPT_PREFIX$GIT_PROMPT_COLOR$(git_current_branch)$GIT_DIRTY_STAR$ZSH_THEME_GIT_PROMPT_SUFFIX"
}
