alias pro='cd ~/projects'

# aliases for git (though I should be using git aliases)
alias gco='git checkout'
alias gcof='git for-each-ref --format="%(refname:short)" refs/heads | fzf | xargs git checkout'
alias gc='git commit'
alias ga='git add'
alias gaa='git add .'
alias gb='git branch'
alias gst='git status'

# open up configs in vim
alias vimc='nvim $VIMPATH'
alias zshf='nvim $ZSHFUNCTIONS'
alias zsha='nvim $ZSHALIAS'
alias zshp='nvim $ZSHPATH'
alias alac='nvim $ALARC'
alias tmuxc='nvim $TMUXC'

# source config files
alias sz='source $ZSHRC'
alias sv='source $VIMPATH'
alias st='source $TMUXC'

# some replacements for existing bins
alias cat='bat'
alias ls='eza --icons'
alias ll='eza -l -g --icons'

# kubernetes
alias k='kubectl'
alias kg='kubectl get'
alias kgpo='kubectl get pod'
alias krm='kubectl delete'
alias krmf='kubectl delete -f'
alias kx='kubectx'
alias kns='kubens'

## kubernetes watch pods
alias kwp='watch -n 1 kubectl get pods'

alias envact='source $(pipenv --venv)/bin/activate'

# utility
# quick find for files
alias qf='find . -type f | fzf'

alias VPN_OFF='launchctl unload /Library/LaunchAgents/com.paloaltonetworks.gp.pangp*'
alias VPN_ON='launchctl load /Library/LaunchAgents/com.paloaltonetworks.gp.pangp*'
