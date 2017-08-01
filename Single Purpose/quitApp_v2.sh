#!/bin/sh

#
# Name of Script: quitApp.sh
# Description: quits any App that is passed in as the first parameter.
# Attribution: Interwebs
# Created by Mike Wilkerson
# Date created: 19 May 2014
# Last modified: 10 Jul 2014
# Revision 0.2
# Example: 
#
#		sudo sh ./quitApp.sh iTunes
#
#	This example will quit iTunes.  Make sure to quote any apps with spaces
#	in the name.  ex: "Activity Monitor"
#
###################################################################################

pkill -ix "$1"

exit 0