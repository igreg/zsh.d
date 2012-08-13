function __git_branch {
  local b="$(git symbolic-ref HEAD 2>/dev/null)"
  if [ -n "$b" ]; then
    printf "%s" "${b##refs/heads/}"
  fi
}

function fetch {
  if [ "$1" ]; then
    git fetch $1
  else
    git fetch origin
  fi
}

function pull {
  if [ "$1" = "--rebase" ]; then
    git pull --rebase origin `__git_branch`
  else
    git pull origin `__git_branch`
  fi
}

function push {
  local cjob=0
  local force=0

  for option in $*; do
    test $option = "--hudson" && cjob=1
    test $option = "--force" && force=1
  done

  if [ $? = 0 ]; then
    if [ $force = 1 ]; then
      git push origin `__git_branch` --force
    else
      git push origin `__git_branch`
    fi
  fi

  if [ $? = 0 -a $cjob = 1 ]; then
    script/hudson create `__git_branch`
  fi
}

function forward {
  git merge origin/`__git_branch`
}

function delete_branch {
  branch=$1

  local flag="-d"
  local djob=0
  local remote=0
  local dir=`pwd`

  for option in $*; do
    test $option = "--force" && flag="-D"
    test $option = "--hudson" && djob=1
  done

  echo "Removing local branch"
  git branch $flag $branch
  echo "Removing remote branch"
  git push origin :$branch
  echo "Cleaning up rails repository"
  git remote prune origin

  if [ $djob = 1 ]; then
    echo "Removing hudson job"
    script/hudson delete $branch || true
  fi
}