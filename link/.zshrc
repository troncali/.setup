# Fix to permit group permissions for autocomplete
ZSH_DISABLE_COMPFIX=true

# Paths to oh-my-zsh installation and customization folder.
export ZSH=$HOME/.oh-my-zsh
ZSH_CUSTOM=$HOME/.setup-assets/custom-zsh/

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

# Remove extra space from end of right prompt.
ZLE_RPROMPT_INDENT=0

###############################################################################
# Aliases                                                                     #
###############################################################################

# Adjust terminal size when starting and killing GNU screen.
alias screen="printf '\e[8;54;280t' && screen"
alias 3size="printf '\e[8;54;280t'"
alias 1size="printf '\e[8;53;90t'"

# Use 'fuck' for thefuck.
eval $(thefuck --alias)
