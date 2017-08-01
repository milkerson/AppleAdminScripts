#!/bin/sh

serial=`system_profiler SPHardwareDataType | awk '/Serial Number/ { print $4 }'`

case $serial in 

	W8024FRTATN)
		# Marcie
		/usr/bin/prlsrvctl install-license -k NT18ZA-KAX0MF-W0M2Z4-YJ0S5B-RJBVFA
		;;
	C02JJ1QSDRVF)
		# robbles
		/usr/bin/prlsrvctl install-license -k JAP5D2-REEW1X-QGNC4A-3C26MY-QCT1T6
		;;
	C02F5XTYDF8X)
		# Roland
		/usr/bin/prlsrvctl install-license -k KGY9V1-V1W7WZ-B0HWX2-QT4ZPY-HDF4FE
		;;
	*)
		exit 0
		;;
		
esac

exit 0