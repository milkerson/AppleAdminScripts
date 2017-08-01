#!/bin/bash

#
# Name of Script: pfEnable
# Description: Enable the PF-sense firewall
# Attribution:  BBass
# Created by Mike Wilkerson
# Date created: 31 Mar 2014
# Last modified: 31 Mar 2014
# Revision 0.1
#  

# redirect all IO to /dev/null (comment this out if you want to debug)
exec 1>/dev/null 2>/dev/null

# Load the LaunchDaemons
/bin/launchctl load /Library/LaunchDaemons/com.rgmadvisors.pf.plist
/bin/launchctl load /Library/LaunchDaemons/com.rgmadvisors.pf.emergingthreats.plist

# Start the firewall
/usr/local/bin/pf-restart.sh

# wait a second...
sleep 1

# Update the Emerging Threats list
/usr/local/bin/pf-etUpdate.sh

exit 0
