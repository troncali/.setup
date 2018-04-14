# Paths to oh-my-zsh installation and customization folder.
export ZSH=/Users/troncali/.oh-my-zsh
ZSH_CUSTOM=$HOME/.setup-assets/custom-zsh/

# Revise Path to include software and manuals installed by Homebrew.
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export MANPATH="/usr/local/man:$MANPATH"

# Paths to GNU utilities.
### TODO: VERIFY PATHS; gls has no color when mapped as default ls.
#export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
#export PATH="$(brew --prefix findutils)/libexec/gnubin:$PATH"
#export PATH="$(brew --prefix gnu-sed)/libexec/gnubin:$PATH"
#export PATH="$(brew --prefix grep)/libexec/gnubin:$PATH"

# Paths to GNU manpages
### TODO: VERIFY PATHS
#export MANPATH="$(brew --prefix coreutils)/libexec/gnubin:$MANPATH"
#export MANPATH="$(brew --prefix findutils)/libexec/gnubin:$MANPATH"
#export MANPATH="$(brew --prefix gnu-sed)/libexec/gnubin:$MANPATH"
#export MANPATH="$(brew --prefix grep)/libexec/gnubin:$MANPATH"

# Load plugins from ~/.oh-my-zsh/plugins/*.
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
)

# Set theme name to load from ~/.oh-my-zsh/themes/ or custom theme path, then load.
ZSH_THEME="troncali"
source $ZSH/oh-my-zsh.sh

### ALIASES

alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'
eval $(thefuck --alias)