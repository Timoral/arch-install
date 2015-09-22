#!/bin/bash -vx

# init
ROOT_PART=""

sed -i '/^#.* en_GB.UTF-8 /s/^#//' /etc/locale.gen
locale-gen
echo "KEYMAP=uk" > /etc/vconsole.conf
echo "FONT=lat9w-16" >> /etc/vconsole.conf
ln -sf /usr/share/zoneinfo/Europe/London /etc/localtime
hwclock --systohc --utc
mkinitcpio -p linux
bootctl install
echo "title    Arch Linux" > /boot/loader/entries/arch.conf
echo "linux    /vmlinuz-linux" >> /boot/loader/entries/arch.conf
echo "initrd   /initramfs-linux.img" >> /boot/loader/entries/arch.conf
echo "options  root=/dev/$ROOT_PART rw" >> /boot/loader/entries/arch.conf
echo "timeout 3" > /boot/loader/loader.conf
echo "default arch" >> /boot/loader/loader.conf
