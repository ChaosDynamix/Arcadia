---
layout: default
title: Lvm
nav_order: 2
parent: 04 Installation
permalink: /installation/lvm/
---

# Installation for LVM
{: .no_toc}

---

## Table of contents
{: .no_toc .text-delta .mt-6}

1. TOC
{:toc}

---

```
+------------------------+-------------------------------------------------+
| EFI system partition   | LUKS1 encrypted partition                       |
| /efi                   | /dev/mapper/lvm                                 |
|                        +-------------------------------------------------+
|                        |                                                 |
| /dev/sda1              | /dev/sda2                                       |
+------------------------+-------------------------------------------------+
```

```
+--------------------------------------------------------------------------+
|                             Physical volume                              |
|                             /dev/mapper/lvm                              |
+--------------------------------------------------------------------------+
|                              Group volume                                |
|                                /dev/grp/                                 |
+------------------------+------------------------+------------------------+
| Logical volume 1       | Logical volume 2       | Logical volume 3       |
| [SWAP]                 | /                      | /home                  |
| /dev/grp/swap          | /dev/grp/root          | /dev/grp/home          |
+------------------------+------------------------+------------------------+
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

| Partition | Mounting point | Partition type                     | Size     |
| :-------- | :------------- | :--------------------------------- | :------- |
| /dev/sda1 | /efi           | EFI system partition               | 512M     |
| /dev/sda2 |                | Linux Logical Volume Manager (LVM) | 100%FREE |

| Partition guid                       | Description                        |
| :----------------------------------- | :--------------------------------- |
| C12A7328-F81F-11D2-BA4B-00A0C93EC93B | EFI System partition               |
| E6D6D379-F507-44C2-A23C-238F2A3DF928 | Linux Logical Volume Manager (LVM) |

1. Open the partitioning tool of your choice
1. Create a GPT partition table
1. Efi partition
   1. Create a new partition of 512MiB
   1. Change the type of the partition to `EFI system`
1. Lvm partition
   1. Create a new partition with all the remaining space of your drive
   1. Change the type of the partition to `Linux LVM`
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
$ cryptsetup open /dev/sdXY lvm
```

### References
{: .no_toc .text-delta .pt-4}

1. [ArchWiki - Encrypting an entire system - LVM on LUKS](https://wiki.archlinux.org/index.php/Dm-crypt/Encrypting_an_entire_system#LVM_on_LUKS)
1. [ArchWiki - GRUB - Encrypted /boot](https://wiki.archlinux.org/index.php/GRUB#Encrypted_/boot)
1. [Man page - cryptsetup](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/cryptsetup/cryptsetup.8.en)

---

## Setup the Logical Volume Manager

### Physical volume
{: .no_toc .pt-2}

```bash
$ pvcreate /dev/mapper/lvm
```

### Volume group
{: .no_toc .pt-4}

```bash
$ vgcreate grp /dev/mapper/lvm
```

### Logical volumes
{: .no_toc .pt-4}

```bash
$ lvcreate -L 8G grp -n swap
$ lvcreate -L 20G grp -n root
$ lvcreate -l 100%FREE grp -n home
```

#### References
{: .no_toc .text-delta .pt-4}

1. [ArchWiki - LVM on LUKS - Preparing the logical volumes](https://wiki.archlinux.org/index.php/Dm-crypt/Encrypting_an_entire_system#Preparing_the_logical_volumes)
1. [ArchWiki - LVM - Volume operations](https://wiki.archlinux.org/index.php/LVM#Volume_operations)
1. [ArchWiki - Partitioning - Discrete partitions](https://wiki.archlinux.org/index.php/Partitioning#Discrete_partitions)
1. [VOID Linux Partitions Notes - SWAP partitions](https://docs.voidlinux.org/installation/live-images/partitions.html#swap-partitions)
1. [Man page - pvcreate](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/lvm2/pvcreate.8.en)
1. [Man page - vgcreate](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/lvm2/vgcreate.8.en)
1. [Man page - lvcreate](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/lvm2/lvcreate.8.en)

---

## Configuring the logical volumes

### Format the partitions
{: .no_toc .pt-2}

```bash
# Format the EXT4 filesystem partitions
$ mkfs.ext4 -L ROOT /dev/grp/root
$ mkfs.ext4 -L HOME /dev/grp/home

# Format the FAT32 filesystem partition
$ mkfs.fat -F32 -n EFI /dev/sda1
```

### Setup the Swap partition
{: .no_toc .pt-4}

```bash
# Format the Swap partition
$ mkswap -L SWAP /dev/grp/swap

# Activate the Swap partition
$ swapon /dev/grp/swap
```

### Mount the partitions
{: .no_toc .pt-4}

```bash
# Mount the root partition
$ mount /dev/grp/root /mnt

# Create directories
$ mkdir /mnt/{home,efi}

# Mount the home and efi partitions
$ mount /dev/grp/home /mnt/home
$ mount /dev/sda1 /mnt/efi
```

### References
{: .no_toc .text-delta .pt-4}

1. [ArchWiki - Installation guide - Format the partitions](https://wiki.archlinux.org/index.php/Installation_guide#Format_the_partitions)
1. [ArchWiki - Installation guide - Mount the file systems](https://wiki.archlinux.org/index.php/Installation_guide#Mount_the_file_systems)
1. [ArchWiki - EFI system partition](https://wiki.archlinux.org/index.php/EFI_system_partition)
1. [Man page - mkfs.ext4](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/e2fsprogs/mkfs.ext4.8.en)
1. [Man page - mkfs.fat](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/dosfstools/mkfs.fat.8.en)
1. [Man page - mkswap](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/util-linux/mkswap.8.en)
1. [Man page - swapon](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/man-pages/swapon.2.en)
1. [Man page - mkdir](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/coreutils/mkdir.1.en)
1. [Man page - mount](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/util-linux/mount.8.en)

---

## Install Arch Linux essential packages

install packages to the specified new root directory.

```bash
pacstrap /mnt base base-devel linux linux-firmware lvm2 vim man-db man-pages
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
