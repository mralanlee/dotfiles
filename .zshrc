# tmux auto start
export ZSH_TMUX_AUTOSTART=true

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH="$PATH:$HOME/.local/bin"
export PATH=$PATH:/opt/homebrew/bin
# Modular conifg setup
export ZSH_CUSTOM=$HOME/.config/zsh
export ZSHFUNCTIONS=$HOME/.config/zsh/functions.zsh
export ZSHALIAS=$HOME/.config/zsh/alias.zsh
export ZSHPATH=$HOME/.config/zsh/path.zsh
export ZSHENV=$ZSH_CUSTOM/.zshenv

# source $ZSH_CUSTOM/.zshenv
source $ZSHPATH
source $ZSHFUNCTIONS
source $ZSHALIAS
source $ZSHENV
# Ansible Vault
export ANSIBLE_VAULT_PASSWORD_FILE=$HOME/.ansible_vault.txt

## Language Specific
# GO
export GO111MODULE=on
export GOPROXY="direct"
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export EDITOR='nvim'

# ZSH_THEME=""
# rip hyperzsh

#
eval "$(zoxide init zsh)"

plugins=(
  docker
  docker-compose
  terraform
  deno
  fzf
)

source $ZSH/oh-my-zsh.sh
source ~/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Kubernetes
if [ $commands[kubectl] ]; then
  source <(kubectl completion zsh)
  # complete -F __start_kubectl k
fi

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Terraform
# function tf_prompt_info() {
#   # dont show 'default' workspace in home dir
#   [[ "$PWD" == ~ ]] && return
#   # check if in terraform dir if [ -d .terraform ]; then workspace=$(terraform workspace show 2> /dev/null) || return echo "[${workspace}]" fi
# }

# PROMPT='%F{green}%* $(tf_prompt_info) '$PROMPT

# Syntax Highlighting
# source $HOME/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# added by travis gem
# [ -f $HOME/.travis/travis.sh ] && source $HOME/.travis/travis.sh

autoload -U +X bashcompinit && bashcompinit
# complete -o nospace -C /usr/local/bin/terraform terraform

export YVM_DIR=/usr/local/opt/yvm
[ -r $YVM_DIR/yvm.sh ] && . $YVM_DIR/yvm.sh


export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# source "/usr/local/opt/kube-ps1/share/kube-ps1.sh"
# PS1='$(kube_ps1)'$PS1

# pure
# fpath+=$HOME/.zsh/pure
# autoload -U promptinit; promptinit

# zstyle ':prompt:pure:path' color blue
# zstyle ':prompt:pure:git:branch' color magenta
# zstyle ':prompt:pure:prompt' color magneta
# zstyle ':prompt:pure:prompt:*' color cyan
# prompt pure
fpath=(~/.zsh $fpath)
autoload -Uz compinit
compinit -u

[ -f ${HOME}/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(starship init zsh)"
# complete -o nospace -C /usr/local/Cellar/tfenv/1.0.2/versions/0.11.13/terraform terraform

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/alan/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/alan/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/alan/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/alan/google-cloud-sdk/completion.zsh.inc'; fi

export PKG_CONFIG_PATH="/usr/local/opt/libpq/lib/pkgconfig"
export PATH="/usr/local/opt/libpq/bin:$PATH"

# export ASDF_DIR="$(brew --prefix asdf)"
# source $ASDF_DIR/asdf.sh
# . $HOME/.asdf/asdf.sh
. /opt/homebrew/opt/asdf/libexec/asdf.sh
# source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
