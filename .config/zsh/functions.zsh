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

# backwards
## Fuzzy Finder(FZF) settings - https://github.com/junegunn/fzf
export FZF_DEFAULT_OPTS='-x --height 40% --layout=reverse --border'
export FZF_CTRL_T_OPTS='--select-1 --exit-0'
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"
export FZF_ALT_C_OPTS="--select-1 --exit-0 --preview 'tree -C {} | head -200'"
export FZF_TMUX=1
export FZF_TMUX_OPTS='-p 100%,40% -y P'
# Use fd (https://github.com/sharkdp/fd) instead of the default find
# command for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}
# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}
# (EXPERIMENTAL) Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift
  case "$command" in
    cd)           fzf "$@" --preview 'tree -C {} | head -200' ;;
    export|unset) fzf "$@" --preview "eval 'echo \$'{}" ;;
    ssh)          fzf "$@" --preview 'dig {}' ;;
    *)            fzf "$@" ;;
  esac
}

fzf-open() {
  local files
  IFS=$'\n' files=($(find $1 -type f | fzf-tmux))
  [[ -n "$files" ]] && code "${files[@]}"
}

fzf-awscli-examples() {
  local files
  IFS=$'\n' files=($(find /usr/local/share/awscli/examples -type f | fzf-tmux))
  [[ -n "$files" ]] && code "${files[@]}"
}

fzf-bma-functions() {
  local files
  IFS=$'\n' files=($(find ${HOME}/.bash-my-aws/lib -type f | fzf-tmux))
  [[ -n "$files" ]] && code "${files[@]}"
}

export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"
