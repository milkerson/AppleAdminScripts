#!/bin/sh

#
# Name of Script: removeiLife
# Description: #Remove iLife apps and support files, except for iTunes
# Attribution: Mike
# Created by Mike Wilkerson
# Date created: 31 Mar 2014
# Last modified: 27 May 2015
# Revision 0.2
#  
#  Last Update: Updated to include Photos.app

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

#iPhoto
if [[ -e "/Applications/iPhoto.app" ]]
then
	/bin/rm -fR /Applications/iPhoto*
	/bin/rm -fR ~/Library/Application\ Support/iPhoto/
	/bin/rm -fR ~/Library/Containers/com.apple.iPhoto/
	/usr/sbin/pkgutil --forget com.apple.pkg.iPhoto*
fi

#Photos.app (10.10.3 +)
if [[ -e "/Applications/Photos.app" ]]
then
	/bin/rm -fR /Applications/Photos*
	/bin/rm -fR ~/Library/Containers/com.apple.Photos/
	/usr/sbin/pkgutil --forget com.apple.pkg.Photos*
fi

exit 0