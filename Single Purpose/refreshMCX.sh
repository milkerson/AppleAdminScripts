#!/bin/bash

# A short script to refresh MCX on a machine.

/bin/rm -R /Library/Managed\ Preferences/*
/usr/bin/dscl . -delete /Computers
/usr/bin/dscl . -list Computers | grep -v "^localhost$" | while read computer_name ; do sudo dscl . -delete Computers/"$computer_name" ; done
/usr/sbin/jamf mcx

exit 0