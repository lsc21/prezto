export PATH=/usr/local/bin:/snap/bin:$HOME/bin:$HOME/.rbenv/bin:$GOPATH/bin:$HOME/.krew/bin:$PATH

[ -f "$HOME/.zprezto/init.zsh" ]                    && . "$HOME/.zprezto/init.zsh"
[ -f "$HOME/.travis/travis.sh" ]                    && . "$HOME/.travis/travis.sh"
[ -f "$HOME/.zsh/aliases.zsh" ]                     && . "$HOME/.zsh/aliases.zsh"
[ -f "$HOME/.zsh/options.zsh" ]                     && . "$HOME/.zsh/options.zsh"
[ -f "$HOME/.zsh/bindkeys.zsh" ]                    && . "$HOME/.zsh/bindkeys.zsh"
[ -f "$HOME/.fzf.zsh" ]                             && . "$HOME/.fzf.zsh"
[ -s "$NVM_DIR/nvm.sh" ]                            && . "$NVM_DIR/nvm.sh"

[ -f "$HOME/.zsh/aix.zsh" ]                         && . "$HOME/.zsh/aix.zsh"
[ -f "$HOME/.zsh/aix-secrets.zsh" ]                 && . "$HOME/.zsh/aix-secrets.zsh"

[ -f "$HOME/.google-cloud-sdk/path.zsh.inc" ]       && . "$HOME/.google-cloud-sdk/path.zsh.inc"
[ -f "$HOME/.google-cloud-sdk/completion.zsh.inc" ] && . "$HOME/.google-cloud-sdk/completion.zsh.inc"

for function in ~/.zsh/functions/*; do
  source $function
done

export SAVEHIST=500000
export HISTFILE="$HOME/.zhistory"
export GPG_TTY=$(tty)
export GOPATH=$HOME/Code/go

eval `ssh-agent -s`
eval "$(direnv hook zsh)"
fpath=($fpath ~/.zsh/completion)
