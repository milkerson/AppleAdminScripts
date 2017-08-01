#!/bin/bash

wifi=`/usr/sbin/networksetup -listallhardwareports | grep -A 1 Wi-Fi | grep Device | awk '{print $2}'`
tempcheck=`networksetup -listpreferredwirelessnetworks $wifi | grep HBITemp`

if [ $tempcheck = "HBITemp" ]; then
	/usr/sbin/networksetup -removepreferredwirelessnetwork $wifi HBITemp
	/usr/sbin/networksetup -addpreferredwirelessnetworkatindex $wifi HBITemp 0 WPA2E
else
	/usr/sbin/networksetup -addpreferredwirelessnetworkatindex $wifi HBITemp 0 WPA2E
fi
exit 0
#/usr/sbin/networksetup -addpreferredwirelessnetworkatindex $wifi HBITemp 0 WPA2E
#/usr/sbin/networksetup -removepreferredwirelessnetwork $wifi HBIOpsTemp

