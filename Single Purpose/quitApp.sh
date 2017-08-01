#!/bin/sh

##################################################################################
#
# This script quits any App that is passed in as the fourth parameter.
#
# Terminal.app example: 
#
#		sudo sh ./quitApp.sh iTunes
#
#	This example will quit iTunes.  Make sure to quote any apps with spaces
#	in the name.  ex: "Activity Monitor"
#
###################################################################################

app=$1

osascript <<EOF
if application "$app" is running then
    tell application "$app" 
    	quit
    end tell
end if
EOF

exit 0