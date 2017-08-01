#!/bin/sh

#
# Name of Script: createSysctl.conf
# Description: Creates /etc/sysctl.conf for 10.10 and 10.11 Daedalus/packet issue.
# Attribution: Rob Mayoff
# Created by Mike Wilkerson
# Date created: 24 Mar 2016
# Last modified: 24 Mar 2016
# Revision 0.1
#  

ScriptLogging(){
    syslog -s -k Facility com.apple.console \
             Level Error \
             Sender "RGM_Desktop_Support - CLR-2074" \
             Message "$1"
}

# Set constants and variables
FILE="/etc/sysctl.conf"

# We do not need to check for the presence, since we'll simply
# append if it's there and create new if it's not.

# Write to the log
ScriptLogging "Writing file..."
# Write (to) the file
echo "\n# CLR-2074 \nnet.inet.tcp.sack=0" >> $FILE

exit 0