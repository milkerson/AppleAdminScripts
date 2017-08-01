#!/bin/bash

if test `find "/var/log/system.log.0.bz2" -mmin +4320`
then
	echo rotate that mother
else
	echo cool your jets
fi

exit 0
