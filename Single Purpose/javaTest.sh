#!/bin/bash

currentUser=`who | grep "console" | cut -d" " -f1`

/usr/bin/defaults write /Users/$currentUser/Library/Preferences/com.apple.Safari WebKitJavaEnabled -boolean false
/usr/bin/defaults write /Users/$currentUser/Library/Preferences/com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2JavaEnabled -boolean false

/usr/sbin/chown $currentUser:staff /Users/$currentUser/Library/Preferences/com.apple.Safari.plist

exit 0
