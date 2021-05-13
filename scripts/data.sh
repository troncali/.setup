#!/usr/bin/env bash

###############################################################################
# CREDITS & LICENSE ###########################################################
###############################################################################
# Adapted from
# - https://github.com/donnemartin/dev-setup.git (web.sh)
#
# Distributed under the MIT license.
###############################################################################

printf "\n~/.setup : Databases
===================================================
Configuring databases and related tools.\n"

# Make sure Homebrew is installed and updated.
test_brew

###############################################################################
# Data Stores & Applications                                                  #
###############################################################################

# DATABASES=( "mysql      : MySQL"
#             "postgresql : PostgresSQL"
#             "mongodb    : MongoDB"
# )

DATA_APPS=( "dbeaver-community : DBeaver Community Edition"
            "mongodb-compass   : MongoDB Compass"
            "sequel-pro        : Sequel Pro"
)

# echo "    -> Install database systems."
# brew_it "install" DATABASES[@]

echo "    -> Install data applications."
brew_it "install --cask" DATA_APPS[@]

###############################################################################
# Clean Up                                                                    #
###############################################################################

echo "    -> Clean up."
brew cleanup > /dev/null
