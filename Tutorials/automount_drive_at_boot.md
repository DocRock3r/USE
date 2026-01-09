## 1. Find the location of the drive using `lsblk`
- ex. `/dev/sdb`

## 2. Make a new partition on the disk
1. `fdisk /dev/[location of hdd]`  
    - ex. `fdisk /dev/sdb`  
2. `n` to make a new partiton  
3. `w` to save changes  
	
## 3. Confirm that the new partition was created
- `lsblk`
    - ex. `/dev/sdb1`

## 4. Make a file system on the new partiton
- `mkfs -t ext4 /dev/[location of partition]`
    - ex. `mkfs -t ext4 /dev/sdb1`
	
## 5. Make a directory to mount HDD to
 - `sudo mkdir /mnt/hdd`

## 6. Get the UUID for the drive to be mounted
- `lsblk -fs`

## 7. Make a backup of /etc/fstab
- `sudo cp /etc/fstab /etc/fstab.bk`
- In case anything goes wrong you can restore this backup version
    - `sudo cp /etc/fstab.bk /etc/fstab`

## 8. Add the new harddrive to /etc/fstab so that it is automatically mounted when the system boots
1. `sudo nano /etc/fstab`
2. add the line `UUID=[drive UUID] [mount location] ext4 defaults,auto,rw 0 0`
    - ex. `UUID=4579acc6-e00d-433b-8087-0a75506e7a9c /mnt/hdd ext4 defaults,auto,rw 0 0`
	
## 9. Restart the system to confirm that drive mounts at boot
