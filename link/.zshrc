# Path to oh-my-zsh installation.
export ZSH=/Users/troncali/.oh-my-zsh

# Revise Path to include software and manuals installed by Homebrew
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export MANPATH="/usr/local/man:$MANPATH"

# Paths to GNU utilities.
### TODO: VERIFY PATHS
export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
export PATH="$(brew --prefix findutils)/libexec/gnubin:$PATH"
export PATH="$(brew --prefix gnu-sed)/libexec/gnubin:$PATH"
export PATH="$(brew --prefix grep)/libexec/gnubin:$PATH"

# Paths to GNU manpages
### TODO: VERIFY PATHS
export MANPATH="$(brew --prefix coreutils)/libexec/gnubin:$MANPATH"
export MANPATH="$(brew --prefix findutils)/libexec/gnubin:$MANPATH"
export MANPATH="$(brew --prefix gnu-sed)/libexec/gnubin:$MANPATH"
export MANPATH="$(brew --prefix grep)/libexec/gnubin:$MANPATH"

# Set name of the theme to load from ~/.oh-my-zsh/themes/
ZSH_THEME="robbyrussell"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Load plugins from ~/.oh-my-zsh/plugins/*.
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
)

#source $ZSH/oh-my-zsh.sh
source ~/.shell_prompt.sh

### ALIASES

alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'