# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi
[ -f /Users/lclotman/.travis/travis.sh ] && source /Users/lclotman/.travis/travis.sh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH=$HOME/.rbenv/versions/2.6.5/bin:/usr/local/bin:/usr/local/opt:$PATH

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

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/louis/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/louis/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/louis/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/louis/google-cloud-sdk/completion.zsh.inc'; fi

# attach to tmux session if it exists; if not, create it
tmux new-session -A -s main
