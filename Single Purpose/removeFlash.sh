#!/bin/sh

if [ -e "/Library/Internet Plug-Ins/Flash Player.plugin" ]; then
	/bin/mkdir "/Library/Internet Plug-Ins (Disabled)/"
	/bin/mv "/Library/Internet Plug-Ins/Flash Player.plugin" "/Library/Internet Plug-Ins (Disabled)/"
	/bin/mv "/Library/Internet Plug-Ins/flashplayer.xpt" "/Library/Internet Plug-Ins (Disabled)/"
fi

if [ -e "/Library/Internet Plug-Ins/NP-PPC-Dir-Shockwave" ]; then
	/bin/mv "/Library/Internet Plug-Ins/NP-PPC-Dir-Shockwave" "/Library/Internet Plug-Ins (Disabled)/"	
fi

exit 0
