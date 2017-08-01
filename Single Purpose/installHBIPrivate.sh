#!/bin/bash

wifi=`/usr/sbin/networksetup -listallhardwareports | grep -A 1 Wi-Fi | grep Device | awk '{print $2}'`
tempcheck=`networksetup -listpreferredwirelessnetworks $wifi | grep HBI.Private`

# Install 802.1x profile
/usr/bin/profiles -I -F /usr/local/rgm/profiles/HBI\ Private\ Wireless.mobileconfig 

# Make adjustments to preferred networks
/usr/sbin/networksetup -removepreferredwirelessnetwork $wifi HBI.Private
/usr/sbin/networksetup -removepreferredwirelessnetwork $wifi HBI
/usr/sbin/networksetup -addpreferredwirelessnetworkatindex $wifi HBI.Private 0 WPA2E

exit 0
