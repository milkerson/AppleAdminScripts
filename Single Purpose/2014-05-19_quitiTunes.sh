#!/bin/sh

#
# Name of Script: quitiTunes
# Description: Give user a jamfHelper alert indicating that iTunes must be closed.
# Attribution:
# Created by Mike Wilkerson
# Date created: 19 May 2014
# Last modified: 19 May 2014
# Revision 0.2
#  


running=`osascript -e 'tell application "System Events" to count every process whose name is "iTunes"'`


if [[ $running -gt 0 ]]; then

	/Library/Application\ Support/JAMF/bin/jamfHelper.app/Contents/MacOS/jamfHelper -windowType utility -icon /usr/local/rgm/graphic_assets/RGM_Logo.png -heading "                			iTunes Update Required" -description "RGM Desktop Support is pushing an update to iTunes.
	
Click OK to quit iTunes and proceed. This update will NOT require a restart and will be complete in less than 60 seconds.
	
Questions? Contact Althea, Pearce or Mike in Desktop Support." -button1 "OK"

	sh /usr/local/rgm/scripts/quitApp.sh iTunes

fi