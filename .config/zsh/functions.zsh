# git pull upstream on branch
function gpu {
  BRANCH="$(git branch | grep \* | cut -d ' ' -f2)"
  git push --set-upstream origin $BRANCH
}

# port kill
pk() {
  PORT=$1
  lsof -ti:$PORT | xargs kill
}

# cd with python env activate
function cd {
  builtin cd "$@"

  if [[ -e "./venv/bin/activate" ]]; then
      source ./venv/bin/activate
  fi
}

# open zshrc in multiple windows via neovim split
function zshc {
  nvim -O4 $ZSHRC $ZSHALIAS $ZSHFUNCTIONS $ZSHENV
}
