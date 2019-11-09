# git pull upstream on branch
gpu() {
  BRANCH=$(git branch | grep \* | cut -d ' ' -f2)
  git push --set-upstream origin $BRANCH
}

# zendesk specific
zupload() {
  grunt zendesk-dist
  node scripts/uploadDisted.js
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
