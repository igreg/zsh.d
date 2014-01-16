# Enable shims and autocompletion
if which rbenv > /dev/null; then
  eval "$(rbenv init -)"
else
  echo RBENV seems to be missing
  echo
  echo Use the following commands to bootstrap your environment:
  echo
  echo brew install rbenv ruby-build
  echo rbenv install 1.9.3-p...
  echo rbenv global 1.9.3-p...
fi
