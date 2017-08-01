#!/bin/bash

#
# Name of Script: clean up mike
# Description: This script removes a specific file that was left at the root level of
# 	the drive after installing 10.8.5 from Deploy Studio.
# Attribution: Mike's stupidity
# Created by Mike Wilkerson
# Date created: 06 Feb 2014
# Last modified: 25 Mar 2014
# Revision 0.1
#  

MIKE_DROPPING="/Volumes/Macintosh HD/delete_users.sh"

if [ -e "$MIKE_DROPPING" ]; then
	rm "$MIKE_DROPPING"
fi

exit 0