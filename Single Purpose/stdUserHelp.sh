#!/bin/bash

if [ -e /etc/authorization.prev ]; then
	rm /etc/authorization.prev
fi

#Copy file to tmp location
/bin/cp -pr /etc/authorization /private/tmp/authorization.plist

# Unlock System Preferences for non admins.
/usr/libexec/PlistBuddy -c 'Set :rights:system.preferences:group powerusers' /private/tmp/authorization.plist

# Unlock Network Settings preference pane
/usr/libexec/PlistBuddy -c 'Set :rights:system.preferences.network:group powerusers' /private/tmp/authorization.plist
/usr/libexec/PlistBuddy -c 'Set :rights:system.services.systemconfiguration.network:rule allow' /private/tmp/authorization.plist

# Unlock Printer Preference pane
/usr/libexec/PlistBuddy -c 'Set :rights:system.preferences.printing:group _lpadmin' /private/tmp/authorization.plist

# Allow user to change Date & Time
/usr/libexec/PlistBuddy -c 'Set :rights:system.preferences.datetime:group powerusers' /private/tmp/authorization.plist

# Move file back to original location	
/bin/mv /etc/authorization /etc/authorization.prev
/bin/mv /private/tmp/authorization.plist /etc/authorization

exit 0