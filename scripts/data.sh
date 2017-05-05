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

# Is Homebrew installed?
if test ! $(which brew); then
	printf "    -> Installing Homebrew.\n"
	#ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
	printf "    -> Updating Homebrew.\n"
	#brew update
	#brew upgrade
fi