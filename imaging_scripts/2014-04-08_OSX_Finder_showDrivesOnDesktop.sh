#!/bin/bash

#
# Name of Script: showDrivesAndServersOnDesktop
# Description: Sets user template to show all drives and servers on the Desktop/
# Attribution: http://mths.be/osx
# Created by Mike Wilkerson
# Date created: 01 Apr 2014
# Last modified: 08 Apr 2014
# Revision 0.1
#  

# Sets user template to show all drives and servers on the Desktop
for USER_TEMPLATE in "/System/Library/User Template"/*
do
	defaults write "${USER_TEMPLATE}"/Library/Preferences/com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
	defaults write "${USER_TEMPLATE}"/Library/Preferences/com.apple.finder ShowHardDrivesOnDesktop -bool true
	defaults write "${USER_TEMPLATE}"/Library/Preferences/com.apple.finder ShowMountedServersOnDesktop -bool true
done

exit 0