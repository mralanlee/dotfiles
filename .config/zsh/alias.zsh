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
alias ls='exa'
alias j='fasd_cd -d'

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

## PROCORE
## -- US01 --
alias prdproweb='aws-ssh ssh --trekker procore --stage production --role web'
alias prdproskiq='aws-ssh ssh --trekker procore --stage production --role sidekiq'
alias prdpeqweb='aws-ssh ssh --trekker procore-events-query --stage production-us01 --role web'
alias prdfdrweb='aws-ssh ssh --trekker frontdoor --stage production --role web'

## -- US02 --
alias prdus02proweb='aws-ssh ssh --trekker procore --stage production-us02 --role web'
alias prdus02proskiq='aws-ssh ssh --trekker procore --stage production-us02 --role sidekiq'
alias prdus02peqweb='aws-ssh ssh --trekker procore-events-query --stage production-us02 --role web'
alias prdus02fdrweb='aws-ssh ssh --trekker frontdoor --stage production-us02 --role web'

## Bastion
alias basrndprd='ssh bastion.rnd.procoretech.com'
alias basstg='ssh bastion.staging.procoretech.com'
alias basprd='ssh bastion.production.procoretech.com'
alias basops='ssh bastion.ops.procoretech.com'

# AWS
alias opsir='aws-okta exec ops --'
alias pctir='aws-okta exec pct --'
alias prdir='aws-okta exec prd --'
alias sbxir='aws-okta exec sbx --'
alias stgir='aws-okta exec stg --'

# kill vpn
alias kvpn='launchctl unload /Library/LaunchAgents/com.paloaltonetworks.gp.pangp*'
