# -----------------------
# Distribution-dependant
# -----------------------

alias r='sudo zypper ref --force'
alias u='sudo zypper dup'
i() {
    sudo zypper install "$@"
    if [ $? -ne 0 ]; then
        echo "Package not found. Searching..."
        zypper se -s "$@"
    fi
}

# ----------------------
# Global
# ----------------------

export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"
export PS1

shopt -s autocd

alias l.='ls -d .* --color=auto'
alias ll='ls -l --color=auto'
alias ls='ls -hN --color=auto --group-directories-first'
alias man='MANWIDTH=90 man'
alias e='fwupdmgr refresh && fwupdmgr upgrade'
alias f='flatpak'
alias diff='diff --color=auto'
alias mkd='mkdir -pv'
alias rmd='rm -r'
alias rm='rm -vI'
alias ..='cd ..'
alias ...='cd ../..'
alias -- -='cd -'
alias grep='grep --color=auto'
alias ip='ip --color=auto'
alias config='/usr/bin/git --git-dir="$HOME/git_things/dotfiles.git" --work-tree="$HOME"'
