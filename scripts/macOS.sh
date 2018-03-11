#!/usr/bin/env bash

#####################################################################
# CREDITS & LICENSE #################################################
#####################################################################
# Adapted from 
# - https://github.com/mathiasbynens/dotfiles.git (.macos)
# - https://github.com/donnemartin/dev-setup.git (osxprep.sh, osx.sh)
#
# Distributed under the MIT license.
#####################################################################

printf "\ntroncali/.setup : macOS
===================================================
Configuring macOS with sensible defaults.\n"

# Install XCode CLT.
echo "    -> Installing Xcode Command Line Tools."
#xcode-select --install

# Install Oh My Zsh.
echo "    -> Installing Oh My Zsh."
#sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Implement system and application preferences.
echo "    -> Configuring system and application preferences."
#./scripts/prefs.sh