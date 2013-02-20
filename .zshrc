ZSH=$HOME/.oh-my-zsh
ZSH_THEME="blinks"
plugins=(git vi-mode rake ruby rails3 rvm)
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

source		$ZSH/oh-my-zsh.sh
unsetopt	correct_all # Disable command auto-correct
export		PATH=/opt/local/bin:$PATH
alias			less="less -R"
alias			ack="ack-grep"
