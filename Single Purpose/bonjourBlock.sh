#!/bin/bash

# testing the dynamic loading of firewall rules
echo "block quick proto udp from any to any port 5353" | pfctl -a custom -f -

exit 0
