#!/bin/bash

#
# Name of Script: Add JSS URL to Casper prefs
# Description: This command adds the JSS url into the casper prefs
# Attribution: 
# Created by Mike Wilkerson
# Date created: 27 Mar 2014
# Last modified: 
# Revision x.x
#  

# Add JSS url to default template
defaults write /System/Library/User\ Template/English.lproj/Library/Preferences/com.jamfsoftware.jss url "https://casper.rgmadvisors.com:8443/"

exit 0