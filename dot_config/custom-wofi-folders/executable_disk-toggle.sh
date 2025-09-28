#!/bin/bash

DEVICE="/dev/nvme1n1p1"
MOUNTPOINT="/mnt/d1"

# Проверяем, смонтирован ли диск
if mountpoint -q "$MOUNTPOINT"; then
    echo "Unmounting $DEVICE..."
    umount "$MOUNTPOINT" && echo "Done."
else
    echo "Mounting $DEVICE..."
    mount -t ntfs-3g "$DEVICE" "$MOUNTPOINT" && echo "Done."
fi
