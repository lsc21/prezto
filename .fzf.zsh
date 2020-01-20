# Setup fzf
# ---------
if [[ ! "$PATH" == */home/vagrant/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/vagrant/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/vagrant/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "$HOME/.fzf/shell/key-bindings.zsh"
