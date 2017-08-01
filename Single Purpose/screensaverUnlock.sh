#!/bin/bash

/usr/libexec/PlistBuddy -c 'Set rights:system.login.screensaver:comment "The owner or any administrator can unlock the screensaver."' /etc/authorization

if grep -q "ruser" /etc/pam.d/screensaver
then
  sed -i.bak '/ruser/ d' /etc/pam.d/screensaver
else
  exit 0
fi

exit 0