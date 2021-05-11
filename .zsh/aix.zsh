sops-diff() {
  # ideally used as a pre-commit hook
  # must pass in the encrypted file as an arg

  # Generate two random filenames
  FILENAME_1=/tmp/$(cat /dev/urandom | tr -dc '0-9a-zA-Z' | head -c20)
  FILENAME_2=/tmp/$(cat /dev/urandom | tr -dc '0-9a-zA-Z' | head -c20)

  # store the decrypted version of the file from mster and your current branch in the temporary locations
  AWS_PROFILE=$AWS_PROFILE git show $(git rev-parse --abbrev-ref HEAD):$1 | sops -d /dev/stdin | base64 -d > $FILENAME_1
  AWS_PROFILE=$AWS_PROFILE git show master:$1 | sops -d /dev/stdin | base64 -d > $FILENAME_2

  # diff the files then delete them
  diff $FILENAME_1 $FILENAME_2 && rm -f $FILENAME_1 $FILENAME_2
}

## Microk8s
# alias kaixmicro="kubectl --kubeconfig=$HOME/Code/microk8s/kubeconfig"
# alias haixmicro="KUBECONFIG=$HOME/Code/microk8s/kubeconfig HELM_HOME=$HOME/helm helm"

## Git
alias delete-merged-branches="git for-each-ref --format='%(if:equals=[gone])%(upstream:track)%(then)%(refname:short)%(end)' refs/heads | xargs -Ibranch_to_delete git branch -D branch_to_delete"

## EKS
alias kaixkops="kubectl --kubeconfig=$HOME/Code/alb.aix.clotman.name/kubeconfig"
alias haixkops="KUBECONFIG=$HOME/Code/alb.aix.clotman.name/kubeconfig HELM_HOME=$HOME/helm helm"

## Event Service
alias kaixevents="kubectl --kubeconfig=$HOME/Code/aix-event-service-uat/kubeconfig"
alias haixevents="KUBECONFIG=$HOME/Code/aix-event-service-uat/kubeconfig HELM_HOME=$HOME/helm helm"

## Staging
alias kaixstaging="kubectl-1.18.14 --kubeconfig=$HOME/Code/infrastructure-staging/kubeconfig"
alias haixstaging="KUBECONFIG=$HOME/Code/infrastructure-staging/kubeconfig HELM_HOME=$HOME/helm helm"
alias staging-certs='kaixstaging annotate ingress/sign-service kubernetes.io/ingress.class- && kaixstaging annotate ingress/sign-service kubernetes.io/tls-acme- && kaixstaging annotate ingress/sign-service kubernetes.io/ingress.class=nginx && kaixstaging annotate ingress/sign-service kubernetes.io/tls-acme="true"'

## UAT
alias kaixuat="kubectl --kubeconfig=$HOME/Code/infrastructure-uat/kubeconfig"
alias haixuat="KUBECONFIG=$HOME/Code/infrastructure-uat/kubeconfig HELM_HOME=$HOME/helm helm"

# PROD
alias kaixprod="kubectl --kubeconfig=$HOME/Code/infrastructure-production/kubeconfig"
alias haixprod="KUBECONFIG=$HOME/Code/infrastructure-production/kubeconfig HELM_HOME=$HOME/.helm helm"

# SERVICES
alias check-investors="http 'https://health:$HEALTH_API_PASSWORD@health-api.aixplatform.com/health?service=investors-service'"
alias check-documents="http 'https://health:$HEALTH_API_PASSWORD@health-api.aixplatform.com/health?service=documents-service'"
alias check-dst="http 'https://health:$HEALTH_API_PASSWORD@health-api.aixplatform.com/health?service=dst-service'"
alias check-funds="http 'https://health:$HEALTH_API_PASSWORD@health-api.aixplatform.com/health?service=funds-service'"
alias check-notification="http 'https://health:$HEALTH_API_PASSWORD@health-api.aixplatform.com/health?service=notification-service'"
alias check-orders="http 'https://health:$HEALTH_API_PASSWORD@health-api.aixplatform.com/health?service=orders-service'"
alias check-organizations="http 'https://health:$HEALTH_API_PASSWORD@health-api.aixplatform.com/health?service=organizations-service'"
alias check-permissions="http 'https://health:$HEALTH_API_PASSWORD@health-api.aixplatform.com/health?service=permissions-service'"
alias check-sign="http 'https://health:$HEALTH_API_PASSWORD@health-api.aixplatform.com/health?service=sign-service'"
alias check-box="http 'https://health:$HEALTH_API_PASSWORD@health-api.aixplatform.com/health?service=box-service'"

# Kill all running containers.
alias dockerkillall='docker kill $(docker ps -q)'
# Delete all stopped containers.
alias dockercleanc='printf "\n>>> Deleting stopped containers\n\n" && docker rm $(docker ps -a -q)'
# Delete all untagged images.
alias dockercleani='printf "\n>>> Deleting untagged images\n\n" && docker rmi $(docker images -q -f dangling=true)'
# Delete all stopped containers and untagged images.
alias dockerclean='dockercleanc || true && dockercleani'
alias dockerexplode='docker rmi $(docker images -a -q) --force'

# CIRCLE CI
alias circle-process="rm -f circle-process.yml && circleci config process .circleci/config.yml > circle_process.yml"
alias circle-job="circleci local execute -c circle_process.yml --job"


[ -f "$HOME/.travis/travis.sh" ] && . "$HOME/.travis/travis.sh"

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"

# galen completion 
#
export PATH=$HOME/.rbenv/versions/2.7.0/bin:$PATH
