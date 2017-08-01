#!/bin/sh

# Remove the Applications
/bin/rm -fR /Applications/GarageBand.app
/bin/rm -fR /Applications/iMovie.app

# Remove Application Support Files
/bin/rm -fR /Library/Application\ Support/GarageBand/
/bin/rm -fR /Library/Application\ Support/iMovie/
/bin/rm -fR "/Library/Audio/Apple Loops/Apple/Apple Loops for GarageBand/"

# Tell the system to forget about the original installs
/usr/sbin/pkgutil --forget com.apple.pkg.GarageBand_AppStore
/usr/sbin/pkgutil --forget com.apple.pkg.iMovie_AppStore
/usr/sbin/pkgutil --forget com.apple.pkg.GarageBandBasicContent
/usr/sbin/pkgutil --forget com.apple.pkg.iPhoto_AppStore

exit 0
