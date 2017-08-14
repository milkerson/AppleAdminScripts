#!/bin/bash

#
# Name of Script: sendMessagetoHipChat
# Description: This will send a passed in message to the Closed IT Chat room
# Attribution: 
# Created by Mike Wilkerson
# Date created: 01 Feb 2017
# Last modified: 
# Revision 0.2
#  

# Set the ROOM_ID & AUTH_TOKEN variables below.
# Further instructions at https://www.hipchat.com/docs/apiv2/auth

URL="https://hipchat.rgmadvisors.com/v2/room"

if [ "$1" == "DEV" ]; then
	ROOM_ID=9  # Desktop Support
	AUTH_TOKEN=  # created for Dev in Desktop Support room
	MESSAGE=$2
elif [ "$1" == "TIPS" ]; then
	ROOM_ID=19  # Water Cooler Chat
	AUTH_TOKEN=AIZa7Z1S7Wo40kW6KQ2o41QcON9GkFyphXAyf3ak  # created for Production server in Water Cooler Chat room
	MESSAGE=$2
elif [ "$1" == "IT" ]; then
	ROOM_ID=8  # Closed IT Chat
	AUTH_TOKEN=PFKy4V576U8ll6SrSsUGsP4ypuI6GpKJPf7wZmEG  # Created for Desktop tip of the day Integration
	MESSAGE=$2
fi

curl -H "Content-Type: application/json" \
     -X POST \
     -d "{\"color\": \"purple\", \"message_format\": \"html\", \"message\": \"$MESSAGE\" }" \
     $URL/$ROOM_ID/notification?auth_token=$AUTH_TOKEN

exit 0
