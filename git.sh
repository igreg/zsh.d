function __git_branch {
  local b="$(git symbolic-ref HEAD 2>/dev/null)"
  if [ -n "$b" ]; then
    printf "%s" "${b##refs/heads/}"
  fi
}

function forward {
  git merge origin/`__git_branch`
}

function clean_merged_branches {
  git branch --merged | grep -v "\*" | xargs -n 1 git branch -d
}

if which gitx 2>&1 > /dev/null; then
  alias gk="gitx"
  alias gg="gitx --commit"
fi
