alias kaixstaging='kubectl --kubeconfig=/Users/lclotman/Code/infrastructure-staging/kubeconfig'
alias haixstaging='KUBECONFIG=/Users/lclotman/Code/infrastructure-staging/kubeconfig HELM_HOME=/Users/lclotman/helm helm'

alias haixprod='KUBECONFIG=/Users/lclotman/Code/infrastructure-production/kubeconfig HELM_HOME=/Users/lclotman/.helm helm'
alias haixuat='KUBECONFIG=/Users/lclotman/Code/infrastructure-uat/kubeconfig HELM_HOME=/Users/lclotman/.helm helm'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
