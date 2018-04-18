#!/usr/bin/env bash

###############################################################################
# CREDITS & LICENSE ###########################################################
###############################################################################
# Adapted from
# - https://github.com/donnemartin/dev-setup.git (.dots)
# With inspiration from
# - https://github.com/mathiasbynens/dotfiles.git
# - https://github.com/cowboy/dotfiles.git
#
# Distributed under the MIT license.
###############################################################################

printf "\n
troncali/.setup
===================================================
Github Credits: donnemartin, mathiasbynens, cowboy.
Distributed under the MIT License.\n"

# Resolve the source directory from which this script is running.
# Credit: http://stackoverflow.com/questions/59895/getting-the-source-
# directory-of-a-bash-script-from-within
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until file is no longer a symlink
    DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
    SOURCE="$(readlink "$SOURCE")"
    # If $SOURCE is relative symlink, resolve to path where file is located.
    [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE"
done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
cd $DIR #set DIR as the current working directory

###############################################################################
# Brew Functions                                                              #
###############################################################################

# Is Homebrew installed?
function test_brew() {
    brewurl="https://raw.githubusercontent.com/Homebrew/install/master/install"

    if test ! $(which brew); then
        echo "    -> Installing Homebrew and commonly used formulae and"\
            "applications."
        ruby -e "$(curl -fsSL ${brewurl})" > /dev/null
    else
        echo "    -> Updating Homebrew and commonly used formulae and"\
            "applications."
        brew update > /dev/null
        brew upgrade > /dev/null
    fi
}

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
    #     NOTE: Space characters (" ") are important in the array format.
    # Always use a space character after 'name' and before 'description':
    # ARRAY=( "name options : description" )
    # When using tabs, a space character should still be placed where
    # each "_" appears: ARRAY=( "name_	options	 :_description" )
    for formula in "${pantry[@]}" ; do
        key=${formula%%:*}
        name=${key%% *}
        description=${formula#*: }
        options=${key#* }

        # Skip formula if installed.
        if [[ $(brew `[[ $commands == cask* ]] && echo "cask"` ls --versions \
        "$name" 2> /dev/null) ]]; then
            continue

        # Otherwise, install the formula.
        else
            # If no description after ":" in array, print nothing.
            [[ ! -z "$description" ]] && echo "       :: $description."
            brew $commands $name $options > /dev/null
        fi
    done
}

###############################################################################
# .setup Scope Functions                                                      #
###############################################################################

prompt1="Please specify the scope of your desired setup (all, init, brew,"
prompt1="${prompt1} macOS, pydata, aws, data, web, vnc, zsh): "

# If the scope of the intended setup is not specified, ask for it.
if [ -z "$@" ]; then
    printf "\n\n"
    read -p "${prompt1}"
    set -- $REPLY
fi

function dotSetup() {
    # Gain administrative access; update 'sudo' timestamp until script
    # terminates to prevent multiple prompts.
    sudo -v
    while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; \
    done 2>/dev/null &

    # Abort if no scope.
    if [[ -z "$1" ]]; then
        echo "No scope specified.  Please restart the script and select scope."
        exit 1
    fi

    # Run each script within the specified scope.
    shopt -s nocasematch # Ignore letter case for scope matching.
    for ARG in "$@"
    do
        if [[ $ARG == "init" ]] || [[ $ARG == "all" ]]; then
            # Copy and link user's custom files to ~/.
            . ./scripts/init.sh
        fi
        if [[ $ARG == "brew" ]] || [[ $ARG == "all" ]]; then
            # Install Homebrew along with common formulae and apps.
            . ./scripts/brew.sh # . command passes through $DIR and functions.
        fi
        if [[ $ARG == "macOS" ]] || [[ $ARG == "all" ]]; then
            # Set macOS and application preferences.
            . ./scripts/macOS.sh
        fi
        if [[ $ARG == "python" ]] || [[ $ARG == "all" ]]; then
            # Set up Python data development environment.
            . ./scripts/python.sh
        fi
        if [[ $ARG == "aws" ]] || [[ $ARG == "all" ]]; then
            # Set up AWS development environment.
            . ./scripts/aws.sh
        fi
        if [[ $ARG == "data" ]] || [[ $ARG == "all" ]]; then
            # Configure databases and related tools.
            . ./scripts/data.sh
        fi
        if [[ $ARG == "web" ]] || [[ $ARG == "all" ]]; then
            # Configure JavaScript web development environment.
            . ./scripts/web.sh
        fi
        if [[ $ARG == "vnc" ]] || [[ $ARG == "all" ]]; then
            # Build TigerVNC and configure.
            . ./scripts/vnc.sh
        fi
        if [[ $ARG == "zsh" ]] || [[ $ARG == "all" ]]; then
            # Install Oh-My-Zsh and configure.
            . ./scripts/zsh.sh
        fi
    done
    shopt -u nocasematch # Restore bash to default case matching.

    printf "\n\ntroncali/.setup : Complete.\n"
    printf "===================================================\n"
    printf "Please restart your computer.\n\n"
}

###############################################################################
# Run                                                                     #
###############################################################################

prompt2="This script will overwrite existing files in your home directory."
prompt2="${prompt2}  Only existing files replaced by those in the 'copy' and"
prompt2="${prompt2} 'link' directories (.vimrc, .zshrc, etc.) will be backed"
prompt2="${prompt2} up into the root of this repository."

# Confirm file overwrite in user's home directory before starting setup.
printf "\n\n${prompt2}\n\n"
read -p "Continue? (y/n) " -n 1;
printf "\n\n"

# When confirmed, start the setup.
if [[ $REPLY =~ ^[Yy]$ ]]; then
    dotSetup $@
fi;

unset dotSetup;
