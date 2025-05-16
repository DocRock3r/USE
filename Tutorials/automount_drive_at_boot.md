## find the location of the drive using `lsblk`
- ex. `/dev/sdb`

## make a new partition on the disk
- `fdisk /dev/[location of hdd]`  
    - ex. `fdisk /dev/sdb`  
- `n` to make a new partiton  
`w` to save changes  
	
## confirm that new partition was created
- `lsblk`
    - ex. `/dev/sdb1`

## make a file system on the partiton
- `mkfs -t ext4 /dev/[location of partition]`
    - ex. `mkfs -t ext4 /dev/sdb1`
	
## make directory to mount HDD
 - `sudo mkdir /mnt/hdd`

## get uuid for drive to be mounted
- `lsblk -fs`

## make a backup of /etc/fstab
- `sudo cp /etc/fstab /etc/fstab.bk`

## add new harddrive to /etc/fstab
- `sudo nano /etc/fstab`
- add the line `UUID=[drive UUID] [mount location] ext4 defaults,auto,rw 0 0`
    - ex. `UUID=4579acc6-e00d-433b-8087-0a75506e7a9c /mnt/hdd ext4 defaults,auto,rw 0 0`
	
## restart system to confirm that drive mounts at boot
