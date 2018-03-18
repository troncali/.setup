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
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
	printf "Updating Homebrew and commonly used formulae and applications.\n"
	brew update
	brew upgrade
fi

## TODO: Create a function to (1) test for existing installations; and
##		 (2) perform installations that do not exist.

###############################################################################
# Update macOS Tools                                                          #
###############################################################################

echo "    -> Update macOS Tools."

# Install GNU core utilities (macOS versions are outdated) and other GNU utils.
#     Note: '$PATH' modifications in .zshrc point to GNU utilities before macOS 
# utilities so they may be run without a 'g' prefix (sed instead of gsed). 
# Remove these paths from .zshrc if you prefer to leave macOS default utilities
# in tact and access GNU utilities with the 'g' prefix. If using a different 
# shell, be sure to update your '$PATH' accordingly.
echo "       :: GNU core and related utilities."
brew install coreutils
brew install moreutils
brew install findutils
brew install gnu-sed
brew install wget --with-iri
brew install grep
brew install screen
brew install rsync

# Install Zsh, add to the list of allowed shells, and make it the active shell.
echo "       :: Zsh."
brew install zsh
sudo bash -c 'echo /usr/local/bin/zsh >> /etc/shells'
chsh -s /usr/local/bin/zsh

# Install Vim
echo "       :: Vim."
brew install vim --with-override-system-vi

# Install OpenSSH
echo "       :: OpenSSH."
brew install openssh

# Install git
echo "       :: Git and related tools."
brew install git
brew cask install sourcetree	# Git GUI.
brew install git-flow	# High-level repository operations for Vincent Driessen's branching model.
brew install git-lfs	# Git extention for versioning large files.
brew install bfg		# Simpler, faster (but less sophisticated) alternative to git-filter-branch.
#brew install git-extras
#brew install hub		# Command line wrapper for git.

# Install Quick Look plugins
echo "       :: Quick Look plugins."
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json quicklook-csv betterzipql qlimagesize suspicious-package

# Install XQuartz
echo "       :: XQuartz."
brew cask install xquartz

###############################################################################
# Install macOS Applications                                                  #
###############################################################################

echo "    -> Install applications."

# Install 1Password
echo "       :: 1Password."  ## TODO: Lastpass?
brew cask install 1password 1password-cli

# Install Cyberduck
echo "       :: Cyberduck."
brew cask install cyberduck

# Install Dash
echo "       :: Dash."
brew cask install dash

# Install Dropbox
echo "       :: Dropbox."
brew cask install dropbox

# Install FontForge
echo "       :: FontForge."
brew cask install fontforge

# Install Chrome and DevTools
echo "       :: Google Chrome & DevTools."
brew cask install google-chrome chrome-devtools

# Install Inkscape
echo "       :: Inkscape."
brew cask install inkscape

# Install Java
echo "       :: Java."
brew cask install java

# Install Microsoft Office
## TODO: Libre/Open Office?
echo "       :: Microsoft Office."
brew cask install microsoft-office

# Install Parallels
echo "       :: Parallels."
brew cask install parallels

# Install Real VNC
## TODO: license; Other VNC server?
echo "       :: Real VNC 5.3.2."
brew cask install https://raw.githubusercontent.com/caskroom/homebrew-cask/326d6a92b0c06c9a78c347ded4e1fd7e3f7d78a5/Casks/real-vnc.rb

# Install Spark
echo "       :: Spark."
brew cask install spark

# Install Spotify
echo "       :: Spotify."
brew cask install spotify

# Install TextMate
echo "       :: TextMate."
brew cask install textmate

# Install SparkleShare
#echo "       :: SparkleShare."
#brew cask install sparkleshare

###############################################################################
# Install Miscellaneous Binaries                                              #
###############################################################################

echo "    -> Install other useful CLI tools."
brew install ack
brew install imagemagick --with-webp	# Bitmap image manipulation tool.
brew install pv 			# Tool to monitor the progress of data through a pipeline.
brew install rename 		# Tool to rename files according to modification rules.
brew install speedtest_cli 	# Command line interface for testing internet bandwith using speedtest.net
brew install tree 			# Recursive directory listing command producing indented listing of files.
brew install dark-mode		# CLI for macOS 'Dark Mode'.
#brew install exiv2 		# Utility to manage image metadata.
#brew install lua 			# Lua programming language.
#brew install lynx 			# Web browser for Unix and VMS platforms.
#brew install p7zip 		# Command line version of 7-Zip.
#brew install pigz 			# Parallel implementation of gzip.
#brew install rhino 		# Open-source implementation of JavaScript written in Java.
#brew install ssh-copy-id 	# Add a public key to a remote machine's authorized_keys file
#brew install testssl 		# TLS/SSL security testing.
#brew install vbindiff 		# Displays files in hexadecimal and ASCII, highlighting differences.
#brew install webkit2png 	# Create screenshots of webpages from the terminal.
#brew install zopfli 		# Zopfli compression algorithm
#brew install libxml2		# XML C parser and toolkit.
#brew install libxslt		# XSLT C library.
#brew link libxml2 --force
#brew link libxslt --force
#brew install pkg-config 	# Tool to help insert compiler options.
#brew install libffi		# Foreign Function Interface Library.
#brew install pandoc		# Tool to convert one markup format to another.
#brew install homebrew/php/php56 --with-gmp	# PHP 5.6

### WEB FONT TOOLS.
#brew tap bramstein/webfonttools
#brew install sfnt2woff
#brew install sfnt2woff-zopfli
#brew install woff2

### CAPTURE-THE-FLAG TOOLS: see https://github.com/ctfs/write-ups.
#brew install aircrack-ng	# Suite of tools to assess WiFi network security.
#brew install binutils
#brew install binwalk		# Tool to analyze and extract firmware images.
#brew install cifer			# Tool to automate classical cipher cracking in C.
#brew install dex2jar		# Tools to work with android .dex and java .class files.
#brew install dns2tcp		# Tools to encapsulate TCP session in DNS packets.
#brew install fcrackzip		# Tool to crack zip passwords.
#brew install foremost		# Tool to recover files based on headers, footers, and data structures.
#brew install hashpump		# Tool to exploit the hash length extension attack.
#brew install hydra			# Network logon cracker.
#brew install john			# John the Ripper password cracker.
#brew install knock			# Port-knock client.
#brew install netpbm		# Toolkit for manipulation of graphic images.
#brew install nmap			# Network Mapper, utility for network discovery and security auditing.
#brew install pngcheck		# PNG image integrity verification and statistics.
#brew install socat			# Bidirectional data transfer between independent data channels.
#brew install sqlmap		# Penetration testing tool to automate process of detecting adn exploiting SQL injection flaws.
#brew install tcpflow		# TCIP/IP packet demultiplexer.
#brew install tcpreplay		# Tools for editing and replaying captured network traffic.
#brew install tcptrace		# Tool for analysis of TCP dump files.
#brew install ucspi-tcp		# `tcpserver` etc.
#brew install xpdf			# PDF viewer and toolkit.
#brew install xz			# Data compression software.

###############################################################################
# Clean Up                                                                    #
###############################################################################

echo "    -> Clean up."

brew cleanup