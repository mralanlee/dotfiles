# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

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
# Ansible Vault
export ANSIBLE_VAULT_PASSWORD_FILE=$HOME/.ansible_vault.txt

## Language Specific
# GO
export GO111MODULE=auto
export GOPROXY="direct"
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="hyperzsh"

# fasd
eval "$(fasd --init auto)"

plugins=(
  git,
  zsh-autosuggestions,
  terraform,
  kubectl,
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
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
fi

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Terraform
function tf_prompt_info() {
  # dont show 'default' workspace in home dir
  [[ "$PWD" == ~ ]] && return
  # check if in terraform dir
  if [ -d .terraform ]; then
    workspace=$(terraform workspace show 2> /dev/null) || return
    echo "[${workspace}]"
  fi
}

PROMPT='%F{green}%* $(tf_prompt_info) '$PROMPT

# Syntax Highlighting
source $HOME/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# added by travis gem
[ -f $HOME/.travis/travis.sh ] && source $HOME/.travis/travis.sh

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C $HOME/go/bin/terraform terraform

# fnm
export PATH=$HOME/.fnm:$PATH
eval `fnm env`

export YVM_DIR=/usr/local/opt/yvm
[ -r $YVM_DIR/yvm.sh ] && . $YVM_DIR/yvm.sh


export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
