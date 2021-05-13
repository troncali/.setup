#!/usr/bin/env bash

zshurl="https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh"

# Add Zsh to the list of allowed shells and make it the active shell.
if ! fgrep -q '/usr/local/bin/zsh' /etc/shells; then
    echo '/usr/local/bin/zsh' | sudo tee -a /etc/shells;
    chsh -s /usr/local/bin/zsh;
fi

# Install Oh My Zsh.
echo "    -> Installing Oh My Zsh."
sh -c "$(curl -fsSL ${zshurl})" > /dev/null
