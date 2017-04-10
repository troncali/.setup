#!/usr/bin/env bash

###########################################
# CREDITS & LICENSE #######################
###########################################
# Adapted from 
# - https://github.com/donnemartin/dev-setup.git (.dots)
# With inspiration from
# - https://github.com/mathiasbynens/dotfiles.git
# - https://github.com/cowboy/dotfiles.git
#
# Licensed under the MIT license.
###########################################

printf "\n
troncali/.setup
===================================================
Github Credits: donnemartin, mathiasbynens, cowboy.
Distributed under the MIT License.\n"

# If the scope of the intended setup is not specified, ask for it.
if [ -z "$@" ]; then
	printf "\n\n"
	read -p "Please specify the scope of your desired setup (all, brew, macOS, pydata, aws, datastores, web): "
	set -- $REPLY
fi

# Define dotSetup() to execute scripts based on setup scope.
function dotSetup() {
    # Gain administrative access; update 'sudo' timestamp until script terminates to prevent multiple prompts.
    sudo -v
    while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

    # Run each script within the specified scope.
	shopt -s nocasematch # Ignore letter case for scope matching.
    for ARG in "$@"
    do
        if [[ $ARG == "brew" ]] || [[ $ARG == "all" ]]; then
            echo "Installing Homebrew along with some common formulae and apps."
            ./brew.sh
        fi
        if [[ $ARG == "macOS" ]] || [[ $ARG == "all" ]]; then
            echo "Updating macOS and installing Xcode command line tools"
            ./osxprep.sh
            echo "Setting sensible macOS defaults."
            ./osx.sh
        fi
        if [[ $ARG == "pydata" ]] || [[ $ARG == "all" ]]; then
            echo "Setting up Python data development environment."
            ./pydata.sh
        fi
        if [[ $ARG == "aws" ]] || [[ $ARG == "all" ]]; then
            echo "Setting up AWS development environment."
            ./aws.sh
        fi
        if [[ $ARG == "datastores" ]] || [[ $ARG == "all" ]]; then
            echo "Setting up data stores."
            ./datastores.sh
        fi
        if [[ $ARG == "web" ]] || [[ $ARG == "all" ]]; then
            echo "Setting up JavaScript web development environment."
            ./web.sh
        fi
    done
	shopt -u nocasematch # Restore bash to default case matching.

    printf "\n\ntroncali/.setup Complete.\n===================================================\nPlease restart your computer.\n\n"
}

# Confirm that files will be overwritten in user's home directory before starting setup.
printf "\n\nThis script will overwrite existing files in your home directory, including:\n.vimrc\n\n"
read -p "Continue? (y/n) " -n 1;
printf "\n\n"

# When confirmed, start the setup.
if [[ $REPLY =~ ^[Yy]$ ]]; then
    dotSetup $@
fi;

unset dotSetup;
