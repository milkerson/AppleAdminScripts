#!/bin/bash

daily=/var/log/system.log.0.bz2

if [ -e $daily ]; then
	filemtime=`stat -f "%m" $daily`
	currtime=`date +%s`
	diff=$(( (currtime - filemtime) / 86400 ))
	echo "<result>$diff</result>"
else
	periodic daily
fi

exit 0
