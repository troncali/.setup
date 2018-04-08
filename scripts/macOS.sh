#!/usr/bin/env bash

#####################################################################
# CREDITS & LICENSE #################################################
#####################################################################
# Adapted from 
# - https://github.com/mathiasbynens/dotfiles.git (.macos, brew.sh)
# - https://github.com/donnemartin/dev-setup.git (osxprep.sh, osx.sh)
#
# Distributed under the MIT license.
#####################################################################

printf "\ntroncali/.setup : macOS
===================================================
Configuring macOS with sensible defaults.\n"

# Install XCode CLT.
echo "    -> Installing Xcode Command Line Tools."
xcode-select --install

###############################################################################
# Install Oh My Zsh                                                           #
###############################################################################

# Add Zsh to the list of allowed shells and make it the active shell.
if ! fgrep -q '/usr/local/bin/zsh' /etc/shells; then
    echo '/usr/local/bin/zsh' | sudo tee -a /etc/shells;
    chsh -s /usr/local/bin/zsh;
fi

# Install Oh My Zsh.
echo "    -> Installing Oh My Zsh."
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" > /dev/null

###############################################################################
# Configure Preferences                                                       #
###############################################################################

# Implement system and application preferences.
echo "    -> Configuring system and application preferences."
./scripts/prefs.sh

###############################################################################
# Set Up ~/Code                                                               #
###############################################################################

# Specify the home-level folder where you store all your projects.
CODEDIR=~/Code

# If the folder does not exist, create it.
mkdir -p "$CODEDIR"

# Give the folder a git icon to match appearance of other home-level folders.
if [ ! -f "$CODEDIR"/Icon? ]; then
	git clone git://github.com/lgarron/folderify.git "$ASSETS"/folderify --quiet
    cd "$ASSETS"/folderify
    python -m folderify "$ASSETS"/Git-Icon-2000x2000.png "$CODEDIR" > /dev/null
    rm -rf "$ASSETS"/folderify
fi

cd $DIR # Change back to run.sh directory.