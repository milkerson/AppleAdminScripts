#!/bin/bash

#
# Name of Script: postElCap_Recon
# Description: To be run in a payload-free package during the post-flight of the El Capitan installer,
#  this script will run Recon.
# Attribution: 
# Created by Mike Wilkerson
# Date created: 10 Nov 2014
# Last modified: 20 Oct 2015
# Revision 0.2
#  

# Variable definitions


# Function to provide logging of the script's actions to
# the system log.  

ScriptLogging(){
    syslog -s -k Facility com.apple.console \
             Level Error \
             Sender "RGM_Desktop_Support - post El Capitan Recon" \
             Message "$1"
}


# Run RECON, then delay 60 seconds to allow
# recon to complete and the MDM to be removed.
	ScriptLogging "Starting recon..."
	jamf recon
	ScriptLogging "Recon complete... Starting jamf manage"
	jamf manage
	ScriptLogging "Manage complete..."

exit 0