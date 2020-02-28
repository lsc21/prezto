setopt AUTO_CD                    # why would you type 'cd dir' if you could just type 'dir'?
setopt AUTO_PUSHD                 # This makes cd=pushd
setopt GLOB_COMPLETE              # Cycle through glob matches
setopt PUSHD_MINUS                # Swaps the meanings of '+' and '-' when numerically specifying stack directories
setopt PUSHD_IGNORE_DUPS          # Don't push multiple copies of the same directory onto the directory stack.
setopt NO_FLOW_CONTROL            # If I could disable Ctrl-s completely I would!
setopt CLOBBER                    # Allows '>' redirection to truncate existing files, and '>>' to create files. 
setopt NO_CASE_GLOB               # Case insensitive globbing
setopt NUMERIC_GLOB_SORT          # Sort numeric filenames numerically rather than lexicographically.
setopt EXTENDED_GLOB              # Treat the '#', '~' and '^' characters as part of patterns for filename generation
setopt RC_EXPAND_PARAM            # Read the docs about array expansion to understand this.
setopt INTERACTIVE_COMMENTS       # Allow comments even in interactive shells.
setopt VI                         # Has the equivalent effect of 'bindkey -v'.
