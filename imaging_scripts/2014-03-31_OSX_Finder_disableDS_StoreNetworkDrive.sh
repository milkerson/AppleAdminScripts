#!/bin/bash

#
# Name of Script: disableDS_StoreNetworkDrive
# Description: Turn off DS_Store file creation on network volumes
# Attribution: Ricj Trouton's first boot script
# Created by Mike Wilkerson
# Date created: 31 Mar 2014
# Last modified: 31 Mar 2014
# Revision 0.1
#  

# Turn off DS_Store file creation on network volumes
defaults write /System/Library/User\ Template/English.lproj/Library/Preferences/com.apple.desktopservices DSDontWriteNetworkStores true

exit 0