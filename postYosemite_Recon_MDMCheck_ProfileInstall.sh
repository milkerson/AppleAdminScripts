#!/bin/bash

#
# Name of Script: postYosemite_Recon_MDMCheck_ProfileInstall
# Description: To be run in a payload-free package during the post-flight of the Yosemite installer,
#  this script will run Recon, then check for the MDM wifi profile to be removed, then install the local profile.
# Attribution: 
# Created by Mike Wilkerson
# Date created: 10 Nov 2014
# Last modified: 10 Nov 2014
# Revision 0.1
#  

# Variable definitions
profileLocation="/usr/local/rgm/profiles/HBI.Private Wireless 2014.mobileconfig"

# Function to provide logging of the script's actions to
# the system log.  

ScriptLogging(){
    syslog -s -k Facility com.apple.console \
             Level Error \
             Sender "RGM_Desktop_Support - postYosemite_Recon_MDM-check_Profile-install" \
             Message "$1"
}

# Function that determines if the MDM Wifi profile is 
# present by listing the profiles, then checking it
# against the known ID for the Wifi profile.

CheckForProfile(){
    local test
    
    if [[ -z "${MDMPRESENT:=}" ]]; then
        test=$(/usr/bin/profiles -C | awk '{print $4}' | grep -c '26AC7B2D-C5D5-4028-A974-54612A105183')
        if [[ "${test}" -gt 0 ]]; then
            MDMPRESENT="-YES-"
        else
            MDMPRESENT="-NO-"
        fi
    fi
}

# Run RECON, then delay 60 seconds to allow
# recon to complete and the MDM to be removed.
	ScriptLogging "Starting recon..."
	jamf recon
	ScriptLogging "Recon complete..."
	jamf manage
	ScriptLogging "Manage complete..."

# Check for and wait up to 12 minutes for the MDM
# Wifi profile to be removed
#
# The MDM check will occur every 5 seconds
# until the 12 minute limit is reached.

	ScriptLogging "Checking for the HBI.Private MDM profile..."
	
	CheckForProfile
	
	i=1
	while [[ "${MDMPRESENT}" != "-NO-" ]] && [[ $i -ne 144 ]]
    	do
			/bin/sleep 5
			MDMPRESENT=
			CheckForProfile
			echo "Check #$i"
			i=$(( $i + 1 ))
		done
	
	ScriptLogging "Check complete..."
	seconds=$(( $i * 5 ))

	if [[ "${MDMPRESENT}" != "-NO-" ]]; then
		ScriptLogging "MDM profile has NOT been removed yet..."
		ScriptLogging "Timed out after $seconds seconds... Exiting."

		exit 0
	fi
  
	if [[ "${MDMPRESENT}" == "-NO-" ]]; then
		ScriptLogging "MDM profile has been removed..."
		ScriptLogging "Installing local Wifi ConfigProfile..."
		/usr/bin/profiles -I -F "$profileLocation"
		
		if [[ "$i" -gt 1 ]]; then
			ScriptLogging "It took $seconds seconds for the MDM profile to be removed..."
		fi
		ScriptLogging "MDM installation complete!"
	fi

exit 0