#!/bin/sh
#Remove iLife apps and support files, except for iPhoto and iTunes

#GarageBand
if [[ -e "/Applications/GarageBand.app" ]]
then
	/bin/rm -fR /Applications/GarageBand*
	/bin/rm -fR /Library/Application\ Support/GarageBand
	/bin/rm -fR "/Library/Audio/Apple Loops/Apple/Apple Loops for GarageBand"
	/usr/sbin/pkgutil --forget com.apple.pkg.GarageBand*
fi

#iWeb
if [[ -e "/Applications/iWeb.app" ]]
then
	/bin/rm -fR /Applications/iWeb*
	/bin/rm -fR ~/Library/Application\ Support/iWeb/
fi

#iDVD
if [[ -e "/Applications/iDVD.app" ]]
then
	/bin/rm -fR /Applications/iDVD*
	/bin/rm -fR /Library/iDVD/Favorites/
	/usr/sbin/pkgutil --forget com.apple.pkg.iDVD*
fi

#iMovie
if [[ -e "/Applications/iMovie.app" ]] || [[ -e "/Applications/iMovie HD.app" ]]
then
	/bin/rm -fR /Applications/iMovie*
	/bin/rm -fR ~/Library/iMovie
	/usr/sbin/pkgutil --forget com.apple.pkg.iMovie*
fi

exit 0