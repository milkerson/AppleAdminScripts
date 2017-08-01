#!/bin/sh

CURRENTUSER=`who | grep "console" | cut -d" " -f1`

if [ -e /Users/$CURRENTUSER/Library/Preferences/net.juniper.Junos-Pulse.plist ]; then
	rm /Users/$CURRENTUSER/Library/Preferences/net.juniper.*
fi

exit 0
