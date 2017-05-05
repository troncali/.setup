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
# TODO: What about ZSH completion? oh-my-zsh?
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

## TODO: Identify binaries from adapted files.

###### mathias
# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2

# Install some CTF tools; see https://github.com/ctfs/write-ups.
brew install aircrack-ng
brew install bfg
brew install binutils
brew install binwalk
brew install cifer
brew install dex2jar
brew install dns2tcp
brew install fcrackzip
brew install foremost
brew install hashpump
brew install hydra
brew install john
brew install knock
brew install netpbm
brew install nmap
brew install pngcheck
brew install socat
brew install sqlmap
brew install tcpflow
brew install tcpreplay
brew install tcptrace
brew install ucspi-tcp # `tcpserver` etc.
brew install xpdf
brew install xz

# Install other useful binaries.
brew install ack
brew install dark-mode
#brew install exiv2
brew install git
brew install git-lfs
brew install imagemagick --with-webp
brew install lua
brew install lynx
brew install p7zip
brew install pigz
brew install pv
brew install rename
brew install rhino
brew install speedtest_cli
brew install ssh-copy-id
brew install testssl
brew install tree
brew install vbindiff
brew install webkit2png
brew install zopfli


#### donnemartin
brew install heroku-toolbelt
brew install libxml2
brew install libxslt
brew link libxml2 --force
brew link libxslt --force
brew install pkg-config libffi
brew install pandoc
brew install homebrew/php/php56 --with-gmp
brew install homebrew/x11/xpdf
brew install git-flow
brew install git-extras
brew install hub


###############################################################################
# Clean Up                                                                    #
###############################################################################

#brew cleanup