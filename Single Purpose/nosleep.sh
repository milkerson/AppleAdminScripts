#!/bin/bash

### Never go into computer sleep mode
systemsetup -setcomputersleep On >/dev/null 2>&1

### Charger sleep: Never
/usr/bin/pmset -c sleep 0 >/dev/null 2>&1

### Put the hard disk(s) to sleep when possible: Never
/usr/bin/pmset -c disksleep 0 >/dev/null 2>&1

exit 0