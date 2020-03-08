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

## Table of contents
{: .no_toc .text-delta .mt-6}

1. TOC
{:toc}

---

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

## Partition the drive

| Partition | Partition type                | Size     |
| :-------- | :---------------------------- | :------- |
| /dev/sda1 | EFI system partition          | 260M     |
| /dev/sda2 | Linux Root partition (x86-64) | 23 - 32G |
| /dev/sda3 | Linux Swap partition          | > 512M   |
| /dev/sda4 | Linux Home partition          | 100%FREE |

### With sgdisk
{: .no_toc .pt-4}

```bash
# Edit the sizes accordingly
$ sgdisk -o -n=1:0:+260M -n=2:0:+30G -n=3:0:1G -n=4:0:0 -t=1:ef00 -t=2:8304 -t=3:8200 -t=4:8302 /dev/sda
```

### INFORMATIONS
{: .no_toc .text-delta .pt-4}

1. [Wikipedia - GUID partition table](https://en.wikipedia.org/wiki/GUID_Partition_Table)
1. [Wikipedia - Paging - Unix and Unix like systems](https://en.wikipedia.org/wiki/Paging#Unix_and_Unix-like_systems)
1. [VOID Linux Partitions Notes - SWAP partitions](https://docs.voidlinux.org/installation/live-images/partitions.html#swap-partitions)

### GUIDES
{: .no_toc .text-delta .pt-2}

1. [ArchWiki - Partitioning - Partition scheme](https://wiki.archlinux.org/index.php/Partitioning#Partition_scheme)
1. [ArchWiki - Partitioning - Partitioning tools](https://wiki.archlinux.org/index.php/Partitioning#Partitioning_tools)
1. [ArchWiki - EFI system partition - Create the partition](https://wiki.archlinux.org/index.php/EFI_system_partition#Create_the_partition)
1. [ArchWiki - GPT fdisk](https://wiki.archlinux.org/index.php/GPT_fdisk)

### MANUALS
{: .no_toc .text-delta .pt-2}

1. [Man page - sgdisk](https://jlk.fjfi.cvut.cz/arch/manpages/man/extra/gptfdisk/sgdisk.8.en)




---

## Configuring the partitions

| Partition | Label   | Filesystem | Mounting point |
| :-------- | :------ | :--------- | :------------- |
| /dev/sda1 | EFI     | Fat32      | /mnt/boot      |
| /dev/sda2 | ROOT    | Ext4       | /mnt           |
| /dev/sda3 | SWAP    | Swap       |                |
| /dev/sda4 | HOME    | Ext4       | /mnt/home      |

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

### GUIDES
{: .no_toc .text-delta .pt-4}

1. [ArchWiki - EFI system partition](https://wiki.archlinux.org/index.php/EFI_system_partition)
1. [ArchWiki - File systems](https://wiki.archlinux.org/index.php/File_systems)
1. [ArchWiki - Fat](https://wiki.archlinux.org/index.php/FAT)
1. [ArchWiki - Ext4](https://wiki.archlinux.org/index.php/Ext4)

### MANUALS
{: .no_toc .text-delta .pt-2}

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
pacstrap /mnt base base-devel linux linux-firmware vim man-db man-pages
```

### GUIDES
{: .no_toc .text-delta .pt-4}

- [ArchWiki - Installation guide - Install essential packages](https://wiki.archlinux.org/index.php/Installation_guide#Install_essential_packages)

### MANUALS
{: .no_toc .text-delta .pt-2}

- [Man page - pacstrap](https://jlk.fjfi.cvut.cz/arch/manpages/man/extra/arch-install-scripts/pacstrap.8.en)

---

## Generate static information about the filesystems

```bash
genfstab -U /mnt >> /mnt/etc/fstab
```

### GUIDES
{: .no_toc .text-delta .pt-4}

1. [ArchWiki - Installation guide - Fstab](https://wiki.archlinux.org/index.php/Installation_guide#Fstab)
1. [ArchWiki - Fstab](https://wiki.archlinux.org/index.php/Fstab)

---

## Enter the system

```bash
arch-chroot /mnt
```

### GUIDES
{: .no_toc .text-delta .pt-4}

1. [ArchWiki - Installation guide - Chroot](https://wiki.archlinux.org/index.php/Installation_guide#Chroot)
