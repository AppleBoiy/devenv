
# Alias definitions
alias ll='ls -la'
alias la='ls -A'
alias l='ls -CF'
alias gs='git status'
alias gp='git pull'
alias gco='git checkout'
alias gl='git log --oneline --graph --decorate'
alias df='df -h'
alias du='du -h'
alias ..='cd ..'

# Set prompt
PS1="\[\e[1;34m\]\u@\h \[\e[1;32m\]\w\[\e[0m\]$ "

# Add custom paths
export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/bin:$PATH"

# Enable bash completion if available
if [ -f /usr/local/etc/bash_completion ]; then
    . /usr/local/etc/bash_completion
fi

# Enable brew command auto-completion
if command -v brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
    autoload -Uz compinit
    compinit
fi

# Load NVM (Node Version Manager) if available
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Set the default editor
export EDITOR='nano'

# Add functions
function mkcd() {
    mkdir -p "$1" && cd "$1"
}

function extract() {
    if [ -f "$1" ]; then
        case "$1" in
            *.tar.bz2) tar xjf "$1" ;;
            *.tar.gz)  tar xzf "$1" ;;
            *.bz2)     bunzip2 "$1" ;;
            *.rar)     unrar x "$1" ;;
            *.gz)      gunzip "$1" ;;
            *.tar)     tar xf "$1" ;;
            *.tbz2)    tar xjf "$1" ;;
            *.tgz)     tar xzf "$1" ;;
            *.zip)     unzip "$1" ;;
            *.Z)       uncompress "$1" ;;
            *.7z)      7z x "$1" ;;
            *)         echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# Load `.bashrc` in `.bash_profile`
if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi
