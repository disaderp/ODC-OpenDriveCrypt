cryptsetup luksOpen /dev/sda luks-sda
kpartx -av /dev/mapper/luks-sda
mount -t vfat /dev/mapper/luks-sda-part1 /root/enc
umount /root/enc
dmsetup remove luks-sda1
cryptsetup luksClose luks-sda
