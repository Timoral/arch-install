#!/bin/bash
# init
function pause(){
   read -p "$*"
}

# main
pacstrap /mnt base base-devel
genfstab -U /mnt > /mnt/etc/fstab
cat /mnt/etc/fstab
pause 'Press [Enter] key if fstab is correct...'
arch-chroot /mnt /bin/bash
sed -i '/^#.* en_GB.UTF-8 /s/^#//' /etc/locale.gen
locale-gen
