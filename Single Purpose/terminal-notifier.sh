#!/bin/bash

if [ -e /usr/bin/terminal-notifier ]; then
	exit 0
else
	gem install terminal-notifier
fi

/usr/bin/terminal-notifier -message "terminal-notifier has been installed on your machine" -title "Install Successful"

exit 0