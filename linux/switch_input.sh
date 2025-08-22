#!/bin/bash

CAHNNEL=$1
MONITOR=$2
                                                                                                               A        B    C    D       E       F    G
solaar config "M720 Triathlon" change-host $CAHNNEL &
#                                                                                                                 A       B       C   D       E      F    G
solaar config "K850" change-host $CAHNNEL &
# Switch the monitors
ddcutil setvcp 60 0x1${MONITOR} -d 1 &
ddcutil setvcp 60 0x1${MONITOR} -d 2 &

exit 0



