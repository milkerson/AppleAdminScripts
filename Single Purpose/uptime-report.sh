#!/bin/bash

up=`uptime | awk '{ print $3 }'`
units=`uptime | awk '{ print $4 }'`
uphour=`uptime | awk '{ print $3 }' | sed -e 's/\:.*//'`

notifier=/usr/bin/terminal-notifier
message="This machine was last rebooted"
title="Uptime Report"

case $units in
*sec*)
	$notifier -message "$message $up seconds ago" -title "$title" > /dev/null 2>&1
	;;
*min*)
	if [ $up = "1" ]; then
		$notifier -message "$message $up minute ago" -title "$title" > /dev/null 2>&1
	else
		$notifier -message "$message $up minutes ago" -title "$title" > /dev/null 2>&1
	fi
	;;
*day*)
	if [ $up = "1" ]; then
		$notifier -message "$message $up day ago" -title "$title" > /dev/null 2>&1
	else
		$notifier -message "$message $up days ago" -title "$title" > /dev/null 2>&1
	fi
	;;
*)
	if [ $uphour = "1" ]; then
        	$notifier -message "$message $uphour hour ago" -title "$title" > /dev/null 2>&1
	else
		$notifier -message "$message $uphour hours ago" -title "$title" > /dev/null 2>&1
	fi
	;;
esac

exit 0
