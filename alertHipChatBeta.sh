#!/bin/bash

#
# Name of Script: alertHipChatBeta
# Description: 
# Attribution:
# Created by Mike Wilkerson
# Date created: 23 Feb 2017
# Last modified: 
# Revision 0.1
#  

URL="https://hipchat.rgmadvisors.com/v2/room"
ROOM_ID=$1
AUTH_TOKEN=$2
MESSAGE=$3

curl -H "Content-Type: application/json" \
     -X POST \
     -d "{\"color\": \"red\", \"message_format\": \"html\", \"message\": \"$MESSAGE\" }" \
     $URL/$ROOM_ID/notification?auth_token=$AUTH_TOKEN

exit 0