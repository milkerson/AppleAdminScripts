#!/bin/sh

user=`who | grep "console" | cut -d" " -f1`

# Run the JP uninstaller
/Library/Application\ Support/Juniper\ Networks/Junos\ Pulse/Uninstall.app/Contents/Resources/uninstaller

# Remove the remnants from /Library/Application Support
/bin/rm -fR /Library/Application\ Support/Juniper\ Networks/

# Remove any cruft from the User Library Directory
/bin/rm -fR /Users/$user/Library/Application\ Support/Juniper\ Networks/
/bin/rm -f /Users/$user/Library/Application\ Support/Preferences/net.juniper*

exit 0
