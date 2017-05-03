#!/usr/bin/env bash

#####################################################################
# CREDITS & LICENSE #################################################
#####################################################################
# Adapted from 
# - https://github.com/mathiasbynens/dotfiles.git (brew.sh)
# - https://github.com/donnemartin/dev-setup.git (brew.sh)
#
# Distributed under the MIT license.
#####################################################################

printf "\ntroncali/.setup : Homebrew
===================================================
"

# Is Homebrew installed?
if test ! $(which brew); then
	printf "Installing Homebrew and commonly used formulae and applications.\n"
	#ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
	printf "Updating Homebrew and commonly used formulae and applications.\n"
	#brew update
	#brew upgrade
fi

###############################################################################
# Update macOS Tools                                                          #
###############################################################################

# Install GNU core utilities (macOS versions are outdated) and other GNU utils.
#     Note: '$PATH' modifications in .zshrc point to GNU utilities before macOS 
# utilities so they may be run without a 'g' prefix (sed instead of gsed). 
# Remove these paths from .zshrc if you prefer to leave macOS default utilities
# in tact and access GNU utilities with the 'g' prefix. If using a different 
# shell, be sure to update your '$PATH' accordingly.
echo "    -> GNU core and related utilities."
#brew install coreutils
#brew install moreutils
#brew install findutils
#brew install gnu-sed
#brew install wget --with-iri
#brew install grep
#brew install screen
#brew install rsync

# Install Zsh, add to the list of allowed shells, and make it the active shell.
echo "    -> Zsh."
#brew install zsh
#sudo bash -c 'echo /usr/local/bin/zsh >> /etc/shells'
#chsh -s /usr/local/bin/zsh

# Install Vim
echo "    -> Vim."
#brew install vim --with-override-system-vi

# Install OpenSSH
echo "    -> OpenSSH."
#brew install openssh

# Install git
echo "    -> Git."
#brew install git

# Install Quick Look plugins
echo "    -> Quick Look plugins."
#brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json quicklook-csv betterzipql qlimagesize suspicious-package

# CLI control over macOS 'Dark Mode' 
echo "    -> CLI for macOS 'Dark Mode'."
#brew install dark-mode


###############################################################################
# Install macOS Applications                                                  #
###############################################################################

## TODO: Describe applications being installed;
##		 Search for other applications to include ('brew cask search')

#brew cask install xquartz
#brew cask install java
#brew cask install google-chrome
#brew cask install dropbox

###############################################################################
# Install Miscellaneous Binaries                                              #
###############################################################################

## TODO: Describe applications being installed;
##		 Search for other applications to include ('brew cask search')

#brew cask install xquartz
#brew cask install java
#brew cask install google-chrome
#brew cask install dropbox

###############################################################################
# Clean Up                                                                    #
###############################################################################

#brew cleanup