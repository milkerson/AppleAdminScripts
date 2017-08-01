#!/bin/bash

csUtilities=/Applications/Utilities/Casper\ Suite/
rgmadminCS=/Users/rgmadmin/Applications/Casper\ Suite/

if [[ -e $csUtilities ]]; then
	rm -fR /Applications/Utilities/Casper\ Suite/
fi

if [[ -e $rgmadminCS ]]; then
	rm -fR /Users/rgmadmin/Applications/Casper\ Suite/
fi

exit 0