#!/bin/bash

#gcc *.c -o pwm-demo -lglib-2.0 -I/usr/include/glib-2.0 -I/usr/lib/glib-2.0/include
gcc *.c -o glib-test -lglib-2.0 -I/usr/lib/i386-linux-gnu/glib-2.0/ -I/usr/lib/i386-linux-gnu/glib-2.0/include -I/usr/include/glib-2.0
exit 0


