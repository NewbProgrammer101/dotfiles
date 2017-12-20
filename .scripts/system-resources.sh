#!/bin/bash
echo "CPU Information:"
lscpu
echo
echo "Partitions:"
lsblk
echo
echo "IPC information:"
lsipc
echo
echo "USB info:"
lsusb -v
echo
echo "PCI devices:"
sudo lspci -nnk
echo
echo "Login Information of Users:"
lslogins 
echo
lslocks
echo
echo "Other info:"
cat /proc/cmdline
uname -s -n -r -m -i -o
cat /proc/consoles
cat /proc/filesystems
echo
echo "System Framebuffer:"; cat /proc/fb
echo
echo "RTC Info:"; cat /proc/driver/rtc

bash ~/.scripts/system-resources.sh > ~/.logs/system.log
echo "##################################################"
echo "Reference information found at ~/.logs/system.log"
