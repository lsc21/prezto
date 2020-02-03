alias haixstaging='KUBECONFIG=/Users/lclotman/Code/infrastructure-staging/kubeconfig HELM_HOME=/Users/lclotman/helm helm'
alias haixuat='KUBECONFIG=/Users/lclotman/Code/infrastructure-uat/kubeconfig HELM_HOME=/Users/lclotman/helm helm'
alias haixprod='KUBECONFIG=/Users/lclotman/Code/infrastructure-production/kubeconfig HELM_HOME=/Users/lclotman/.helm helm'

[ -f "$HOME/.travis/travis.sh" ] && . "$HOME/.travis/travis.sh"

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
