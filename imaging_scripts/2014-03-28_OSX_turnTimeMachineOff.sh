#!/bin/bash

#
# Name of Script: turnTimeMachineOff
# Description: System Preferences > Time Machine: off
# Attribution: Rich Trouton's first boot script
# Created by Mike Wilkerson
# Date created: 28 Mar 2014
# Last modified: 28 Mar 2014
# Revision 0.1
#  

## System Preferences > Time Machine
### Time Machine: off
defaults write /Library/Preferences/com.apple.TimeMachine 'AutoBackup' -bool false

exit 0