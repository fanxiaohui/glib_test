#!/bin/bash

#gcc *.c -o pwm-demo -lglib-2.0 -I/usr/include/glib-2.0 -I/usr/lib/glib-2.0/include
if [ $1 = "-d" ]; then
	gcc hello_glib.c -o glib-test_debug -lglib-2.0 -I/usr/lib/i386-linux-gnu/glib-2.0/ -I/usr/lib/i386-linux-gnu/glib-2.0/include -I/usr/include/glib-2.0
	gcc hello_glib.c `pkg-config --cflags --libs glib-2.0 gthread-2.0 gobject-2.0`  -o hello_release
    gcc value.c `pkg-config --cflags --libs glib-2.0 gthread-2.0 gio-2.0 gio-2.0 gmodule-2.0`  -o value_debug
    gcc valuearray.c `pkg-config --cflags --libs glib-2.0 gthread-2.0 gio-2.0 gio-2.0 gmodule-2.0`  -o valuearray_debug
elif [ $1 = "-r" ]; then
    DIR_TOP=$(cd `dirname $0` ; pwd)

    cd /sitara/ti-sdk-am335x-evm/linux-devkit/
    . ./environment-setup

	cd $DIR_TOP
	#arm-linux-gnueabihf-gcc hello_glib.c -o glib-test_release -lglib-2.0 -I/usr/lib/i386-linux-gnu/glib-2.0/ -I/usr/lib/i386-linux-gnu/glib-2.0/include -I/usr/include/glib-2.0
    arm-linux-gnueabihf-gcc hello_glib.c -o glib-test_release -lglib-2.0 -I/sitara/ti-sdk-am335x-evm/linux-devkit/sysroots/armv7ahf-vfp-neon-3.2-oe-linux-gnueabi/usr/lib/glib-2.0/include/ -I/sitara/ti-sdk-am335x-evm/linux-devkit/sysroots/armv7ahf-vfp-neon-3.2-oe-linux-gnueabi/usr/include/glib-2.0/

	arm-linux-gnueabihf-gcc hello_glib.c `pkg-config --cflags --libs glib-2.0 gthread-2.0 gio-2.0 gio-2.0 gmodule-2.0`  -o hello_release
	arm-linux-gnueabihf-gcc value.c `pkg-config --cflags --libs glib-2.0 gthread-2.0 gio-2.0 gio-2.0 gmodule-2.0`  -o value_release
fi
exit 0


