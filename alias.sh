alias ll='ls -lh'
alias la='ll -a'
alias sc="bundle exec rails console"
alias t='touch tmp/restart.txt'
alias grc="git repack && git gc --aggressive"
alias gl="git for-each-ref --sort=-committerdate refs/heads/ --format='%(refname:short) %(committerdate:short) %(authorname)'"
alias rsp="rsync -a --progress --stats --human-readable"
alias v="vagrant"
alias s="ssh"

alias pps='ps uww -p'
alias gps='ps auxww| grep -i'

alias reload="source ~/.zsh.d/load.sh"
alias subl="/Applications/Sublime\ Text\ 3.app/Contents/SharedSupport/bin/subl"

function e {
  local directory=$1

  if [ -z "$directory" ]; then
    subl .
  elif [ -f "$directory/.project.sublime-project" ]; then
    subl $directory/.project.sublime-project
  else
    subl $directory
  fi
}
