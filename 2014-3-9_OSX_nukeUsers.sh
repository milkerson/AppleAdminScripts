#!/bin/sh

#
# Name of Script: nukeUsers
# Description: Similar to missinglink or missingkitty, this is intended to remove 
# 	any existing users from a machine and force the setup assistant to run again, 
#	as if it were out of the box. Use for Mac OSX 10.8 & 10.9.
# Attribution: Unknown original author
# Created by Mike Wilkerson
# Date created: 17 Mar 2014
# Last modified: 25 Mar 2014
# Revision 0.5
#  

VERSION="0.5"

echo
echo "nukeUsers.sh - version $VERSION"
echo "==========================="
echo
echo "Running file system check..."
echo

# File system check	
fsck -yf

# Give me some space
echo

# Mount the file system
mount -uw /

# Begin the nuking!
echo "======= NUKE USERS ========"
echo " A - Nuke ALL users"
echo " C - CHOOSE users to nuke"
echo
read -p "Your Choice: " -n 1 -r
echo
echo
if [[ $REPLY =~ ^[Aa]$ ]]; then  # If the user chooses to nuke ALL
	echo "Are you sure you want to nuke ALL users from this"
	read -p "machine and revert back to factory startup? (Y/N) " -n 1 -r
	echo
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		for user in /Users/*; do
			[ -d "${user}" ] || continue # will skip if not a dir
			username="$(basename "${user}")"
			if [ "${username}" = "Shared" ]; then
				continue
			else
				rm -rf "${user}"
				rm -rf /private/etc/http/users/"${username}"*
				rm -rf /private/var/db/dslocal/nodes/Default/users/"${username}".plist
				echo "Removed $user"
			fi
		done
		echo
		echo "Removing system-wide files..."
	
		# Remove all of the files that govern user management in the OS
		rm -rf /private/var/db/samba/*
		rm -rf /private/var/db/dhcpclient  #
		rm -rf /private/var/db/openldap   #
		rm -rf /private/var/vm/swapfile*   #
		rm -rf /private/var/db/volinfo.database   #
		rm -rf /private/var/NetworkInterfaces.xml
		rm -rf /private/var/db/BootCache.playlist   #
		rm -rf /private/var/db/.AutoBindDone
		rm -rf /private/var/db/netinfo/local.nidb*

		rm -rf /Library/Logs/*
		rm -rf /Library/Caches/*
		rm -rf /Library/Caches/com.apple.LaunchServices.LocalCache.csstore
		rm -rf /Library/Preferences/SystemConfiguration/*.plist*
		rm -rf /System/Library/Caches/*
		rm -rf /System/Library/Extensions.kextcache
	
		# Enable the Setup Assistant again
		echo "Enabling Setup Assistant to run..."
		rm -rf /private/var/db/.AppleSetupDone
	
		# Enable the localization chooser
		echo "Enabling language picker..."
		touch /var/db/.RunLanguageChooserToo
	else
		break
	fi
	
else					# If the user chooses to pick users to nuke
	count=0
	for user in /Users/*; do
		[ -d "${user}" ] || continue 	# Will skip if not a dir
		username="$(basename "${user}")"
		if [ "${username}" = "Shared" ]; then
			continue
		else
			count+=1
			read -p "Do you want to delete the user named ${username}? (y/n) " -n 1 -r
			echo
			if [[ ! $REPLY =~ ^[Nn]$ ]]; then
				rm -rf "${user}"
				rm -rf /private/etc/http/users/"${username}"*
				rm -rf /private/var/db/dslocal/nodes/Default/users/"${username}".plist
				echo "Removed $user"
			else 
				continue
			fi
		fi
	done
	
	#Reports if there were no other user directories in /Users other than Shared.
	if [ "$count" -lt 1 ]; then
		echo "There are no users to delete." 
	fi
fi

echo
echo "Process complete!"
echo

# Deletes itself
rm /nukeUsers.sh

read -p "Would you like to Restart or Shut Down? (R/S) " -n 1 -r
echo
if [[ $REPLY =~ ^[Rr]$ ]]; then
	shutdown -r now
else
	shutdown -h now
fi
