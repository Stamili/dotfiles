# Source system profile if not already loaded.
[ -z "$PROFILEREAD" ] && [ -f /etc/profile ] && . /etc/profile

# Personal environment variables.
export EDITOR=nano
export VISUAL="$EDITOR"
export PAGER=less

# Change umask to make directory sharing easier.
umask 0002

# Ignore duplicates in command history.
export HISTCONTROL=ignoreboth
# Set history size to infinite.
export HISTSIZE= HISTFILESIZE=

# Add personal bin directories to PATH.
[ -d "$HOME/bin" ] && PATH="$HOME/bin:$PATH"
[ -d "$HOME/.local/bin" ] && PATH="$HOME/.local/bin:$PATH"
export PATH

# Source .bashrc for interactive login shells.
if [ -f "$HOME/.bashrc" ] && [ -t 0 ]; then
    . "$HOME/.bashrc"
fi
