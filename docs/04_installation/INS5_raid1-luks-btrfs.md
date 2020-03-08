---
layout: default
title: Raid1-Luks-Btrfs
nav_order: 5
parent: 04 Installation
permalink: /installation/raid1-luks-btrfs/
---

# Installation for Raid1-Luks-Btrfs
{: .no_toc}

---

## Table of contents
{: .no_toc .text-delta .mt-6}

1. TOC
{:toc}

---

```
Drive 1                                Drive 2
+------------+--------------------- +  +------------+----------------------+
| EFI system | LUKS1 encrypted      |  | EFI system | LUKS1 encrypted      |
| partition  | volume               |  | partition  | volume               |
| /efi1      | /dev/mapper/btrfs    |  | /efi2      | /dev/mapper/btrfs    |
|            +--------------------- +  |            +----------------------+
|            | RAID1 array (part 1) |  |            | RAID1 array (part 2) |
|            | /dev/md/cryptbtrfs   |  |            | /dev/md/cryptbtrfs   |
|            +--------------------- +  |            +----------------------+
| /dev/sda1  | /dev/sda2            |  | /dev/sdb1  | /dev/sdb2            |
+------------+--------------------- +  +------------+----------------------+
```

```
subvolid=5 (/dev/mapper/btrfs)
   |
   ├── @ (mounted as /)
   |       |
   |       ├── /home                  (mounted @home subvolume)
   |       ├── /.snapshots            (mounted @snapshots subvolume)
   |       ├── /.swap                 (mounted @swap subvolume)
   |       |
   |       ├── /var/cache/pacman/pkg  (nested subvolume)
   |       ├── /var/abs               (nested subvolume)
   |       ├── /var/tmp               (nested subvolume)
   |       ├── /srv                   (nested subvolume)
   |       |
   ├── @home (mounted as /home)
   ├── @snapshots (mounted as /.snapshots)
   └── @swap (mounted as /.swap)
```

---

## Secure erase the drives
{: .d-inline-block}

IRREVERSIBLE DATA ERASE
{: .label .label-red .mx-2}

Before setting up disk encryption on a (part of a) disk, consider securely wiping it first. This consists of overwriting the entire drive or partition with a stream of zero bytes or random bytes, and is done for one or both of the following reasons

- Prevent recovery of previously stored data
- Prevent disclosure of usage patterns on the encrypted drive

```bash
# Open the containers
$ cryptsetup open --type plain -d /dev/urandom /dev/sda erase_drive1
$ cryptsetup open --type plain -d /dev/urandom /dev/sdb erase_drive2

# Secure erase the drives
$ dd if=/dev/zero of=/dev/mapper/erase_drive1 status=progress
$ dd if=/dev/zero of=/dev/mapper/erase_drive2 status=progress

# Close the containers
$ cryptsetup close erase_drive1
$ cryptsetup close erase_drive2
```

### References
{: .no_toc .text-delta .pt-4}

