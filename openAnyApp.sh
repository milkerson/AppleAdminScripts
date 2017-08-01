#!/bin/sh

#
# Name of Script: openAnyApp
# Description: This small script takes an app name passed in the first parameter and 
# launches it. Intended to be used within Casper.
# Attribution:  Mike
# Created by Mike Wilkerson
# Date created: Oct 2013
# Last modified: 25 Mar 2014
# Revision 0.2
#  

open -a /Applications/$1.app

exit 0