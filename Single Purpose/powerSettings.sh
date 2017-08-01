#!/bin/bash

### Computer sleep: Never
/usr/bin/pmset -c sleep 0

### Display sleep: 10 min
/usr/bin/pmset -c displaysleep 10

### Put the hard disk(s) to sleep when possible: Never
/usr/bin/pmset -c disksleep 0

### Wake for network access
/usr/bin/pmset -c womp 1

### Automatically reduce brightness before display goes to sleep
/usr/bin/pmset -c halfdim 0

### Start up automatically after a power failure
/usr/bin/pmset -c autorestart 1

### Restart automatically if the computer freezes
/usr/bin/pmset -c panicrestart 15

exit 0