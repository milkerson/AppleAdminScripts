#!/bin/bash

#
# Name of Script: fixJAMFfolder
# Description: This corrects the permissions on the JAMF folder
# Attribution: 
# Created by Mike Wilkerson
# Date created: 05 Aug 2014
# Last modified: 05 Aug 2014
# Revision 0.2
#  

jamf="/Library/Application Support/JAMF"

if [ -d "$jamf" ]; then
	chmod 755 "$jamf"

fi

exit 0

