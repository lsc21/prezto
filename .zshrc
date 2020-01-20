# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi
[ -f /Users/lclotman/.travis/travis.sh ] && source /Users/lclotman/.travis/travis.sh

export PATH=/usr/local/bin:$HOME/bin:$PATH

source "$HOME/.zsh/aliases.zsh"     # Load Aliases
source "$HOME/.zsh/options.zsh"     # Load options
source "$HOME/.zsh/bindkeys.zsh"    # Load bindkeys

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# load custom executable functions
for function in ~/.zsh/functions/*; do
  source $function
done

export SAVEHIST=500000
export HISTFILE="$HOME/.zhistory"

eval `ssh-agent -s`
eval "$(direnv hook zsh)"

[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# attach to tmux session if it exists; if not, create it
tmux new-session -A -s main

if [ -f '/Users/lclotman/.google-cloud-sdk/path.zsh.inc' ]; then . '/Users/lclotman/.google-cloud-sdk/path.zsh.inc'; fi
if [ -f '/Users/lclotman/.google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/lclotman/.google-cloud-sdk/completion.zsh.inc'; fi

# ===============
# AIX Specific  TODO break this out into ~/.zsh/aix
# ===============
# --- Node Version Manager
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

export GOPATH=$HOME/Code/go

if [ -f '/home/vagrant/google-cloud-sdk/path.zsh.inc' ]; then . '/home/vagrant/google-cloud-sdk/path.zsh.inc'; fi
if [ -f '/home/vagrant/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/vagrant/google-cloud-sdk/completion.zsh.inc'; fi
