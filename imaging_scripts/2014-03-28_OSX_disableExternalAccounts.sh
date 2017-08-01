#!/bin/bash

#
# Name of Script: disableExternalAccounts
# Description: Disable external accounts (i.e. accounts stored on drives other than the boot drive.)
# Attribution: Rich Trouton's first boot script
# Created by Mike Wilkerson
# Date created: 28 Mar 2014
# Last modified: 28 Mar 2014
# Revision 0.1
#  

# Disable external accounts (i.e. accounts stored on drives other than the boot drive.)
defaults write /Library/Preferences/com.apple.loginwindow EnableExternalAccounts -bool false

exit 0