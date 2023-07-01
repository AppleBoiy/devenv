#################################################################################################################################
#                                                          Instant Prompt Configuration                                         #
#################################################################################################################################

# This section sets up the instant prompt for powerlevel10k.

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#################################################################################################################################
#                                                             Environment Variables                                             #
#################################################################################################################################

# Set up the environment variables for various tools and utilities.

# Set up PATH environment variable
export PATH=$HOME/bin:/usr/local/bin:/opt/homebrew/opt/sqlite/bin:$PATH

# Set up BAT_CONFIG_PATH for 'bat' syntax highlighting tool
export BAT_CONFIG_PATH="$HOME/.config/bat/bat.conf"

# Set up MANPATH for manual pages
export MANPATH=/usr/share/man

# Set up LDFLAGS for specifying library search paths
export LDFLAGS="-L/opt/homebrew/opt/zlib/lib"

# Set up language and locale
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Set up package configuration path for pkg-config
export PKG_CONFIG_PATH="/opt/homebrew/opt/zlib/lib/pkgconfig"

# Set up CPPFLAGS for specifying C/C++ compiler flags
export CPPFLAGS="-I/opt/homebrew/opt/openjdk/include -I/opt/homebrew/opt/zlib/include"

# Set up JAVA_HOME
export JAVA_HOME=/usr/bin/java

#################################################################################################################################
#                                                           Zsh Configuration                                                   #
#################################################################################################################################

# Configure Zsh with Oh My Zsh and Powerlevel10k theme.

# Set up ZSH configuration directory
export ZSH="$HOME/.oh-my-zsh"

# Add brew site-functions directory to fpath
fpath+=("$(brew --prefix)/share/zsh/site-functions")

# Add OpenJDK bin directory to PATH
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

# Set the ZSH theme to powerlevel10k
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set up plugins for Oh My Zsh
plugins=(git zsh-syntax-highlighting fast-syntax-highlighting zsh-autocomplete zsh-aliases-exa forgit zsh-autosuggestions)

# Source Oh My Zsh
source $ZSH/oh-my-zsh.sh


#################################################################################################################################
#                                                         Fuzzy Finder (FZF)                                                    #
#################################################################################################################################

# Configure FZF options and key bindings.

# Set up FZF (Fuzzy Finder) default options
export FZF_DEFAULT_OPTS="--height 100% --preview 'file {}' --preview-window=up:50%:wrap"

# Set up FZF options for Ctrl+T (fuzzy file browsing)
export FZF_CTRL_T_OPTS="
  --preview 'if [ -f {} ]; then bat --style=numbers --color=always {} 2>/dev/null || cat {}; elif [ -d {} ]; then tree -C {} | less -R; fi'
  --preview-window=up:50%:wrap"

# Set up FZF options for Ctrl+R (fuzzy history searching)
export FZF_CTRL_R_OPTS="
  --preview 'echo {}' --preview-window=up:3:hidden:wrap
  --bind 'ctrl-/:toggle-preview'
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
  --color header:italic
  --header 'Press CTRL-Y to copy command into clipboard'"


#################################################################################################################################
#                                                         Forgit (Git + FZF)                                                    #
#################################################################################################################################

# Configure Forgit options.

# Set up FORGIT (Git commands with fuzzy finder) options
export FORGIT_FZF_DEFAULT_OPTS="
--exact
--border
--cycle
--reverse
--height '80%'
"


#################################################################################################################################
#                                                         pyenv Configuration                                                   #
#################################################################################################################################

# Set up pyenv environment variables
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

# Initialize pyenv
eval "$(pyenv init -)"
eval "$(pyenv init --path)"

# Initialize pyenv-virtualenv if available
if which pyenv-virtualenv-init > /dev/null; then
  eval "$(pyenv virtualenv-init -)"
fi

#################################################################################################################################
#                                                        Miniconda (conda)                                                      #
#################################################################################################################################

# Set up Miniconda (conda) if available.

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

#################################################################################################################################
#                                                  Node Version Manager (NVM)                                                   #
#################################################################################################################################

# Set up NVM_DIR for nvm (Node Version Manager)
export NVM_DIR="$HOME/.nvm"

# Source nvm.sh script
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"

# Source nvm bash completion script
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"

# Load nvmrc file if present and switch Node versions accordingly
autoload -U add-zsh-hook
load-nvmrc() {
  local nvmrc_path
  nvmrc_path="$(nvm_find_nvmrc)"
  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version
    nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")
    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install  # Install Node version from nvmrc file if not already installed
    elif [ "$nvmrc_node_version" != "$(nvm version)" ]; then
      nvm use  # Switch to Node version from nvmrc file if different from the current version
    fi
  elif [ -n "$(PWD=$OLDPWD nvm_find_nvmrc)" ] && [ "$(nvm version)" != "$(nvm version default)" ]; then
    nvm use default  # Switch to default Node version if nvmrc file not found
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

#################################################################################################################################
#                                                    Go Programming Language                                                    #
#################################################################################################################################

# Set up Go programming language environment.

# Add Go bin directory to PATH
export PATH="$HOME/sdk/go1.18.2/bin:$PATH"

#################################################################################################################################
#                                                Miscellaneous Configurations                                                   #
#################################################################################################################################

# Enable biometric unlock (assuming the variable is correctly set)
$OP_BIOMETRIC_UNLOCK_ENABLED=true

# Set 'exa' alias to show icons
alias exa="exa --icons"

alias nls="ls --long --ignore-glob='node_modules' --header --icons"

# Remove duplicates from PATH
typeset -U PATH

# Source fzf.zsh script if available
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Source p10k.zsh if it exists
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
