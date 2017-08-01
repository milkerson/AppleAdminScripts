#!/bin/bash

if [ -e "/Library/Desktop Pictures/rgm desktop image.jpg" ]; then
	`rm /System/Library/CoreServices/DefaultDesktop.jpg`
	`ln -s "/Library/Desktop Pictures/rgm desktop image.jpg" /System/Library/CoreServices/DefaultDesktop.jpg`
elif [ -e "/Library/Desktop Pictures/rgmuk desktop image.jpg" ]; then
	`rm /System/Library/CoreServices/DefaultDesktop.jpg`
	`ln -s "/Library/Desktop Pictures/rgmuk desktop image.jpg" /System/Library/CoreServices/DefaultDesktop.jpg`
fi

`killall Dock`

exit 0