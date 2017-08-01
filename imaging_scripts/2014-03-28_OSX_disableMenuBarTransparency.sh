#!/bin/bash

#
# Name of Script: disableMenuBarTransparency
# Description: Menu bar: disable transparency
# Attribution: Casper First Run
# Created by Mike Wilkerson
# Date created: 28 Mar 2014
# Last modified: 28 Mar 2014
# Revision 0.1
#  

# Menu bar: disable transparency
defaults write NSGlobalDomain AppleEnableMenuBarTransparency -bool false

exit 0