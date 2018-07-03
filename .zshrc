# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# E N V  V A R S
#set -a    # export attribute shall be set for each variable to which an assignment is performed;
PATH=.git/safe/../../bin:$HOME/.rbenv/shims:$HOME/.rbenv/bin:$HOME/.local/bin:$HOME/.bin:/usr/local/lib64/heroku/bin:$PATH

# A L I A S E S
alias     less="less -R"
alias     ack='ack-grep'
alias     travis='RAILS_ENV=test DO_NOT_ADD_FIPS=true bundle exec rake --trace travis:test'
alias     gmail='LOCAL_CONFIG=gmail /usr/bin/mutt'
alias     dstat='dstat -tafn --debug --noheaders'
alias     mtl='multitail'
alias     giti='git'
alias     gti='git'

alias     lp='ssh-multi deployer@{pa,md,nyc,co,sc}.prism.locall'
alias     lb='ssh-multi deployer@{pa,md,nyc,co,sc}.betaprism.local'
alias     lt='ssh-multi deployer@{pa,md,nyc,co,sc}-training.betaprism.local'
alias     add="ssh-add ~/.ssh/prism"
alias     mina="mina -v"

# Download and Extract Archives with WGET
alias     wxz='f() { wget $1 -O - | tar -xz};f'
alias     wxj='f() { wget $1 -O - | tar -xj};f'
alias     wx='f() { wget $1 -O - | tar -x};f'

# Infrastructure
alias     t='terraform'
alias     gc="gcloud"
alias     kbDevicted="kbg po -a | grep Evicted | awk '{print $1}' | xargs kubectl delete pod"
alias     kns"kubectl config set-context $(kubectl config current-context) --namespace=$1"

# R B E N V
eval "$(rbenv init -)"

# S S H  A G E N T
eval `ssh-agent -s`

# why would you type 'cd dir' if you could just type 'dir'?
setopt AUTO_CD

# This makes cd=pushd
setopt AUTO_PUSHD

# If we have a glob this will expand it
setopt GLOB_COMPLETE
setopt PUSHD_MINUS

# this will ignore multiple directories for the stack.  Useful?  I dunno.
setopt PUSHD_IGNORE_DUPS

# If I could disable Ctrl-s completely I would!
setopt NO_FLOW_CONTROL

# Keep echo "station" > station from clobbering station
setopt NO_CLOBBER

# Case insensitive globbing
setopt NO_CASE_GLOB

# Be Reasonable!
setopt NUMERIC_GLOB_SORT

# I don't know why I never set this before.
setopt EXTENDED_GLOB

# Awesome arrays, (that is, frew${cool}frew has frew surrounding all the variables, not just first and last
setopt RC_EXPAND_PARAM

bindkey -v

# Who doesn't want home and end to work?
bindkey '\e[1~' beginning-of-line
bindkey '\e[4~' end-of-line

# Incremental search is elite!
bindkey -M vicmd "/" history-incremental-search-backward
bindkey -M vicmd "?" history-incremental-search-forward

# Search based on what you typed in already
# bindkey -M vicmd "//" history-beginning-search-backward
# bindkey -M vicmd "??" history-beginning-search-forward
#
bindkey "^R"      history-incremental-search-backward  # ctrl-r
bindkey "^F"      history-incremental-search-forward   # ctrl-f
bindkey "^N"      history-search-forward               # ctrl-n
bindkey "^P"      history-search-backward              # ctrl-p
bindkey 'jj'      vi-cmd-mode                          # jj maps to vi cmd mode

bindkey "\eOP" run-help

# oh wow!  This is killer...  try it!
bindkey -M vicmd "q" push-line

# it's like, space AND completion.  Gnarlbot.
bindkey -M viins ' ' magic-space

export NVM_DIR="/home/ubuntu/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/louis/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/louis/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/louis/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/louis/google-cloud-sdk/completion.zsh.inc'; fi
