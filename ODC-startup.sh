#!/bin/bash

#enforce interactivity
exec < /dev/tty1

DEVICE=$( cat /root/devid )
SETUP=$( cat /root/setup )

#jumper override
#TODO


if [ $SETUP -eq 0 ] ; then
	#signal password prompt
	echo "heartbeat" > /sys/class/leds/orangepi:red:status/trigger
	
	#setup luks container
	cryptsetup -q luksFormat $DEVICE
	
	#error chk
	if [ $? -ne 0 ] ; then
		#signal error
		echo "heartbeat" > /sys/class/leds/orangepi:green:pwr/trigger
		#need reboot/reinstall
		exit 1
	fi
	
	#signal password prompt-off
	echo "none" > /sys/class/leds/orangepi:red:status/trigger
	
	#write
	echo "1" > /root/setup
fi

#block serial access
modprobe -r g_serial

#signal password prompt
echo "heartbeat" > /sys/class/leds/orangepi:red:status/trigger

#password prompt
cryptsetup luksOpen $DEVICE luksdev

#error chk
if [ $? -ne 0 ] ; then
	#signal error
	echo "heartbeat" > /sys/class/leds/orangepi:green:pwr/trigger
	#need reboot/reinstall
	exit 1
fi

#signal password prompt
echo "none" > /sys/class/leds/orangepi:red:status/trigger

#enable g_mass_storage
modprobe g_mass_storage file=/dev/mapper/luksdev