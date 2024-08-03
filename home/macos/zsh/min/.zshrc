eval "$(direnv hook zsh)"

source /opt/homebrew/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

alias ..='cd ..'

bindkey              '^I'         menu-complete
bindkey "$terminfo[kcbt]" reverse-menu-complete

source <(fzf --zsh)

###
# ADD GIT INFO TO PROMPT
###
parse_git_branch() {
  local branch=""
  branch=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
  local git_status=$(git status --porcelain 2>/dev/null)
  local color=green
  if echo "$git_status" | grep -q "^ M"; then
    color=yellow
    branch="${branch}*"
  fi
  if echo "$git_status" | grep -qE "^ A|^\?\?"; then
    color=blue
    branch="${branch}+"
  fi
  if echo "$git_status" | grep -q "^ D"; then
    color=red
    branch="${branch}-"
  fi

  if [[ -n "$branch" ]]; then
    branch=[%F{${color}}${branch}%F{reset}]
  fi
  echo "$branch"
}
update_prompt() {
    PS1="%n %1~$(parse_git_branch) %# "
}
precmd_functions+=(update_prompt)
update_prompt

export Z=~/.zshrc

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

function fd() {
  preview="git diff $@ --color=always -- {-1}"
  git diff $@ --name-only | fzf -m --ansi --preview $preview
}

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export PATH="/Users/iccy/.config/git-fuzzy/bin:$PATH"
