#!/bin/bash

CAHNNEL=$1
MONITOR=$2

# KYB_CH = channel on unifying receiver for the destination keyboard. Typically maps to the 1 minus the key # you press to switch keyboards
KYB_CH=0x0${CAHNNEL}
# KYB_ID = ID of the keyboard (typically this maps to the order of keyboard devices you see in the unifying software app in Advanced settings)
KYB_ID=0x02

# MSE_CH = channel on unifying receiver for the destination mouse. Typically maps 1 minus the channel button you press on the mouse to switch
MSE_CH=0x0${CAHNNEL}
# MSE_ID = ID of the mouse (typically this maps to the order of mouse devices you see in the unifying software app in Advanced settings)
MSE_ID=0x01

# These typically don't change, but tap Apple menu->About This Mac->System Report->USB->USB Receiver for Logitech 
# and make sure Product ID (RCVR_PID) and Vendor ID (RCVR_VID) are accurate 
RCVR_VID=046D
RCVR_PID=C52B

# Switch MX Keys to other device
#                                                                                                                 A        B    C    D       E       F    G
hidapitester --vidpid ${RCVR_VID}:${RCVR_PID} --usage 0x0001 --usagePage 0xFF00 --open --length 7 --send-output 0x10,${KYB_ID},0x08,0x13,${KYB_CH},0x00,0x00
# Switch MX Mouse to other device
#                                                                                                                 A       B       C   D       E      F    G
hidapitester --vidpid ${RCVR_VID}:${RCVR_PID} --usage 0x0001 --usagePage 0xFF00 --open --length 7 --send-output 0x10,${MSE_ID},0x09,0x19,${MSE_CH},0x00,0x00

# Switch the monitors
ddcutil setvcp 60 0x1${MONITOR} -d 1 &
ddcutil setvcp 60 0x1${MONITOR} -d 2 &

exit 0



