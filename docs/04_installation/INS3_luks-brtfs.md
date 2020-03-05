---
layout: default
title: Luks-Btrfs
nav_order: 3
parent: 04 Installation
permalink: /installation/luks-btrfs/
has_toc: false
---

# Installation for Luks-Btrfs
{: .no_toc}

---

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

```
+------------------------+-------------------------------------------------+
| EFI system partition   | LUKS1 encrypted partition                       |
| /efi                   | /dev/mapper/btrfs                               |
|                        +-------------------------------------------------+
| /dev/sda1              | /dev/sda2                                       |
+------------------------+-------------------------------------------------+
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

## Secure erase the drive
{: .d-inline-block}

IRREVERSIBLE DATA ERASE
{: .label .label-red .mx-2}

Before setting up disk encryption on a (part of a) disk, consider securely wiping it first. This consists of overwriting the entire drive or partition with a stream of zero bytes or random bytes, and is done for one or both of the following reasons

- Prevent recovery of previously stored data
- Prevent disclosure of usage patterns on the encrypted drive

```bash
# Open the container
$ cryptsetup open --type plain -d /dev/urandom /dev/sda erase_drive

# Secure erase the drive
$ dd if=/dev/zero of=/dev/mapper/erase_drive status=progress

# Close the container
$ cryptsetup close erase_drive
```

### References
{: .no_toc .text-delta .pt-4}

1. [ArchWiki - Dm-crypt - Drive preparation - Secure erasure of the hard disk drive](https://wiki.archlinux.org/index.php/Dm-crypt/Drive_preparation#Secure_erasure_of_the_hard_disk_drive)
1. [Man page - cryptsetup](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/cryptsetup/cryptsetup.8.en)
1. [Man page - dd](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/coreutils/dd.1.en)

---

## Partition the drive

| Partition | Mounting point | Partition type       | Size     |
| :-------- | :------------- | :------------------- | :------- |
| /dev/sda1 | /efi           | EFI system partition | 512M     |
| /dev/sda2 |                | Linux Filesystem     | 100%FREE |

| Partition guid                       | Description                        |
| :----------------------------------- | :--------------------------------- |
| C12A7328-F81F-11D2-BA4B-00A0C93EC93B | EFI System partition               |
| 0FC63DAF-8483-4772-8E79-3D69D8477DE4 | Linux Filesystem                   |

1. Open the partitioning tool of your choice
1. Create a GPT partition table
1. Efi partition
   1. Create a new partition of 512MiB
   1. Change the type of the partition to `EFI system`
1. Lvm partition
   1. Create a new partition with all the remaining space of your drive
   1. Change the type of the partition to `Linux Filesystem`
1. Write and exit

### References
{: .no_toc .text-delta .pt-4}

1. [Wikipedia - GUID partition table](https://en.wikipedia.org/wiki/GUID_Partition_Table)
1. [ArchWiki - Partitioning - Partitioning tools](https://wiki.archlinux.org/index.php/Partitioning#Partitioning_tools)
1. [ArchWiki - EFI system partition - Create the partition](https://wiki.archlinux.org/index.php/EFI_system_partition#Create_the_partition)

---

## Encrypting the partition

```bash
# Create the container
$ cryptsetup --type luks1 luksFormat /dev/sda2

# Open the container
$ cryptsetup open /dev/sda2 btrfs
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

# Format the FAT32 filesystem partition
$ mkfs.fat -F32 -n EFI /dev/sda1
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

# Create the directories
$ mkdir /mnt/{home,.snapshots,.swap}

# Mount the subvolumes
$ mount -o compress=zstd,subvol=@ /dev/mapper/btrfs /mnt
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
$ mkdir /mnt/efi

# Mount the EFI partition
$ mount /dev/sda1 /mnt/efi
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
$ pacstrap /mnt base base-devel linux linux-firmware btrfs-progs vim man-db man-pages
```

### References
{: .no_toc .text-delta .pt-4}

1. [ArchWiki - Installation guide - Install essential packages](https://wiki.archlinux.org/index.php/Installation_guide#Install_essential_packages)
1. [Man page - pacstrap](https://jlk.fjfi.cvut.cz/arch/manpages/man/extra/arch-install-scripts/pacstrap.8.en)

---

## Generate static information about the filesystems

```bash
$ genfstab -U /mnt >> /mnt/etc/fstab
```

### References
{: .no_toc .text-delta .pt-4}

1. [ArchWiki - Installation guide - Fstab](https://wiki.archlinux.org/index.php/Installation_guide#Fstab)
1. [ArchWiki - Fstab](https://wiki.archlinux.org/index.php/Fstab)

---

## Enter the system

```bash
$ arch-chroot /mnt
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
