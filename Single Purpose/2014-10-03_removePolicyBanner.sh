#!/bin/bash

#
# Name of Script: removePolicyBanner
# Description: This will remove the policy banner if it exists prior to installing Yosemite.
# Attribution:
# Created by Mike Wilkerson
# Date created: 03 Oct 2014
# Last modified: 03 Oct 2014
# Revision 0.1
#  

bannerloc="/Library/Security/PolicyBanner.rtfd"

if [ -e "$bannerloc" ]; then

	rm -R "$bannerloc"
	
fi

exit 0