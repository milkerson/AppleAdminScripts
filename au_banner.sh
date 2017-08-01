#!/bin/bash

#
# Name of Script: RGM_au_banner_cocoadialog
# Description: Launches and displays the Acceptable Use Policy text using cocoaDialog.  Returns 1 when the user clicks "Got it"
# Attribution:
# Created by Mike Wilkerson
# Date created: 12 Oct 2015
# Last modified: 
# Revision 0.2
#  

# Function to provide logging of the script's actions to
# the system log.  

ScriptLogging(){
    syslog -s -k Facility com.apple.console \
             Level Error \
             Sender "RGM_Desktop_Support - AU_Banner" \
             Message "$1"
}

# Variable declarations
CD="/usr/local/rgm/notify/CocoaDialog.app/Contents/MacOS/CocoaDialog"
timeout=60

result=`$CD textbox --title "RGM Acceptable Use Policy" \
	--informative-text "PLEASE NOTE: This policy is being displayed in a new way. The policy itself has not changed. See revision date within the text." \
	--text-from-file "/usr/local/rgm/au/au_long.txt" \
	--button1 "Agree" \
	--timeout $timeout \
	--float`

if [ $result -eq 1 ]; then
	ScriptLogging "User clicked Agree"
else
	ScriptLogging "Window timed out after $timeout seconds"
fi

exit 0