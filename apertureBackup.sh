#!/bin/bash

#
# Name of Script: apertureBackup
# Description: rsync command to backup a folder locally to network location
# Attribution: 
# Created by Mike Wilkerson
# Date created: 14 Apr 2014
# Last modified: 
# Revision 0.2
#  

#!/bin/sh
echo
echo "Running..."
echo 

PROG=$0
RSYNC="/usr/bin/rsync"
 
SCRIPT_MOUNTED='false'
MOUNT_VOLUME="/Volumes/Aperture Library backup"
SRC="/Volumes/Aperture Library/Aperture Library.aplibrary"
DST="$MOUNT_VOLUME/"

echo "**********************************************************************"
echo "|                        DAILY RSYNC GOODNESS                        |"
echo "**********************************************************************"
echo
echo "  Source: $SRC"
echo
echo "  Destination: $DST"
echo
echo "**********************************************************************"
echo
 
# Mount the backup
if [ ! -e "$MOUNT_VOLUME" ]; then
  echo "The network volume '$MOUNT_VOLUME' is not mounted... exiting."
  exit 2
else  
  echo ' √ - Network volume is mounted.'
  
  if [ ! -r "$SRC" ]; then
  	MESSAGE="Source $SRC not readable - Cannot start the sync process"
  	/usr/bin/logger -t $PROG $MESSAGE
   	echo $MESSAGE
 	exit;
  else
  	echo " √ - $SRC is readable."
  fi
 
  if [ ! -d "$DST" ]; then
  	mkdir "$DST"
  	MESSAGE="Destination folder ($DST) was not present and had to be created."
 	/usr/bin/logger -t $PROG $MESSAGE
 	echo $MESSAGE
  fi
  
  if [ ! -w "$DST" ]; then
 	MESSAGE="Destination $DST not writeable - Cannot start the sync process"
 	/usr/bin/logger -t $PROG $MESSAGE
 	echo $MESSAGE
 	exit;
  else
  	echo " √ - $DST is writable."
  	echo
  	echo "**********************************************************************"
  	echo "**********************************************************************"
  fi
  
  /usr/bin/logger -t $PROG "Starting rsync"
 
  sudo /usr/local/bin/rsync -vrltgoDuxhizP --progress --delete --exclude ".MobileBackups" --exclude ".DocumentRevisions-V100" --exclude ".DS_Store" --exclude ".fseventsd" --exclude ".Spotlight-V100" --exclude ".TemporaryItems" --exclude ".Trashes"--omit-dir-times "$SRC" "$DST"
  
fi

exit 0