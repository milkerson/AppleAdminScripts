#!/bin/bash

#
# Name of Script: prepMunkiAndSUS - point to Apple
# Description: Sets the SUS to Apple.
# Attribution: BBass
# Created by Mike Wilkerson
# Date created: 08 Apr 2014
# Last modified: 08 Apr 2014
# Revision 0.3
#  

# Plist locations
munki=/Library/Preferences/ManagedInstalls
apple=/Library/Preferences/com.apple.SoftwareUpdate

# Get the system version
version=$(/usr/bin/defaults read /System/Library/CoreServices/SystemVersion ProductVersion | sed 's/^[^.]*\.//' | sed 's/\.[^.]$//')

#Loop through OS versions
case $version in
	
	9) defaults write $munki AppleSoftwareUpdatesOnly -bool True
	defaults write $munki InstallAppleSoftwareUpdates -bool True
	defaults delete $apple CatalogURL
	;;

	8) defaults write $munki AppleSoftwareUpdatesOnly -bool True
	defaults write $munki InstallAppleSoftwareUpdates -bool True
	defaults delete $apple CatalogURL
	;;
	
esac

exit 0