#/bin/sh

version=`/usr/bin/sw_vers -productVersion`

case $version in

	10.8*)
		/usr/sbin/spctl --master-enable
	;;
	10.7.5)
		/usr/sbin/spctl --master-enable
	;;
esac

exit 0