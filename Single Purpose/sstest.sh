#!/bin/bash

if grep -q "ruser" /etc/pam.d/screensaver
then
  sed -i.bak '/ruser/ d' /etc/pam.d/screensaver
fi

exit 0
