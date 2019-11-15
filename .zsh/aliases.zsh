# A L I A S E S
alias     less="less -R"
#alias     travis='RAILS_ENV=test DO_NOT_ADD_FIPS=true bundle exec rake --trace travis:test'
alias     git="hub"
alias     t="travis"
alias     epoch='date -j -f "%a %b %d %T %Z %Y" "`date`" "+%s"'

# Download and Extract Archives with WGET
alias     wxz='f() { wget $1 -O - | tar -xz};f'
alias     wxj='f() { wget $1 -O - | tar -xj};f'
alias     wx='f() { wget $1 -O - | tar -x};f'

# Infrastructure
alias     kbDevicted="kbg po -a | grep Evicted | awk '{print $1}' | xargs kubectl delete pod"
alias     gb="git branch | fzf-tmux -d 15"
alias     gdns="gcloud dns record-sets list -z feature"

# Debugging
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"

# AIX DevOps
alias kaixstaging='kubectl --kubeconfig=/Users/lclotman/Code/infrastructure-staging/kubeconfig'
alias haixstaging='KUBECONFIG=/Users/lclotman/Code/infrastructure-staging/kubeconfig HELM_HOME=/Users/lclotman/helm helm'
alias haixprod='KUBECONFIG=/Users/lclotman/Code/infrastructure-production/kubeconfig HELM_HOME=/Users/lclotman/.helm helm'
alias haixuat='KUBECONFIG=/Users/lclotman/Code/infrastructure-uat/kubeconfig HELM_HOME=/Users/lclotman/.helm helm'
