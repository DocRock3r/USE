# Add new partion and add partion to existing LVM	
## 1. Add new partion using fdisk
- `sudo fdisk /dev/[drive containing partition you want to expand]`  
    - ex. if you want to expand partion sda3 you would use `sudo fdisk /dev/sda`  
- use `p` to list partiton talble  
use `F` to list free space on drive  
use `n` to create a new partion  
use `w` to save changes  

## 2. Add new partion to existing lvm  
- use `lsblk` to list all drives, partitions, and lvms  
### 2.1 Create a new physical volume(pv)  
- `sudo pvcreate /dev/[partiton you want to use]`  
    - ex. `sudo pvcreate /dev/sda4`  
### 2.2 Identify the volume group(vg) you want to use  
- you can use `sudo vgs` to list all available volume groups  
### 2.3 Extend volume group  
- `sudo vgextend [volume group] /dev/[partition]`  
    - ex. `sudo vgextend ubuntu-vg /dev/sda4`  
### 2.4 Identify the logical volume(lv) you want to use  
- you can use `sudo lvs` to list all available logical volumes  
### 2.5 Extend logical volume  
- `sudo lvextend -l +100%FREE /dev/[volume group]/[logical volume]`  
    - ex. `sudo lvextend -l +100%FREE /dev/ubuntu-vg/ubuntu-lv`  

## 3. Resize filesystem so system sees changes  
- `sudo resize2fs /dev/[volume group]/[logical volume]`  
    - ex. `sudo resize2fs/dev/ubuntu-vg/ubuntu-lv`  




# Expand existing partion  
1. `sudo growpart /dev/[disk] [partition number]`  
    - ex. `sudo growpart /dev/sda 3`  
    - ***note the space between disk and partion number***  
2. `sudo resize2fs /dev/[partition]`  
    - ex. `sudo resize2fs /dev/sda3`  

# Expand existing lvm to use whole partition  
- `sudo lvextend -l +100%FREE /dev/[volume group]/[logical volume]`  
    - ex. `sudo lvextend -l +100%FREE /dev/ubuntu-vg/ubuntu-lv`  