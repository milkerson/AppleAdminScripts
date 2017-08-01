#!/bin/bash

LOCAL_DATA="/Volumes/AFP_Share/RGM_Sharepoints/"
REMOTE_DATA=/Volumes/EXEMPL_DATA/_VIAAFP/
EMAIL=/tmp/remote_email_messages
ADDR=desktopsupport@rgmadvisors.com
OUT=/tmp/remote_email

# Function to provide logging of the script's actions to
# the system log.  

ScriptLogging(){
    syslog -s -k Facility com.apple.console \
             Level Error \
             Sender "RGM_Desktop_Support - VIAAFP Backup: " \
             Message "$1"
}

rm -f $EMAIL $OUT

if [ -d "$LOCAL_DATA" ]; then
   if [ -d $REMOTE_DATA ]; then
      # Instead of -a, use -rlptDq to avoid trying to set owner/group between 2 systems
      # totally different UID schemes
      rsync -rlptDq "$LOCAL_DATA" $REMOTE_DATA >> $EMAIL
   else
      ScriptLogging "Rsync failed due to mount missing: $REMOTE_DATA"
      echo "Rsync failed due to mount missing: $REMOTE_DATA" >> $EMAIL
   fi
else
   ScriptLogging "Rsync failed due to mount missing: $LOCAL_DATA"
   echo "Rsync failed due to mount missing: $LOCAL_DATA" >> $EMAIL
fi

if [ `cat $EMAIL | wc -l` -gt 0 ]; then
   ScriptLogging "Rsync failed at `date` due to errors: "
   echo "Rsync failed at `date` due to errors: " >> $OUT
   echo >> $OUT
   cat $EMAIL >> $OUT
   cat $OUT | mailx -s "Rsync Errors on MiniGR" $ADDR
fi