#!/bin/bash

jpUninstall=/Library/LaunchDaemons/net.juniper.UninstallPulse.plist

if [[ -e $jpUninstall ]]; then
        launchctl unload -w $jpUninstall
        rm $jpUninstall
fi

exit 0