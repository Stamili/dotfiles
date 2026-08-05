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

# Add personal bin directory to PATH.
if [[ ":$PATH:" != *":$HOME/.local/bin:"* ]]; then
    PATH="$HOME/.local/bin:$PATH"
fi
# Add all subdirectories of ~/.local/bin to PATH.
if [ -d "$HOME/.local/bin" ]; then
    for dir in "$HOME/.local/bin"/*/; do
        dir="${dir%/}"
        if [ -d "$dir" ] && [[ ":$PATH:" != *":$dir:"* ]]; then
            PATH="$dir:$PATH"
        fi
    done
fi
export PATH

# Source .bashrc for interactive login shells.
if [ -f "$HOME/.bashrc" ] && [ -t 0 ]; then
    . "$HOME/.bashrc"
fi
