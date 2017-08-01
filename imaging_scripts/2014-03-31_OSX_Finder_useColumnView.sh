#!/bin/bash

#
# Name of Script: useColumnView
# Description: Use column view in all Finder windows by default
# Attribution: First boot script
# Created by Mike Wilkerson
# Date created: 31 Mar 2014
# Last modified: 31 Mar 2014
# Revision 0.1
#  

# Configure Finder to use Column View

defaults write /System/Library/User\ Template/English.lproj/Library/Preferences/com.apple.finder "AlwaysOpenWindowsInColumnView" -bool true

exit 0