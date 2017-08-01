#!/bin/bash

#
# Name of Script: fix - launchCrashPlan LaunchAgent loop
# Description: A previous script failed to remove a Launch Daemon/Launch Agent that tries 
#				to call said script. Since the script self-destructs, this launchd item
#				causes high CPU load and system logs to fill up.  This script will look for
#				and remove any file associated with this issue.
# Attribution: n/a
# Created by Mike Wilkerson
# Date created: 28 Jan 2015
# Last modified: 29 Jan 2015
# Revision 0.2
#  

# Function to provide logging of the script's actions to
# the system log.  

ScriptLogging(){
    syslog -s -k Facility com.apple.console \
             Level Error \
             Sender "RGM_Desktop_Support - launchCrashPlan removal script" \
             Message "$1"
}

# launchd locations
loc1="/Library/LaunchAgents/"
loc2="/Library/LaunchDaemons/"

# file names
file1="com.rgmadvisors.launchCrashPlan.plist"
file2="/Library/Scripts/RGM/launchCrashplan.sh"


[ -f $loc1$file1 ] && launchctl unload $loc1$file1 && /bin/rm -f $loc1$file1 && ScriptLogging "File removed from $loc1."
[ -f $loc2$file1 ] && launchctl unload $loc2$file1 && /bin/rm -f $loc2$file1 && ScriptLogging "File removed from $loc2."
[ -f $file2 ] && /bin/rm -f $file2 && ScriptLogging "$file2 removed."

exit 0