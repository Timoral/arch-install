#!/bin/bash -vx
# init
function pause(){
   read -p "$*"
}

lsblk
echo "Enter / partition: (/dev/sdxY)"
read ROOT_PART
pause 'Use $ROOT_PART for /? (Press [Enter])"
lsblk
echo "Enter /boot partition: (/dev/sdxY)"
read BOOT_PART
pause 'Use $ROOT_PART? Press [Enter]'

export ROOT_PART
export BOOT_PART

# main
mount ROOT_PART /mnt
mkdir /mnt/boot
mount BOOT_PART /mnt/boot
pause 'Press [Enter]to continue...'
pacstrap /mnt base base-devel
genfstab -U /mnt > /mnt/etc/fstab
cat /mnt/etc/fstab
pause 'Press [Enter] key if fstab is correct...'
cp arch-post-install.sh /mnt/
arch-chroot /mnt /bin/bash
