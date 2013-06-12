function __git_branch {
  local b="$(git symbolic-ref HEAD 2>/dev/null)"
  if [ -n "$b" ]; then
    printf "%s" "${b##refs/heads/}"
  fi
}

function push {
  git push origin `__git_branch` $*
}

function forward {
  git merge origin/`__git_branch`
}

if which gitx 2>&1 > /dev/null; then
  alias gk="gitx"
  alias gg="gitx --commit"
fi

if which gittower 2>&1 > /dev/null; then
  alias gk="gittower"
  alias gg="gittower --status"
fi

alias st="git status"
alias co="git checkout"
alias br="git checkout -b"
alias brs="git branch"
alias fetch="git fetch"
alias pull="git pull --prune"
alias delete="git branch -d"

# function push {
#   local cjob=0
#   local force=0
#   local retval=0

#   for option in $*; do
#     test $option = "--hudson" && cjob=1
#     test $option = "--force" && force=1
#   done

#   if [ $? = 0 ]; then
#     if [ $force = 1 ]; then
#       git push origin `__git_branch` --force
#       retval=$?
#     else
#       git push origin `__git_branch`
#       retval=$?
#     fi
#   fi

#   if [ $? = 0 -a $cjob = 1 ]; then
#     script/hudson create `__git_branch`
#   fi

#   return $retval
# }

# function delete_branch {
#   local flag="-d"
#   local ci=0
#   local remote=0
#   local dir=`pwd`
#   local branches
#   branches=()

#   for option in $*; do
#     if [ $option = "--force" ]; then
#       flag="-D"
#     elif [ $option = "--ci" ]; then
#       ci=1
#     else
#       branches+=($option)
#     fi
#   done

#   for branch in $branches; do
#     git branch $flag $branch && git push origin :$branch
#     deleted=$?

#     if [ $deleted = 0 -a $ci = 1 ]; then
#       echo "Removing CI job"
#       script/jenkins delete $branch || true
#     fi
#   done
# }
