#!/bin/bash

if [ -e /var/db/.AppleSetupDone ]; then
	rm -f /var/db/.AppleSetupDone
fi

/usr/bin/touch /var/db/.AppleSetupDone
chmod 204 /var/db/.AppleSetupDone

exit 0
