#!/bin/bash

#
# Name of Script: prepMunkiAndSUS - Base Branch
# Description: Sets the SUS for the base branch.
# Attribution: BBass
# Created by Mike Wilkerson
# Date created: 08 Apr 2014
# Last modified: 08 Apr 2014
# Revision 0.3
#  

# Plist locations
munki=/Library/Preferences/ManagedInstalls
apple=/Library/Preferences/com.apple.SoftwareUpdate

# US SU URLs
mavs=http://swup-aus.rgmadvisors.com/content/catalogs/others/index-10.9-mountainlion-lion-snowleopard-leopard.merged-1_2014-base.sucatalog
mountainLion=http://swup-aus.rgmadvisors.com/content/catalogs/others/index-mountainlion-lion-snowleopard-leopard.merged-1_2014-base.sucatalog

# UK SU URLs
mavsUK=http://swup-lon.rgmadvisors.com/content/catalogs/others/index-10.9-mountainlion-lion-snowleopard-leopard.merged-1_2014-base.sucatalog
mountainLionUK=http://swup-lon.rgmadvisors.com/content/catalogs/others/index-mountainlion-lion-snowleopard-leopard.merged-1_2014-base.sucatalog

# Get the system version
version=$(/usr/bin/defaults read /System/Library/CoreServices/SystemVersion ProductVersion | sed 's/^[^.]*\.//' | sed 's/\.[^.]$//')

# Loop through OS versions
case $version in
	
	9) defaults write $munki AppleSoftwareUpdatesOnly -bool True
	defaults write $munki InstallAppleSoftwareUpdates -bool True
	defaults write $apple CatalogURL $mavs
	;;

	8) defaults write $munki AppleSoftwareUpdatesOnly -bool True
	defaults write $munki InstallAppleSoftwareUpdates -bool True
	defaults write $apple CatalogURL $mountainLion
	;;
	
esac

exit 0