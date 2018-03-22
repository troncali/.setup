#!/usr/bin/env bash

#####################################################################
# CREDITS & LICENSE #################################################
#####################################################################
# Adapted from 
# - https://github.com/donnemartin/dev-setup.git (web.sh)
#
# Distributed under the MIT license.
#####################################################################

printf "\ntroncali/.setup : Databases
===================================================
Configuring databases and related tools.\n"

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
# Data Stores & Applications                                                  #
###############################################################################

DATABASES=(	"mysql      : MySQL"
			"postgresql : PostgresSQL"
)
	
DATA_APPS=(	"sequel-pro       : Sequel Pro"
#           "mysqlworkbench   : MySQL Workbench"
            "valentina-studio : Valentina Studio"
)
	
echo "    -> Install database systems."	
brew_it "install" DATABASES[@]

echo "    -> Install data applications."	
brew_it "cask install" DATA_APPS[@]

###############################################################################
# Clean Up					                                                  #
###############################################################################

echo "    -> Clean up."
brew cleanup