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

# Make sure Homebrew is installed and updated.
test_brew

###############################################################################
# Data Stores & Applications                                                  #
###############################################################################

DATABASES=( "mysql      : MySQL"
            "postgresql : PostgresSQL"
)
	
DATA_APPS=( "sequel-pro       : Sequel Pro"
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
brew cleanup > /dev/null