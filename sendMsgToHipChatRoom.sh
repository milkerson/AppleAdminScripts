#!/bin/bash

#
# Name of Script: sendMessagetoHipChat
# Description: This will send a passed in message to the desired HipChat room.
# Attribution: 
# Created by Mike Wilkerson
# Date created: 01 Feb 2017
# Last modified: 14 Aug 2017
# Revision 0.3
#  
# USAGE: Pass in room nickname ($1) followed by the message to pass in ($2).
#

# Further instructions for passing messages to rooms can be found at:
# https://www.hipchat.com/docs/apiv2/auth

URL="https://sub.yourdomain.com/v2/room"

# Set the ROOM_ID & AUTH_TOKEN variables below.

if [ "$1" == "NICKNAME1" ]; then
	ROOM_ID=X  # Replace X with the ROOM ID
	AUTH_TOKEN=XXXXX  # Replace XXXXX with Auth token for room
	MESSAGE=$2
elif [ "$1" == "NICKNAME2" ]; then
	ROOM_ID=X  # Replace X with the ROOM ID
	AUTH_TOKEN=XXXXX  # Replace XXXXX with Auth token for room
	MESSAGE=$2
elif [ "$1" == "NICKNAME3" ]; then
	ROOM_ID=X  # Replace X with the ROOM ID
	AUTH_TOKEN=XXXXX  # Replace XXXXX with Auth token for room
	MESSAGE=$2
fi

curl -H "Content-Type: application/json" \
     -X POST \
     -d "{\"color\": \"purple\", \"message_format\": \"html\", \"message\": \"$MESSAGE\" }" \
     $URL/$ROOM_ID/notification?auth_token=$AUTH_TOKEN

exit 0