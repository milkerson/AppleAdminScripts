#/bin/sh

version=`/usr/bin/sw_vers -productVersion`

case $version in

	10.8*)
		/usr/sbin/spctl --master-disable
	;;
	10.7.5)
		/usr/sbin/spctl --master-disable
	;;
esac

exit 0