1. [ArchWiki - Dm-crypt - Drive preparation - Secure erasure of the hard disk drive](https://wiki.archlinux.org/index.php/Dm-crypt/Drive_preparation#Secure_erasure_of_the_hard_disk_drive)
1. [Man page - cryptsetup](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/cryptsetup/cryptsetup.8.en)
1. [Man page - dd](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/coreutils/dd.1.en)

---

## Partition the drives

| Device | Partition | Partition type       | Size            |
| :----- | :-------- | :------------------- | :-------------- |
| 1      | /dev/sda1 | EFI system partition | 512M            |
| 1      | /dev/sda2 | Linux RAID partition | 100%FREE - 100M |
| 2      | /dev/sdb1 | EFI system partition | 512M            |
| 2      | /dev/sdb2 | Linux RAID partition | 100%FREE - 100M |

### With sgdisk
{: .no_toc .pt-4}

```bash
# Edit the sizes accordingly
$ sgdisk -o -n=1:0:+512M -n=2:0:-100M -t=1:ef00 -t=2:fd00 -R=/dev/sdb /dev/sda
$ sgdisk -G /dev/sdb
```

### References
{: .no_toc .text-delta .pt-4}

1. [Wikipedia - GUID partition table](https://en.wikipedia.org/wiki/GUID_Partition_Table)
1. [ArchWiki - Partitioning - Partitioning tools](https://wiki.archlinux.org/index.php/Partitioning#Partitioning_tools)
1. [ArchWiki - EFI system partition - Create the partition](https://wiki.archlinux.org/index.php/EFI_system_partition#Create_the_partition)

---

## Setup RAID array

### Create a RAID1 array
{: .no_toc .pt-2}

```bash
$ mdadm --create --verbose --level=1 --metadata=1.2 --raid-devices=2 /dev/md/cryptbtrfs /dev/sda2 /dev/sdb2
```

### Check the synchronization of the array
{: .no_toc .pt-2}

```bash
$ watch /proc/mdstat
```

### References
{: .no_toc .text-delta .pt-4}

1. [ArchWiki - RAID](https://wiki.archlinux.org/index.php/RAID)

---

## Encrypting the partition

```bash
# Create the container
$ cryptsetup --type luks1 luksFormat /dev/md/cryptbtrfs

# Open the container
$ cryptsetup open /dev/md/cryptbtrfs btrfs
```

### References
{: .no_toc .text-delta .pt-4}

1. [ArchWiki - Encrypting an entire system - LVM on LUKS](https://wiki.archlinux.org/index.php/Dm-crypt/Encrypting_an_entire_system#LVM_on_LUKS)
1. [ArchWiki - GRUB - Encrypted /boot](https://wiki.archlinux.org/index.php/GRUB#Encrypted_/boot)
1. [Man page - cryptsetup](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/cryptsetup/cryptsetup.8.en)

---

## Configuring the partitions

### Format the partitions
{: .no_toc .pt-2}

```bash
# Format the BTRFS filesystem partition
$ mkfs.btrfs -L BTRFS /dev/mapper/btrfs

# Format the FAT32 filesystem partitions
$ mkfs.fat -F32 -n EFI /dev/sda1
$ mkfs.fat -F32 -n EFI /dev/sdb1
```

### Mount the partition
{: .no_toc .pt-4}

```bash
$ mount -o compress=zstd /dev/mapper/btrfs /mnt
```

### References
{: .no_toc .text-delta .pt-4}

1. [ArchWiki - Dm-crypt - Encrypting an entire system - Btrfs subvolumes with swap](https://wiki.archlinux.org/index.php/Dm-crypt/Encrypting_an_entire_system#Btrfs_subvolumes_with_swap)
1. [ArchWiki - Btrfs](https://wiki.archlinux.org/index.php/Btrfs)
1. [Man page - mkfs.brfs](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/btrfs-progs/mkfs.btrfs.8.en)
1. [Man page - mkfs.fat](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/dosfstools/mkfs.fat.8.en)
1. [Man page - mount](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/util-linux/mount.8.en)

---

## Setup the BTRFS subvolumes

### Create top-level subvolumes
{: .no_toc .pt-2}

```bash
$ btrfs subvolume create /mnt/@
$ btrfs subvolume create /mnt/@home
$ btrfs subvolume create /mnt/@snapshots
$ btrfs subvolume create /mnt/@swap
```

### Mount top-level subvolumes
{: .no_toc .pt-4}

```bash
# Umount
$ umount /dev/mapper/btrfs /mnt

# Mount the main subvolume
$ mount -o compress=zstd,subvol=@ /dev/mapper/btrfs /mnt

# Create the directories
$ mkdir /mnt/{home,.snapshots,.swap}

# Mount the subvolumes
$ mount -o compress=zstd,subvol=@home /dev/mapper/btrfs /mnt/home
$ mount -o compress=zstd,subvol=@snapshots /dev/mapper/btrfs /mnt/.snapshots
$ mount -o compress=zstd,subvol=@swap /dev/mapper/btrfs /mnt/.swap
```

### Create nested subvolumes
{: .no_toc .pt-4}

```bash
# Create the directories
$ mkdir -p /mnt/var/cache/pacman

# Create the nested subvolumes
$ btrfs subvolume create /mnt/var/cache/pacman/pkg
$ btrfs subvolume create /mnt/var/abs
$ btrfs subvolume create /mnt/var/tmp
$ btrfs subvolume create /mnt/srv

# List all the subvolumes
$ btrfs subvolume list -p /mnt
```

### References
{: .no_toc .text-delta .pt-4}

1. [ArchWiki - Dm-crypt - Encrypting an entire system - Btrfs subvolumes with swap](https://wiki.archlinux.org/index.php/Dm-crypt/Encrypting_an_entire_system#Btrfs_subvolumes_with_swap)
1. [ArchWiki - Btrfs](https://wiki.archlinux.org/index.php/Btrfs)
1. [Man page - btrfs](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/btrfs-progs/btrfs.8.en)
1. [Man page - mkdir](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/coreutils/mkdir.1.en)
1. [Man page - mount](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/util-linux/mount.8.en)
1. [Man page - umount](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/man-pages/umount.2.en)

---

## Mount the EFI partition

```bash
# Create directory
$ mkdir /mnt/{efi1,efi2}

# Mount the EFI partitions
$ mount /dev/sda1 /mnt/efi1
$ mount /dev/sdb1 /mnt/efi2
```

### References
{: .no_toc .text-delta .pt-4}

1. [ArchWiki - Dm-crypt - Encrypting an entire system - Btrfs subvolumes with swap](https://wiki.archlinux.org/index.php/Dm-crypt/Encrypting_an_entire_system#Btrfs_subvolumes_with_swap)
1. [ArchWiki - EFI system partition](https://wiki.archlinux.org/index.php/EFI_system_partition)
1. [Man page - mkdir](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/coreutils/mkdir.1.en)
1. [Man page - mount](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/util-linux/mount.8.en)

---

## Install Arch Linux essential packages

install packages to the specified new root directory.

```bash
pacstrap /mnt base base-devel linux linux-firmware btrfs-progs mdadm vim man-db man-pages
```

### References
{: .no_toc .text-delta .pt-4}

1. [ArchWiki - Installation guide - Install essential packages](https://wiki.archlinux.org/index.php/Installation_guide#Install_essential_packages)
1. [Man page - pacstrap](https://jlk.fjfi.cvut.cz/arch/manpages/man/extra/arch-install-scripts/pacstrap.8.en)

---

## Generate static information about the filesystems

```bash
genfstab -U /mnt >> /mnt/etc/fstab
```

### References
{: .no_toc .text-delta .pt-4}

1. [ArchWiki - Installation guide - Fstab](https://wiki.archlinux.org/index.php/Installation_guide#Fstab)
1. [ArchWiki - Fstab](https://wiki.archlinux.org/index.php/Fstab)

---

## Enter the system

```bash
arch-chroot /mnt
```

### References
{: .no_toc .text-delta .pt-4}

1. [ArchWiki - Installation guide - Chroot](https://wiki.archlinux.org/index.php/Installation_guide#Chroot)

---

## Create Swap file

### Create the Swap file
{: .no_toc .pt-2}

```bash
$ truncate -s 0 /.swap/swapfile
$ chattr +C /.swap/swapfile
$ btrfs property set /.swap/swapfile compression none

$ fallocate -l 2G /.swap/swapfile
$ chmod 600 /.swap/swapfile
```

### Format the Swap file
{: .no_toc .pt-4}

```bash
$ mkswap /.swap/swapfile
```

### Activate the Swap file
{: .no_toc .pt-4}

```bash
$ swapon /.swap/swapfile
```

### Add the Swap file to the fstab
{: .no_toc .pt-4}

/etc/fstab
{: .fs-3 .mb-0}

```bash
/.swap/swapfile     none      swap      defaults      0 0
```

### References
{: .no_toc .text-delta .pt-4}

1. [ArchWiki - Swap - Swap file](https://wiki.archlinux.org/index.php/Swap#Swap_file)
1. [Man page - truncate](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/coreutils/truncate.1.en)
1. [Man page - chattr](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/e2fsprogs/chattr.1.en)
1. [Man page - btrfs](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/btrfs-progs/btrfs.8.en)
1. [Man page - fallocate](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/util-linux/fallocate.1.en)
1. [Man page - chmod](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/coreutils/chmod.1.en)
1. [Man page - mkswap](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/util-linux/mkswap.8.en)
1. [Man page - swapon](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/man-pages/swapon.2.en)
