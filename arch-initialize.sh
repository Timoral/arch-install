#!/bin/bash -vx

efivar -l
loadkeys uk
setfont lat9w-16
timedatectl set-ntp true
lsblk
