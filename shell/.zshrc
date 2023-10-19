PATH="/usr/local/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"

export LDFLAGS="-L/opt/homebrew/opt/postgresql@15/lib"
export CPPFLAGS="-I/opt/homebrew/opt/postgresql@15/include -I/opt/homebrew/opt/openjdk/include"
export GOPATH="$HOME/.go"
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"
export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

alias ml='multipass'

# general use
# alias ls='exa'                                                          # ls
# alias l='exa -lbF --git'                                                # list, size, type, git
# alias ll='exa -lbGF --git'                                             # long list
# alias llm='exa -lbGd --git --sort=modified'                            # long list, modified date sort
# alias la='exa -lbhHigUmuSa --time-style=long-iso --git --color-scale'  # all list
# alias lx='exa -lbhHigUmuSa@ --time-style=long-iso --git --color-scale' # all + extended list
#
# # specialty views
# alias lS='exa -1'                                                              # one column, just names
# alias lt='exa --tree --level=2'                                         # tree

# ls to exa
alias ls='exa --color=always --group-directories-first --icons'     # ls
alias ll='exa -la --icons --octal-permissions --group-directories-first'
alias l='exa -bGF --header --git --color=always --group-directories-first --icons' # long list
alias llm='exa -lbGd --header --git --sort=modified --color=always --group-directories-first --icons' # long list, modified date sort
alias la='exa --long --all --group --group-directories-first'
alias lx='exa -lbhHigUmuSa@ --time-style=long-iso --git --color-scale --color=always --group-directories-first --icons' # all + extended list

# ls to exa - modalità speciali
alias lS='exa -1 --color=always --group-directories-first --icons' # one column, just names
alias lt='exa --tree --level=2 --color=always --group-directories-first --icons'    # tree
alias l.="exa -a | grep -E '^\.'"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh


