#!/bin/sh

#
# Name of Script: quitiTunes_w_message
# Description: Give user a cocoaDialog alert indicating that iTunes must be closed.
# Attribution:
# Created by Mike Wilkerson
# Date created: 19 May 2014
# Last modified: 29 Oct 2015
# Revision 0.3
#  

# VARIABLES
CD="/usr/local/rgm/notify/CocoaDialog.app/Contents/MacOS/CocoaDialog"
JH="/Library/Application Support/JAMF/bin/jamfHelper.app/Contents/MacOS/jamfHelper"

# TOOLS
ScriptLogging(){
    syslog -s -k Facility com.apple.console \
             Level Error \
             Sender "RGM_Desktop_Support - Quit iTunes message" \
             Message "$1"
}

run=$(pgrep -ix "itunes")

if [[ $run -gt 0 ]]; then
	ScriptLogging "iTunes is running, so asking user for permission to quit..."

	choice=`"$JH" -windowType utility -icon /usr/local/rgm/graphic_assets/round_logo.png \
				-windowPosition ul \
				-heading "iTunes Update" \
				-description "RGM Desktop Support is pushing an update to iTunes.
	
This update will NOT require a restart and should be complete in less than 60 seconds.  Click OK to proceed and quit iTunes now, or click Not now to do it later.
	
Questions? Please contact Althea or Mike in Desktop Support." \
				-button1 "OK" \
				-button2 "Not now" \
				-defaultButton 1 \
				-cancelButton 2`
				
	if [[ $choice = 0 ]]; then
		ScriptLogging "User clicked OK to quit iTunes..."
		# pkill -i "itunes"
		/usr/local/rgm/scripts/quitApp.sh iTunes
	else
		ScriptLogging "User opted to wait..."
		exit 1
	fi
else 
	ScriptLogging "iTunes not running, so quitting now..."
	# pkill -i "itunes"
	/usr/local/rgm/scripts/quitApp.sh iTunes
fi