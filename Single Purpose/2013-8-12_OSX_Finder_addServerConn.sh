#!/bin/sh

# script to add a server to the list appearing at Go -> Connect to Server
# for all > 500 user accounts.
# to create your own shortcuts, just change the variables:
#
# ServerName = the name of the server you'd like to appear in your list
# ServerURL = the actual URL to that server
# LOG = whatever your sdout file is

# reference thanks to:
# Mike (http://jamfnation.jamfsoftware.com/viewProfile.html?userID=1927)
# Rich Trouton (http://derflounder.wordpress.com/2013/01/10/updating-server-bookmarks-in-com-apple-sidebarlists-plist/)

#----------------------------------------------------------
#   Variables
#----------------------------------------------------------

# --- assignments ---
ServerName="Austin File Server" #doesn't need to be a URL
ServerURL="cifs://orange.rgmadvisors.com/"

# --- executables ---
Plist="/usr/libexec/PlistBuddy"

# --- directories ---
#LOG="/PATH/TO/YOUR/LOGFILE.log"

# --- computationals ---
date=`date "+%A %m/%d/%Y %H:%M"`
over500=`dscl . list /Users UniqueID | awk '$2 > 500 { print $1 }'`

# ---------------------------------------------------------------------------
#   Go to every user, back-up file, add new link, fix permissions
# ---------------------------------------------------------------------------
for i in $over500
do
	cd /Users/$i/Library/Preferences
	zip SidebarListsBackup.zip com.apple.sidebarlists.plist
	$Plist com.apple.sidebarlists.plist -c "Add :favoriteservers:CustomListItems:0 dict"
	$Plist com.apple.sidebarlists.plist -c "Add :favoriteservers:CustomListItems:0:Name string ${ServerName}"
	$Plist com.apple.sidebarlists.plist -c "Add :favoriteservers:CustomListItems:0:URL string ${ServerURL}"
	/usr/sbin/chown ${i}:staff /Users/$i/Library/Preferences/com.apple.sidebarlists.plist
done

exit 0