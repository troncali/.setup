#!/usr/bin/env bash

###############################################################################
# CREDITS & LICENSE ###########################################################
###############################################################################
# Adapted from
# - https://github.com/donnemartin/dev-setup.git (web.sh)
#
# Distributed under the MIT license.
###############################################################################

printf "\ntroncali/.setup : Web Tools
===================================================
Configuring JavaScript development environment.\n"

# Make sure Homebrew is installed and updated.
test_brew

###############################################################################
# Web Tools and Applications                                                  #
###############################################################################

WEB_TECH=( "node                          : Node"
           "yarn                          : Yarn"
#          "homebrew/php/php56 --with-gmp : PHP 5.6"
#          "heroku-toolbelt               : Heroku Toolbelt"
)

WEB_APPS=( "chrome-devtools               : Google DevTools" )

echo "    -> Install useful web development tools."
brew_it "install" WEB_TECH[@]
brew_it "cask install" WEB_APPS[@]

###############################################################################
# Node Packages                                                               #
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
            npm install -g $name > /dev/null
        fi
    done
}

NPM_PKGS=( "grunt-cli : Grunt"
)

echo "    -> Install node packages."
npm_it NPM_PKGS[@]

###############################################################################
# Clean Up                                                                    #
###############################################################################

echo "    -> Clean up."
brew cleanup > /dev/null
