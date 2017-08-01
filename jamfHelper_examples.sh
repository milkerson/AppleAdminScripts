#!/bin/bash

#
# Name of Script: 
# Description: 
# Attribution:
# Created by Mike Wilkerson
# Date created: 22 Oct 2015
# Last modified: 
# Revision x.x
#  

JH="/Library/Application Support/JAMF/bin/jamfHelper.app/Contents/MacOS/jamfHelper"

# Normal utility window. 
r1=`"$JH" -windowType utility -icon /usr/local/rgm/graphic_assets/round_logo.png \
			-heading "iTunes Update" \
			-description "RGM Desktop Support is pushing an update to iTunes. 
			
			Click OK to proceed and quit iTunes now. This update will NOT require a restart and should be complete in less than 60 seconds. 
			
			Questions? Please contact Althea or Mike in Desktop Support." \
			-button1 "OK" \
			-button2 "Not now" \
			-defaultButton 1 \
			-cancelButton 2`
echo $r1
			
# HUD style window.  icon resized
r2=`"$JH" -windowType hud -icon /usr/local/rgm/graphic_assets/round_logo.png \
			-heading "iTunes Update" \
			-description "RGM Desktop Support is pushing an update to iTunes. 
			
			Click OK to proceed and quit iTunes now. This update will NOT require a restart and should be complete in less than 60 seconds. 
			
			Questions? Please contact Althea or Mike in Desktop Support." \
			-lockHUD \
			-iconSize 130 \
			-button1 "OK" \
			-button2 "Not now" \
			-defaultButton 1 \
			-cancelButton 2`
echo $r2

# Utility window with drop down delay options
r3=`"$JH" -windowType utility -icon /usr/local/rgm/graphic_assets/round_logo.png \
			-heading "How long do you want to put off this thing?" \
			-description "RGM Desktop Support is pushing some stuff, but we need to know how long you want to delay.
			
			Select the time delay from the list below:" \
			-iconSize 130 \
			-button1 "Later..." \
			-showDelayOptions "900, 1800, 2700, 3600"`
echo $r3

# Utility window to tell user how long their machine has been running
r4=`"$JH" -windowType utility -icon /usr/local/rgm/graphic_assets/round_logo.png \
			-heading "" \
			-description "$infoText" \
			-iconSize 130 \
			-button1 "OK, got it..." \
			-showDelayOptions "900, 1800, 2700, 3600"`

exit 0