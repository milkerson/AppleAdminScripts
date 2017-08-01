#!/bin/bash

#
# Name of Script: installJunosPulseList
# Description: Install the Junos Pulse server list
# Attribution: Casper First Run
# Created by Mike Wilkerson
# Date created: 28 Mar 2014
# Last modified: 28 Mar 2014
# Revision 0.1
#  

# Install Junos Pulse server list
/Applications/Junos\ Pulse.app/Contents/Plugins/JamUI/jamCommand -importFile /usr/local/rgm/junos/RGM_VPN_Servers.jnprpreconfig

exit 0