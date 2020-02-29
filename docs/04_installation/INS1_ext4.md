---
layout: default
title: Ext4
nav_order: 1
parent: 04 Installation
permalink: /installation/ext4/
---

# Installation for EXT4
{: .no_toc}

---

| Partition | Mounting point | Partition type                | Size     |
| :-------- | :------------- | :---------------------------- | :------- |
| /dev/sda1 | /boot          | EFI system partition          | 260M     |
| /dev/sda2 | /              | Linux Root partition (x86-64) | 23 - 32G |
| /dev/sda3 | [SWAP]         | Linux Swap partition          | > 512M   |
| /dev/sda4 | /home          | Linux Home partition          | 100%FREE |

```
+-----------------+-----------------+-----------------+-----------------+
| EFI system      | Root            | Swap            | Home            |
| partition       | partition       | partition       | partition       |
|                 |                 |                 |                 |
| /boot           | /               | [SWAP]          | /home           |
| /dev/sda1       | /dev/sda2       | /dev/sda3       | /dev/sda4       |
+-----------------+-----------------+-----------------+-----------------+
```

---

## Table of contents
{: .no_toc .text-delta .mt-6}

1. TOC
{:toc}

---

## Partitioning

| Partition guid                       | Description                        |
| :----------------------------------- | :--------------------------------- |
| C12A7328-F81F-11D2-BA4B-00A0C93EC93B | EFI System partition               |
| 4F68BCE3-E8CD-4DB1-96E7-FBCAF984B709 | Linux Root partition (x86-64)      |
| 0657FD6D-A4AB-43C4-84E5-0933C84B4F4F | Linux Swap partition               |
| 933AC7E1-2EB4-4F13-B844-0E14E2AEF915 | Linux Home partition               |

1. Open the partitioning tool of your choice
1. Create a GPT partition table
1. Efi partition
   1. Create a new partition of 260MiB
   1. Change the type of the partition to `EFI system`
1. Root partition
   1. Create a new partition with appropriate size [2]
   1. Change the type of the partition to `Linux Root partition (x86-64)`
1. Swap partition
   1. Create a new partition with appropriate size [5]
   1. Change the type of the partition to `Linux Swap partition`
1. Home partition
   1. Create a new partition with all the remaining space of your drive
   1. Change the type of the partition to `Linux Home partition`
1. Write and exit

### References
{: .no_toc .text-delta .pt-4}

1. [Wikipedia - GUID partition table](https://en.wikipedia.org/wiki/GUID_Partition_Table)
1. [ArchWiki - Partitioning - Partition scheme](https://wiki.archlinux.org/index.php/Partitioning#Partition_scheme)
1. [ArchWiki - Partitioning - Partitioning tools](https://wiki.archlinux.org/index.php/Partitioning#Partitioning_tools)
1. [ArchWiki - EFI system partition - Create the partition](https://wiki.archlinux.org/index.php/EFI_system_partition#Create_the_partition)
1. [VOID Linux Partitions Notes - SWAP partitions](https://docs.voidlinux.org/installation/live-images/partitions.html#swap-partitions)

---

## Partitions setup

### Format the partitions
{: .no_toc .pt-2}

```bash
# Format the EXT4 filesystem partitions
$ mkfs.ext4 -L ROOT /dev/sda2
$ mkfs.ext4 -L HOME /dev/sda4

# Format the FAT32 filesystem partition
$ mkfs.fat -F32 -n EFI /dev/sda1
```

### Setup the Swap partition
{: .no_toc .pt-4}

```bash
# Format the Swap partition
$ mkswap -L SWAP /dev/sda3

# Activate the Swap partition
$ swapon /dev/sda3
```

### Mount the partitions
{: .no_toc .pt-4}

```bash
# Mount the root partition
$ mount /dev/sda2 /mnt

# Create directories
$ mkdir /mnt/{home,boot}

# Mount the home and efi partitions
$ mount /dev/sda1 /mnt/boot
$ mount /dev/sda4 /mnt/home
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

## Arch Linux installation

install packages to the specified new root directory.

```bash
pacstrap /mnt base base-devel linux linux-firmware vim man-db man-pages
```

### References
{: .no_toc .text-delta .pt-4}

- [ArchWiki - Installation guide - Install essential packages](https://wiki.archlinux.org/index.php/Installation_guide#Install_essential_packages)
- [Man page - pacstrap](https://jlk.fjfi.cvut.cz/arch/manpages/man/extra/arch-install-scripts/pacstrap.8.en)

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
