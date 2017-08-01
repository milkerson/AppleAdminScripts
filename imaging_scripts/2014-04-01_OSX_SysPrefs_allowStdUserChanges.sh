#!/bin/bash

#
# Name of Script: allowStdUserChanges
# Description: Allow certain settings to be edited by everyone, not just admins
# Attribution:  Casper First Run
# Created by Mike Wilkerson
# Date created: 01 Apr 2014
# Last modified: 01 Apr 2014
# Revision 0.1
#  

# Allow certain settings to be edited by everyone, not just admins
/usr/bin/security authorizationdb write system.services.systemconfiguration.network allow
/usr/bin/security authorizationdb write system.preferences.printing allow
/usr/bin/security authorizationdb write system.preferences.datetime allow

exit 0