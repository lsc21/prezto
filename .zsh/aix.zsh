alias deploy-staging="(cd $HOME/Code/infrastructure-staging && git checkout master && zsh ./bin/scripts/update-values.sh STAGING values.yaml) && (cd $HOME/Code/charts && git checkout master &&  haixstaging upgrade --install trade-platform-v2 . --values=$HOME/Code/infrastructure-staging/values.yaml)"

## Microk8s
# alias kaixmicro="kubectl --kubeconfig=$HOME/Code/microk8s/kubeconfig"
# alias haixmicro="KUBECONFIG=$HOME/Code/microk8s/kubeconfig HELM_HOME=$HOME/helm helm"

## EKS
alias kaixkops="kubectl --kubeconfig=$HOME/Code/alb.aix.clotman.name/kubeconfig"
alias haixkops="KUBECONFIG=$HOME/Code/alb.aix.clotman.name/kubeconfig HELM_HOME=$HOME/helm helm"

## Event Service
alias kaixevents="kubectl --kubeconfig=$HOME/Code/aix-event-service-uat/kubeconfig"
alias haixevents="KUBECONFIG=$HOME/Code/aix-event-service-uat/kubeconfig HELM_HOME=$HOME/helm helm"

## Staging
alias kaixstaging="kubectl --kubeconfig=$HOME/Code/infrastructure-staging/kubeconfig"
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
