#!/bin/bash

#
# Name of Script: saveToDiskNotIcloud
# Description: Save to disk (not to iCloud) by default
# Attribution: Casper First Run
# Created by Mike Wilkerson
# Date created: 28 Mar 2014
# Last modified: 28 Mar 2014
# Revision 0.1
#  

# Save to disk (not to iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

exit 0