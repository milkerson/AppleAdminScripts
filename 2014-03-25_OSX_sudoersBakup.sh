#!/bin/bash

#
# Name of Script: Sudoers bakup
# Description: In prep for adding a standard user to the list of sudoers, this script
# 	makes a backup of the sudoers file.
# Attribution: Various sources
# Created by Mike Wilkerson
# Date created: Mar 2014
# Last modified: 25 Mar 2014
# Revision 0.2
#  

# Define locations
SUDOERS="/etc/sudoers"
BACKUP="/Users/rgmadmin/Documents/sudobak"

# If the backup directory already exists, then just back up the sudoers file.
if [ -e $BACKUP ]; then
	cp "$SUDOERS" "$BACKUP"
else
	mkdir $BACKUP
	cp "$SUDOERS" "$BACKUP"
fi

exit 0