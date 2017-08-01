#!/bin/bash

# create directory for files
/bin/mkdir machinelogs

# copy system logs to working directory
cp /var/log/system.log* machinelogs/

# collect output of system profiler in working directory
/usr/sbin/system_profiler SPHardwareDataType > machinelogs/sp.txt

# tar and zip the directory, place on desktop
/usr/bin/tar -czvf ~/Desktop/machinelogs.tgz machinelogs/ > /dev/null 2>&1

# delete working directory
/bin/rm -fR machinelogs/

exit 0
