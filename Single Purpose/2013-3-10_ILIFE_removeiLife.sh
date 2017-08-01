#!/bin/bash

# Remove the Applications
rm -fR /Applications/GarageBand.app
rm -fR /Applications/iMovie.app
rm -fR /Applications/iPhoto.app

# Remove Application Support Files
rm -fR /Library/Application\ Support/GarageBand/
rm -fR /Library/Application\ Support/iMovie/
rm -fR /Library/Application\ Support/iPhoto/
rm -fR "/Library/Audio/Apple/Apple Loops/Apple Loops for GarageBand/"

# Tell the system to forget about the original installs
pkgutil --forget com.apple.pkg.GarageBand_AppStore
pkgutil --forget com.apple.pkg.iMovie_AppStore
pkgutil --forget com.apple.pkg.GarageBandBasicContent
pkgutil --forget com.apple.pkg.iPhoto_AppStore

exit 0