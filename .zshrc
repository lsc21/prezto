ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="blinks"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)

plugins=(git vi-mode rake ruby rails screen ssh-agent)

export    EDITOR=vim
setopt    extendedhistory

source    $ZSH/oh-my-zsh.sh
unsetopt  correct_all # Disable command auto-correct
export    PATH=.git/safe/../../bin:$HOME/beam/bin:$HOME/.rbenv/bin:$HOME/.local/bin:$HOME/.bin:$PATH
export    RAILS_ENV=development
alias     less="less -R"
alias     ack='ack-grep'
alias     travis='RAILS_ENV=test DO_NOT_ADD_FIPS=true bundle exec rake --trace travis:test'
alias     gmail='LOCAL_CONFIG=gmail /usr/bin/mutt'
alias     dstat='dstat -tafn --debug --noheaders'
alias     mtl='multitail'
alias     giti='git'
alias     gti='git'

unsetopt nomatch # for rake task args

zstyle :omz:plugins:ssh-agent agent-forwarding on
zstyle :omz:plugins:ssh-agent identities github prism
zstyle :omz:plugins:ssh-agent lifetime 12h

eval "$(rbenv init -)"

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/base16-default.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL
