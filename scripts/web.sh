#!/usr/bin/env bash

#####################################################################
# CREDITS & LICENSE #################################################
#####################################################################
# Adapted from 
# - https://github.com/donnemartin/dev-setup.git (web.sh)
#
# Distributed under the MIT license.
#####################################################################

printf "\ntroncali/.setup : Web Tools
===================================================
Configuring JavaScript development environment.\n"

###############################################################################
# Brew Functions                                                              #
###############################################################################

# Is Homebrew installed?
if test ! $(which brew); then
    printf "    -> Installing Homebrew and commonly used formulae and applications.\n"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" > /dev/null
else
    printf "    -> Updating Homebrew and commonly used formulae and applications.\n"
    brew update > /dev/null
    brew upgrade > /dev/null
fi

# Process each installation array.  See 'brew.sh' for explanations.
function brew_it() {
    local commands=${1}
    local pantry=("${!2}")
    local options=${3}
	
    if [ "${pantry[0]}" == "" ]; then 
        return
    fi
		
    for formula in "${pantry[@]}" ; do
        key=${formula%%:*}
        name=${key%% *}
        description=${formula#*: }
        options=${key#* }

        if [[ $(brew `[[ $commands == cask* ]] && echo "cask"` ls --versions "$name" 2> /dev/null) ]]; then
            continue
        else
            [[ ! -z "$description" ]] && echo "       :: $description."
            #brew $commands $name $options > /dev/null
        fi		
    done
}

###############################################################################
# Web Tools and Applications                                                  #
###############################################################################

WEB_APPS=( "node                          : Node"
#          "homebrew/php/php56 --with-gmp : PHP 5.6"
#          "heroku-toolbelt               : Heroku Toolbelt"
           "chrome-devtools               : Google DevTools"
)
	
echo "    -> Install useful web development tools."	
brew_it "install" WEB_APPS[@]
#heroku update > /dev/null

###############################################################################
# Node Packages				                                                  #
###############################################################################

# Process each installation array.
function npm_it() {
    local pkgs=("${!1}")
	
    if [ "${pkgs[0]}" == "" ]; then 
        return
    fi
		
    for pkg in "${pkgs[@]}" ; do
        name=${pkg%%:*}
        description=${pkg#*: }

        if [[ $(npm list --depth 1 -g "$name" > /dev/null 2>&1) ]]; then
            continue
        else
            [[ ! -z "$description" ]] && echo "       :: $description."
            #npm install -g $name > /dev/null
        fi		
    done
}

# TODO: Add other node packages.
NPM_PKGS=( "grunt-cli : Grunt"
)

echo "    -> Install node packages."	
npm_it NPM_PKGS[@]

###############################################################################
# Clean Up					                                                  #
###############################################################################

echo "    -> Clean up."
brew cleanup