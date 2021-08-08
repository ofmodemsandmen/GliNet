#!/bin/sh

. /lib/functions.sh

ROOTER=/usr/lib/rooter
ROOTER_LINK="/tmp/links"
CURRMODEM=1

log() {
	logger -t "John's Ping Test " "$@"
}

ENB=$(uci get ping.ping.enable)
if [ $ENB = 0 ]; then
	exit 0
fi

tries=0
while [[ $tries -lt 20 ]]
do
	if /bin/ping -c 1 8.8.8.8 > /dev/null 
	then
		exit 0
	fi
	sleep 10
	tries=$((tries+1))
done

CPORT=$(uci get modem.modem$CURRMODEM.commport)
if [ ! -z "$CPORT" ]; then
	ATCMDD="AT+CFUN=0;+CFUN=1,1"
	$ROOTER/gcom/gcom-locked "/dev/ttyUSB$CPORT" "run-at.gcom" "$CURRMODEM" "$ATCMDD"
else
	reboot -f
fi
