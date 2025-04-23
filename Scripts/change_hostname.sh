#! /bin/bash

clear

#get current hostname and set it as value of old_host
old_host=$(hostname)

#make backups for hostname and hosts files
cp /etc/hostname /etc/hostname.bk
cp /etc/hosts /etc/hosts.bk

#ask user for new host name and set it as value for new_host
printf "%s\n" "Hostname must be between 1-63 characters long"
printf "%s\n" "Valid characters are (lower case a-z), (0-9), and (-)"
printf "%s" "enter new hostname:  "
read new_host

#replace old_host with new_host in hostname and hosts files
#set hostname to new_host
sed -i 's/'$old_host'/'$new_host'/' /etc/hostname
sed -i 's/'$old_host'/'$new_host'/' /etc/hosts
hostname $new_host

#confirm change and tell user to restart system
printf "%s\n" "Hostname changed from [$old_host] to [$new_host]"
printf "%s\n" "Reboot your system for the change to take effect"