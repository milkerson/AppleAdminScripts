#!/bin/bash

#
# Name of Script: setComputerHostName
# Description: This script sets the computer name and the host name from Sharing prefs
# Attribution: FirstBoot script
# Created by Mike Wilkerson
# Date created: 28 Mar 2014
# Last modified: 28 Mar 2014
# Revision 0.1
#  

# Get Serial number
serialNumber=`system_profiler SPHardwareDataType | awk '/Serial Number/ { print $4 }'`

# Set computer name (as done via System Preferences → Sharing)
scutil --set ComputerName $serialNumber
scutil --set LocalHostName $serialNumber

exit 0