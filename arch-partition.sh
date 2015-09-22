#!/bin/bash -vx

efivar -l
loadkeys uk
setfont lat9w-16
timedatectl set-ntp true
lsblk
echo "Enter / partition: (/dev/sdxY)"
read ROOT_PART
pause 'Use $ROOT_PART for /? (Press [Enter])"
lsblk
echo "Enter /boot partition: (/dev/sdxY)"
read BOOT_PART
pause 'Use $ROOT_PART? (Press [Enter])"

export ROOT_PART
export BOOT_PART
