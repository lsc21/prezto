# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi
[ -f /Users/lclotman/.travis/travis.sh ] && source /Users/lclotman/.travis/travis.sh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH=/usr/local/bin:/usr/local/opt:$HOME/.google-cloud-sdk/bin/gcloud:$PATH

source "$HOME/.zsh/aliases.zsh"     # Load Aliases
source "$HOME/.zsh/options.zsh"     # Load options
source "$HOME/.zsh/bindkeys.zsh"    # Load bindkeys
source "/usr/local/opt/fzf/shell/key-bindings.zsh"

# load custom executable functions
for function in ~/.zsh/functions/*; do
  source $function
done

eval "$(rbenv init -)"
eval `ssh-agent -s`
eval "$(direnv hook zsh)"

[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

# attach to tmux session if it exists; if not, create it
tmux new-session -A -s main

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/lclotman/.google-cloud-sdk/path.zsh.inc' ]; then . '/Users/lclotman/.google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/lclotman/.google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/lclotman/.google-cloud-sdk/completion.zsh.inc'; fi

# ===============
# AIX Specific  TODO break this out into ~/.zsh/aix
# ===============
# --- Node Version Manager
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

export GOPATH=$HOME/Code/go
