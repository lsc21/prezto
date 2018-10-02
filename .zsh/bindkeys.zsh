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
