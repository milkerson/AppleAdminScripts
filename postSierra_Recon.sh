#!/bin/bash

#
# Name of Script: postSierra_Recon
# Description: To be run in a payload-free package during the post-flight of the Sierra installer,
#  this script will run Recon.
# Attribution: 
# Created by Mike Wilkerson
# Date created: 10 Nov 2014
# Last modified: 18 Oct 2016
# Revision 0.2
#  

# Variable definitions

rgmLog="/usr/local/rgm/scripts/rgmLog.sh"
	
# Trigger JSS policy to any final scripts

	/usr/local/bin/jamf policy -event post_Sierra
	$rgmLog "post_Sierra policy completed."
	
sleep 120

exit 0