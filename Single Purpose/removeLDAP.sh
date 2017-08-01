#!/bin/bash

userName=`ls -l /dev/console | cut -d " " -f4`

/usr/bin/su - $userName -c "/usr/bin/defaults delete /Users/$userName/Library/Preferences/com.apple.AddressBook AB3LDAPServers"

sleep 1

exit 0
