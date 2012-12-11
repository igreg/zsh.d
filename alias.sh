alias ll='ls -lh'
alias la='ll -a'
alias sc="bundle exec rails console"
alias t='touch tmp/restart.txt'
alias grc="git repack && git gc --aggressive"
alias gl="git for-each-ref --sort=-committerdate refs/heads/ --format='%(refname:short) %(committerdate:short) %(authorname)'"
alias rsp="rsync -a --progress --stats --human-readable"

if which git 2>&1 > /dev/null; then
  alias gk="gitx"
  alias gg="gitx --commit"
fi

alias reload="source ~/.zsh.d/load.sh"
alias subl="/Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin/subl --new-window"

function e {
  local directory=$1

  if [ -z "$directory" ]; then
    subl .
  elif [ "$directory" = "conf" ]; then
    subl ~/.zsh.d
  elif [ -f "$directory/.project.sublime-project" ]; then
    subl $directory/.project.sublime-project
  else
    subl $directory
  fi
}

function v {
  pushd ~puppet3 > /dev/null
  vagrant $*
  popd > /dev/null
}
