# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

source "$HOME/.zsh/git-flow-completion.zsh"
source "$HOME/.zsh/aliases.zsh"     # Load Aliases
source "$HOME/.zsh/options.zsh"     # Load options
source "$HOME/.zsh/bindkeys.zsh"    # Load bindkeys

# load custom executable functions
for function in ~/.zsh/functions/*; do
  source $function
done

# R B E N V
eval "$(rbenv init -)"

# S S H  A G E N T
eval `ssh-agent -s`

[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/louis/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/louis/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/louis/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/louis/google-cloud-sdk/completion.zsh.inc'; fi
