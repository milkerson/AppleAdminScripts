#!/bin/bash

#
# Name of Script: cleanUpMike
# Description: This script removes the "delete_users.sh" that was mistakenly left 
# 	in the 10.8.5 image when it was created.  once 10.8.5 has been reimaged (or 
# 	removed), this can be deleted from the workflow.
# Attribution: Mike's stupidity
# Created by Mike Wilkerson
# Date created: 6 Feb 2014
# Last modified: 27 Mar 2014
# Revision 0.2
#  

MIKE_DROPPING="/Volumes/Macintosh HD/delete_users.sh"

if [ -e "$MIKE_DROPPING" ]; then
	rm "$MIKE_DROPPING"
fi

exit 0