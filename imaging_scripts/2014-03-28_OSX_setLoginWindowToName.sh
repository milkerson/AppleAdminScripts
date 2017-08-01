#!/bin/bash

#
# Name of Script: setLoginWindowToName
# Description: Set the login window to name and password
# Attribution: Rich Trouton's
# Created by Mike Wilkerson
# Date created: 28 Mar 2014
# Last modified: 28 Mar 2014
# Revision 0.1
#  

# Set the login window to name and password
defaults write /Library/Preferences/com.apple.loginwindow SHOWFULLNAME -bool true
defaults write /Library/Preferences/com.apple.loginwindow LoginwindowText "Property of RGM Advisors, LLC\nwww.rgmadvisors.com"

exit 0