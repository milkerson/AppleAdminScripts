#!/bin/sh
#####
## This script attempts to "fix" the problem with network services on imaged machines
#####

ethernetCheck=`networksetup -listallnetworkservices | grep Ethernet`
modelCheck=`/usr/sbin/system_profiler SPHardwareDataType | grep "Model Identifier"`

## Rename the original Wi-Fi entry, create a new one, and delete the original
networksetup -renamenetworkservice "Wi-Fi" "WiFiOld"
networksetup -createnetworkservice "Wi-Fi" "Wi-Fi"
networksetup -removenetworkservice "WiFiOld"	

## Follow the same process for the ethernet port
case $ethernetCheck in
	Ethernet)
		networksetup -renamenetworkservice "Ethernet" "EthernetOld"
			case $modelCheck in
				*MacBookAir[45]* | *MacBookPro10*)
					networksetup -createnetworkservice "Thunderbolt Ethernet" "Ethernet"
				;;
				*)
					networksetup -createnetworkservice "Ethernet" "Ethernet"
				;;
			esac
		networksetup -removenetworkservice "EthernetOld"	
	;;
	
	*Thunderbolt*)
		networksetup -renamenetworkservice "Thunderbolt Ethernet" "ThunderboltOld"
			case $modelCheck in
				*MacBookAir[45]* | *MacBookPro10*)
					networksetup -createnetworkservice "Thunderbolt Ethernet" "Ethernet"
				;;
				*)
					networksetup -createnetworkservice "Ethernet" "Ethernet"
				;;
			esac	
		networksetup -removenetworkservice "ThunderboltOld"

	;;
esac

exit 0