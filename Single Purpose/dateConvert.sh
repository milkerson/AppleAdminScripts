#!/bin/bash

now=`/bin/date`
newDate=`date -j -f "%a %b %d %T %Z %Y" "$now" "+%s"`
bootTime=`sysctl -n kern.boottime | cut -c 9-18`
count=`expr $newDate - $bootTime`

echo $count

if [ "$count" -lt 300 ]; then
	/bin/sleep 30
fi