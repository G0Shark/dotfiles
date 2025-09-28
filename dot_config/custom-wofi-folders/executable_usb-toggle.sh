#!/bin/bash

DEVICE="/dev/sda1"
MOUNTPOINT="/mnt/usb"

# Проверяем, смонтирован ли диск
if mountpoint -q "$MOUNTPOINT"; then
    echo "Unmounting $DEVICE..."
    umount "$MOUNTPOINT" && echo "Done."
else
    echo "Mounting $DEVICE..."
    mount -t ntfs-3g "$DEVICE" "$MOUNTPOINT" && echo "Done."
fi
