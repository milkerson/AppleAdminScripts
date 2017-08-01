#!/bin/bash

#
# Name of Script: activateHBIPrivate
# Description: Activate HBI Private profile, then set it as the preferred network.
# Attribution: Unknown
# Created by Mike Wilkerson
# Date created: 31 Mar 2014
# Last modified: 31 Mar 2014
# Revision 0.1
#  

# Determine network port for wifi (en0 or en1)
wifi=`/usr/sbin/networksetup -listallhardwareports | grep -A 1 Wi-Fi | grep Device | awk '{print $2}'`

# Install 802.1x profile
/usr/bin/profiles -I -F /usr/local/rgm/profiles/HBI\ Private\ Wireless.mobileconfig 

# Make adjustments to preferred networks
/usr/sbin/networksetup -removepreferredwirelessnetwork $wifi HBI.Private
/usr/sbin/networksetup -removepreferredwirelessnetwork $wifi HBI
/usr/sbin/networksetup -addpreferredwirelessnetworkatindex $wifi HBI.Private 0 WPA2E

exit 0
