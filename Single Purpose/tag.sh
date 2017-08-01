#!/bin/bash

# Get asset tag via dialog box
asset=$(/usr/bin/osascript << EOT
	tell application "Finder"
		activate
		display dialog "Enter your asset tag" default answer "RGM0"
		set theAnswer to (text returned of result)
	end tell
	)
	
assetTrim=`echo "$asset" | tail -c 5`

echo $asset
echo $assetTrim

