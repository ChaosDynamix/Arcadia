---
title: Storage
---

# Storage
This page describes how to setup the optional swapfile of the system and activate the TRIM timer. The TRIM timer is strongly recommended if you have a compatible NVMe storage device.

## Setup the swapfile

Optional

A swap partition/file is not strictly required, but recommended for systems with low RAM. If you want to use hibernation, you will need a swap partition/file. The following table has recommendations for swap partition size.

| System RAM | Recommended swap size  | Swap size if using hibernation |
| :--------- | :--------------------- | :----------------------------- |
| <2GB       | 2x the amount of RAM   | 3x the amount of RAM           |
| 2-8GB      | Equal to amount of RAM | 2x the amount of RAM           |
| 8-64GB     | At least 4GB           | 1.5x the amount of RAM         |
| 64GB       | At least 4GB           | Hibernation not recommended    |

### Create the swapfile
```
dd if=/dev/zero of=/swapfile bs=1M count=4000 status=progress
```

**Note**: This command create a 4GB "swapfile", Replace `count=4000` if you need less or more swap size.

### Set the right permission
```
chmod 600 /swapfile
```

### Format and activate the swapfile
```
mkswap /swapfile
swapon /swapfile
```

### Edit the fstab configuration in `/etc/fstab`
```
/swapfile    none    swap    defaults    0 0
```

### References
1. [ArchWiki - Swap](https://wiki.archlinux.org/index.php/Swap#Swap_file)
1. [Void Linux - Swap partition](https://docs.voidlinux.org/installation/live-images/partitions.html)
1. [ManPage - Dd](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/coreutils/dd.1.en)
1. [ManPage - Chmod](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/coreutils/chmod.1.en)
1. [ManPage - Mkswap](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/util-linux/mkswap.8.en)
1. [ManPage - Swapon](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/man-pages/swapon.2.en)

## Enable periodic TRIM

SOLID STATE DRIVE

A trim command (known as TRIM in the ATA command set, and UNMAP in the SCSI command set) allows an operating system to inform a solid-state drive (SSD) which blocks of data are no longer considered in use and can be wiped internally.

### Check if your Solid State Drive has TRIM support
DISC-GRAN (discard granularity) and DISC-MAX (discard max bytes) columns must show non-zero values.

```
lsblk --discard
```

### Activate weekly fstrim service
```
systemctl enable fstrim.timer
```

#### References
1. [ArchWiki - Solid state drive / TRIM](https://wiki.archlinux.org/index.php/Solid_state_drive#TRIM)
1. [ManPage - Lsblk](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/util-linux/lsblk.8.en)
1. [ManPage - Systemctl](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/systemd/systemctl.1.en)
