#!/bin/bash

#
# Name of Script: Add JSS URL to Casper 9 prefs
# Description: This command adds the JSS url into the casper prefs
# Attribution: 
# Created by Mike Wilkerson
# Date created: 27 Mar 2014
# Last modified: 24 Feb 2015
# Revision 1.1
#  

# Add JSS url to rgmadmin user
defaults write /Library/Preferences/com.jamfsoftware.jss url "https://jss.rgmadvisors.com:8443/"

# Add JSS url to default template
defaults write /System/Library/User\ Template/English.lproj/Library/Preferences/com.jamfsoftware.jss url "https://jss.rgmadvisors.com:8443/"

exit 0