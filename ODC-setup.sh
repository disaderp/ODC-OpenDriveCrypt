#!/bin/bash

#install dm-crypt 
apt-get update
apt-get upgrade -y
apt-get install cryptsetup -y

echo "Listing avaliable block devices"
#block devices - disk - not ram - not mmc(boot device)
lsblk | grep disk | grep -v ram | grep -v mmc
read -r -p "Enter device from the list: " devname

echo "THE DATA ON /dev/$devname WILL BE ERASED"
read -n 1 -s -r -p "Press any key to continue..."

#disable startup g_serial
> /etc/modules

#run config on next startup
echo "0" > /root/setup

#save devname
echo "/dev/$devname" > /root/devid

#add startup script
mv -f ./ODC-startup.sh /root/ODC-startup.sh
chmod +x /root/ODC-startup.sh
echo "$(echo '/root/ODC-startup.sh' | cat - /etc/rc.local)" > /etc/rc.local

echo -e "\n\nNotice: if you are just doing a reinstall and have a working LUKS drive"
echo "Enter this command next - echo \"1\" > /root/setup"
echo "Configuration done. Make sure to plug external keyboard to USB hub"
echo "The device will now boot in headless mode with disabled USBserial interface"

#TODO: disable all internet interfaces permanently

read -n 1 -s -r -p "Press any key to finish..."