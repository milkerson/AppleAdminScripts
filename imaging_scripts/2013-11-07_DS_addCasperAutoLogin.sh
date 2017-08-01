#!/bin/sh

#
# Name of Script: _addCasperAutoLaunch
# Description: This script launches Casper Imaging on first boot into the OS
# Attribution: unknown
# Created by ??
# Date created: 07 Nov 2013
# Last modified: 27 Mar 2014
# Revision 0.1
#  

`defaults write loginwindow AutoLaunchedApplicationDictionary -array-add '{Path="/Applications/Utilities/Casper Imaging.app";}'`

exit 0