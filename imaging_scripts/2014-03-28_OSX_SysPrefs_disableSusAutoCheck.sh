#!/bin/bash

#
# Name of Script: disableSusAutoCheck
# Description: Software Update - Disable Automatic checking
# Attribution: Rich Trouton's first boot script
# Created by Mike Wilkerson
# Date created: 28 Mar 2014
# Last modified: 28 Mar 2014
# Revision 0.1
#  

## Software Update - Disable Automatic checking
/usr/sbin/softwareupdate --schedule off > /dev/null 2>&1
defaults write /Library/Preferences/com.apple.SoftwareUpdate 'ScheduleFrequency' -int -1
defaults write /private/var/db/launchd.db/com.apple.launchd/overrides 'com.apple.softwareupdatecheck.initial' -dict 'Disabled' -bool true
defaults write /private/var/db/launchd.db/com.apple.launchd/overrides 'com.apple.softwareupdatecheck.periodic' -dict 'Disabled' -bool true
/usr/bin/plutil -convert xml1 /private/var/db/launchd.db/com.apple.launchd/overrides.plist
defaults write /Library/Preferences/com.apple.SoftwareUpdate 'AutomaticDownload' -bool false

exit 0