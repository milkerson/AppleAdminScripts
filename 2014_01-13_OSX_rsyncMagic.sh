#!/bin/bash

#
# Name of Script: rsyncMagic
# Description: This script allows the user to pass source and destination locations in as
#	parameters to begin an rsync.  Best if used within a cron job
# Attribution: Inspired by scripts found online
# Created by Mike Wilkerson
# Date created: 13 Jan 2014
# Last modified: 25 Mar 2014
# Revision 0.2
#  

# USAGE: pass source and destination paths in as parameters when calling this script.

source=$1
dest=$2

rsync -rvh --delete $source $dest

exit 0