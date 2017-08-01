#!/bin/bash

#
# Name of Script: Parallels VM list (EA)
# Description: This script collects VM info from Parallels VMs and lists them. 
# For use as an Extension Attribute in Casper.
#
# Attribution: Based on examples of similar EAs found on JAMF Nation
# Created by Mike Wilkerson
# Date created: 24 Mar 2014
# Last modified: 25 Mar 2014
# Revision 0.2
#  

IFS=$'\n'

# get current user
user=`ls -l /dev/console | cut -d " " -f 4`

# find any files with .pvm as file extension
vmlist=$(find /Users/$user -type d -iname "*.pvm")

# count how many items found in the search
vmcount=$(echo $vmlist | wc -w)

# iterate through files found and extract OS version
vmvar=$(for i in $vmlist; \
do \
	cat $i/parallels.log | grep -m 1 "VM conf:"| awk '{print $(NF-1),$NF}'; \
done) \

# print the results
if [ $vmcount -eq 0 ];
then
echo "<result>No VMs found</result>"
else
echo "<result>$vmvar</result>"
fi

unset IFS

exit 0