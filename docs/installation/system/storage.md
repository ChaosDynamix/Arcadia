---
title: Storage
---

# Storage
This page describes how to setup the optional swapfile of the system and activate the TRIM timer. The TRIM timer is strongly recommended if you have a compatible NVMe storage device.

## Setup the swapfile
A swap partition/file is not strictly required, but recommended for systems with low RAM. If you want to use hibernation, you will need a swap partition/file. The following table has recommendations for swap partition size.

| System RAM | Recommended swap size  | Swap size if using hibernation |
| :--------- | :--------------------- | :----------------------------- |
| <2GB       | 2x the amount of RAM   | 3x the amount of RAM           |
| 2-8GB      | Equal to amount of RAM | 2x the amount of RAM           |
| 8-64GB     | At least 4GB           | 1.5x the amount of RAM         |
| 64GB       | At least 4GB           | Hibernation not recommended    |

### Create the swapfile
``` bash
dd if=/dev/zero of=/swapfile bs=1M count=4000 status=progress
```

!!! note
    This command create a 4GB "swapfile", Replace `count=4000` if you need less or more swap size.

### Set the right permission
``` bash
chmod 600 /swapfile
```

### Format and activate the swapfile
``` bash
mkswap /swapfile
swapon /swapfile
```

### Edit the fstab configuration in `/etc/fstab`
``` bash
/swapfile    none    swap    defaults    0 0
```

---

## Enable periodic TRIM
A trim command (known as TRIM in the ATA command set, and UNMAP in the SCSI command set) allows an operating system to inform a solid-state drive (SSD) which blocks of data are no longer considered in use and can be wiped internally.

### Check if your Solid State Drive has TRIM support
DISC-GRAN (discard granularity) and DISC-MAX (discard max bytes) columns must show non-zero values.

``` bash
lsblk --discard
```

### Activate weekly fstrim service
``` bash
systemctl enable fstrim.timer
```

---

??? info "References"
    - [ArchWiki - Swap](https://wiki.archlinux.org/index.php/Swap#Swap_file)
    - [Void Linux - Swap partition](https://docs.voidlinux.org/installation/live-images/partitions.html)
    - [ManPage - Dd](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/coreutils/dd.1.en)
    - [ManPage - Chmod](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/coreutils/chmod.1.en)
    - [ManPage - Mkswap](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/util-linux/mkswap.8.en)
    - [ManPage - Swapon](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/man-pages/swapon.2.en)
    - [ArchWiki - Solid state drive / TRIM](https://wiki.archlinux.org/index.php/Solid_state_drive#TRIM)
    - [ManPage - Lsblk](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/util-linux/lsblk.8.en)
    - [ManPage - Systemctl](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/systemd/systemctl.1.en)
