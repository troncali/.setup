# Paths to oh-my-zsh installation and customization folder.
export ZSH=$HOME/.oh-my-zsh
ZSH_CUSTOM=$HOME/.setup-assets/custom-zsh/

# Revise Path to include software and manuals installed by Homebrew.
export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin"
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

###############################################################################
# ZSH Configuration                                                           #
###############################################################################

# Load plugins from ~/.oh-my-zsh/plugins/*.
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
)

# Set theme to load from ~/.oh-my-zsh/themes/ or custom theme path.
ZSH_THEME="troncali"
source $ZSH/oh-my-zsh.sh

###############################################################################
# Aliases                                                                     #
###############################################################################

# Adjust terminal size when starting and killing GNU screen.
alias screen="printf '\e[8;54;280t' && screen"
alias 3size="printf '\e[8;54;280t'"
alias 1size="printf '\e[8;53;90t'"

# Toggle invisible files.
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall\
        Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall\
        Finder /System/Library/CoreServices/Finder.app'

# Use 'fuck' for thefuck.
eval $(thefuck --alias)
