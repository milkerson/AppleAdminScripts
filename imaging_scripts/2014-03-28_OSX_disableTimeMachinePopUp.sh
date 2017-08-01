#!/bin/bash

#
# Name of Script: disableTimeMachinePopUp
# Description: Disable Time Machine's pop-up message whenever an external drive is plugged in
# Attribution:  Rich Trouton's first boot script
# Created by Mike Wilkerson
# Date created: 28 Mar 2014
# Last modified: 28 Mar 2014
# Revision 0.1
#  

# Disable Time Machine's pop-up message whenever an external drive is plugged in
defaults write /Library/Preferences/com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

exit 0