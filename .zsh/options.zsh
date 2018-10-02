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
