#!/bin/bash
CAHNNEL=$1
MONITOR=$2
ddcutil setvcp 60 0x1${MONITOR} -d 1 &
ddcutil setvcp 60 0x1${MONITOR} -d 2 &
solaar config "M720 Triathlon" change-host $CAHNNEL
solaar config "K850" change-host $CAHNNEL
exit 0
