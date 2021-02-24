#!/usr/bin/env bash

read -p "nhap vao o cung muon kiem tra: " DISK

echo '=======================THONG TIN DIA CUNG /dev/sda ============================='

date +"Kiem tra ngay %d thang %m nam %Y"

ORIGIN_INFO=`fdisk -l | grep $DISK`

INFO=$(echo $ORIGIN_INFO | grep -oP "(.*) bytes, (.*) sectors")
INFO=$(echo $INFO | sed 's/GiB/GB/g')
INFO=$(echo $INFO | sed 's/Disk/O cung/g')
INFO=$(echo $INFO | sed 's/\:/ co dung luong\:/g')

echo $INFO

echo "Cac phan vung:"
echo -E $(echo $ORIGIN_INFO | grep -oP "$DISK([1-9]*)")

blkid | grep $DISK | awk '{print "Phan vung " $1 " co kieu du lieu la: " $3}'
