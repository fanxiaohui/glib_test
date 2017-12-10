#!/bin/bash

#gcc *.c -o pwm-demo -lglib-2.0 -I/usr/include/glib-2.0 -I/usr/lib/glib-2.0/include
if [ $1 = "-d" ]; then
	gcc hello_glib.c -o glib-test_debug -lglib-2.0 -I/usr/lib/i386-linux-gnu/glib-2.0/ -I/usr/lib/i386-linux-gnu/glib-2.0/include -I/usr/include/glib-2.0
elif [ $1 = "-r" ]; then

    cd /sitara/ti-sdk-am335x-evm/linux-devkit/
    . ./environment-setup

	cd /root/Desktop/80618_project/glibtest
	#arm-linux-gnueabihf-gcc hello_glib.c -o glib-test_release -lglib-2.0 -I/usr/lib/i386-linux-gnu/glib-2.0/ -I/usr/lib/i386-linux-gnu/glib-2.0/include -I/usr/include/glib-2.0
    arm-linux-gnueabihf-gcc hello_glib.c -o glib-test_release -lglib-2.0 -I/sitara/ti-sdk-am335x-evm/linux-devkit/sysroots/armv7ahf-vfp-neon-3.2-oe-linux-gnueabi/usr/lib/glib-2.0/include/ -I/sitara/ti-sdk-am335x-evm/linux-devkit/sysroots/armv7ahf-vfp-neon-3.2-oe-linux-gnueabi/usr/include/glib-2.0/

fi
exit 0


