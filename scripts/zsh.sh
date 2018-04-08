#!/usr/bin/env bash

#####################################################################
# CREDITS & LICENSE #################################################
#####################################################################
# Distributed under the MIT license.
#####################################################################

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