#!/bin/bash

#
# Name of Script: turn off Finder sounds
# Description: Sets user template to turn off Finder Sounds
# Attribution: http://mths.be/osx
# Created by Mike Wilkerson
# Date created: 08 Apr 2014
# Last modified: 08 Apr 2014
# Revision 0.1
#  

# Sets user template to turn off Finder Sounds
for USER_TEMPLATE in "/System/Library/User Template"/*
do
	defaults write "${USER_TEMPLATE}"/Library/Preferences/com.apple.finder FinderSounds -bool false
done

exit 0