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

###############################################################################
# Brew Functions                                                              #
###############################################################################

# Is Homebrew installed?
if test ! $(which brew); then
	printf "Installing Homebrew and commonly used formulae and applications.\n"
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" > /dev/null
else
	printf "Updating Homebrew and commonly used formulae and applications.\n"
	brew update > /dev/null
	brew upgrade > /dev/null
fi

# Process each installation array.
function brew_it() {
	local commands=${1}
	local pantry=("${!2}")
	local options=${3}
	
	# If there are no formulae, stop.
	if [ "${pantry[0]}" == "" ]; then 
		return
	fi
		
	# Parse the array of formulae.
	### NOTE: Space characters (" ") are important in the array format. Always
	###		  use a space character after 'name' and before 'description'.
	###		  ARRAY=( "name options : description" )
	###
	###		  When using tabs, a space character should still be placed where
	###		  each "_" appears below:
	###		  ARRAY=( "name_	options :_	description" )
	for formula in "${pantry[@]}" ; do
	    key=${formula%%:*}
	    name=${key%% *}
	    description=${formula#*: }
		options=${key#* }
	    
		# Skip formula if installed.
		## TODO: Is there a faster test?
		if [[ $(brew `[[ $commands == cask* ]] && echo "cask"` ls --versions "$name" 2> /dev/null) ]]; then
			continue
						
		# Otherwise, install the formula.
		else
			
			# If no description after ":" in array, print nothing.
			[[ ! -z "$description" ]] && echo "       :: $description."
			
			#brew $commands $name $options > /dev/null
		fi		
	done
}

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
GNU_TOOLS=(	"coreutils 	: GNU core and related utilities"
			"moreutils 	: "
			"findutils 	: "
			"gnu-sed 	: "
			"grep 		: "
			"wget 		: "
			"screen 	: "
			"rsync 		: " 
)		

MAC_TOOLS=( "zsh 							: Zsh"
			"vim --with-override-system-vi 	: Vim"
			"openssh 						: OpenSSH" 
)
	
GIT_TOOLS=(	"git 		: Git and related tools"
			"git-flow 	: "	# High-level repository operations for Vincent Driessen's branching model.
			"git-lfs 	: "	# Git extention for versioning large files.
			"bfg 		: "	# Simpler, faster (but less sophisticated) alternative to git-filter-branch.
#			"git-extras : " 
#			"hub 		: "	# Command line wrapper for git.
)

QL_PLUGS=(	"qlcolorcode 		: Quick Look plugins"
			"qlstephen 			: "
			"qlmarkdown 		: "
			"quicklook-json 	: "
			"quicklook-csv 		: "
			"betterzipql 		: "
			"qlimagesize 		: "
			"suspicious-package : "
)

brew_it "install" GNU_TOOLS[@]
brew_it "install" MAC_TOOLS[@]
brew_it "install" GIT_TOOLS[@]
brew_it "cask install" QL_PLUGS[@]

###############################################################################
# Install macOS Applications                                                  #
###############################################################################

## TODO: Lastpass?  Libre/Open Office?  Other VNC Server / license?

echo "    -> Install applications."

MAC_APPS=(	"1password 			: 1Password"
			"1password-cli 		: "
			"cyberduck 			: Cyberduck"
			"dash 				: Dash"
			"dropbox 			: Dropbox"
			"fontforge 			: FontForge"
			"google-chrome 		: Google Chrome & DevTools"
			"chrome-devtools 	: "
			"inkscape 			: Inkscape"
			"java 				: Java"
#			"microsoft-office 	: Microsoft Office"
#			"parallels 			: Parallels"
			"sourcetree 		: Sourcetree"
			"spark 				: Spark"
#			"sparkleshare 		: SparkleShare"
			"spotify 			: Spotify"
			"textmate 			: TextMate"
			"xquartz 			: XQuartz"
)

brew_it "cask install" MAC_APPS[@]

# Install Real VNC 5.3.2
echo "       :: Real VNC 5.3.2."
#brew cask install https://raw.githubusercontent.com/caskroom/homebrew-cask/326d6a92b0c06c9a78c347ded4e1fd7e3f7d78a5/Casks/real-vnc.rb

###############################################################################
# Install Miscellaneous Binaries                                              #
###############################################################################

echo "    -> Install other useful CLI tools."

CLI_TOOLS=(	"ack 						: "
			"imagemagick --with-webp	: " # Bitmap image manipulation tool.
			"pv 						: " # Tool to monitor the progress of data through a pipeline.
			"rename 					: " # Tool to rename files according to modification rules.
			"speedtest_cli 				: " # CLI for testing internet bandwith using speedtest.net.
			"tree 						: " # Recursive directory listing command with indented listing.
			"dark-mode 					: " # CLI for macOS 'Dark Mode'.
			
			## TODO: convert these into the array format.
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
)
	
#brew tap bramstein/webfonttools
WEB_FONT_TOOLS=(	""
					## TODO: convert these into the array format.
#					#brew install sfnt2woff
#					#brew install sfnt2woff-zopfli
#					#brew install woff2
)
	
# Capture-the-Flag Tools: see https://github.com/ctfs/write-ups.
CTF_TOOLS=(	""
			## TODO: convert these into the array format.
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
)

brew_it "install" CLI_TOOLS[@]
#brew_it "install" WEB_FONT_TOOLS[@]
#brew_it "install" CTF_TOOLS[@]

###############################################################################
# Clean Up                                                                    #
###############################################################################

echo "    -> Clean up."

brew cleanup