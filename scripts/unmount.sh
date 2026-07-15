#!/bin/sh
DEVICE=$(lsblk -rno NAME,SIZE,TYPE,MOUNTPOINT | awk '$3=="part" && $4!="" {print $1" ("$2")"}' | dmenu -i -p "Unmount:")
[ -n "$DEVICE" ] && udisksctl unmount -b "/dev/$(echo $DEVICE | cut -d' ' -f1)"
