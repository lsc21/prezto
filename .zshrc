# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# P A T H
export    PATH=.git/safe/../../bin:$HOME/beam/bin:$HOME/.rbenv/bin:$HOME/.local/bin:$HOME/.bin:/usr/local/heroku/bin:$PATH

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
FEATURES1=(f1 f2 f3 f4 f5 f6 f7 f8 f9 f10)
FEATURES2=(f11 f12 f13 f14 f15 f16 f17 f18 f19 f20)
alias     lf1="ssh-multi $FEATURES1"
alias     lf2="ssh-multi $FEATURES2"
alias     add="ssh-add ~/.ssh/prism"
alias     mina="mina -v"

export PATH=LOCAL_PATH:$PATH

# R B E N V
eval "$(rbenv init -)"

# S S H  A G E N T
eval `ssh-agent -s`

# O P T I O N S
export EDITOR=vim

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

# Who doesn't want home and end to work?
bindkey '\e[1~' beginning-of-line
bindkey '\e[4~' end-of-line

# Incremental search is elite!
bindkey -M vicmd "/" history-incremental-search-backward
bindkey -M vicmd "?" history-incremental-search-forward

# Search based on what you typed in already
bindkey -M vicmd "//" history-beginning-search-backward
bindkey -M vicmd "??" history-beginning-search-forward

bindkey "\eOP" run-help

# oh wow!  This is killer...  try it!
bindkey -M vicmd "q" push-line

# it's like, space AND completion.  Gnarlbot.
bindkey -M viins ' ' magic-space
