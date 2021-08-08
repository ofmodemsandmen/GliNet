#!/bin/sh 
. /lib/functions.sh

echo "1" > /sys/class/gpio/gpio0/value
sleep 3

