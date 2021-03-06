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

printf "\n~/.setup : macOS
===================================================
Configuring macOS with sensible defaults.\n"

# Install XCode CLT.
echo "    -> Installing Xcode Command Line Tools."
xcode-select --install

###############################################################################
# Configure Preferences                                                       #
###############################################################################

# Implement system and application preferences.
echo "    -> Configuring system and application preferences."
#./scripts/prefs.sh

###############################################################################
# Set Up ~/Code                                                               #
###############################################################################

# Specify the home-level folder where you store all your projects.
CODEDIR=~/Code

# If the folder does not exist, create it.
mkdir -p "$CODEDIR"
chmod 700 "$CODEDIR"

# Give the folder a git icon to match appearance of other home-level folders.
if [ ! -f "$CODEDIR"/Icon? ]; then
    # git clone --depth 1 git://github.com/lgarron/folderify.git "$ASSETS"/folderify --quiet
    # cd "$ASSETS"/folderify
    # python -m folderify "$ASSETS"/Git-Icon-2000x2000.png "$CODEDIR" > /dev/null
    # rm -rf "$ASSETS"/folderify
    brew install folderify > /dev/null
    folderify "$ASSETS"/Git-Icon-2000x2000.png "$CODEDIR" > /dev/null
fi

cd $DIR # Change back to run.sh directory.
