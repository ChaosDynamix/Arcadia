---
layout: default
title: Lvm-Ext4
permalink: /storage/controller/lvm-ext4/
nav_exclude: true
---

[Return to Storage configuration](/Andromeda/storage/controller/){: .btn .btn-purple }

# Storage controller with Lvm-Ext4
{: .no_toc}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

| Storage       | Label   | Filesystem | Mounting point |
| :------------ | :------ | :--------- | :------------- |
| /dev/sda1     | EFI     | Fat32      | /mnt/efi       |
| /dev/grp/root | ROOT    | Ext4       | /mnt           |
| /dev/grp/swap | SWAP    | Swap       |                |
| /dev/grp/home | HOME    | Ext4       | /mnt/home      |

---

## Create the physical volume

```bash
$ pvcreate /dev/mapper/lvm
```

---

## Create the volume group

```bash
$ vgcreate grp /dev/mapper/lvm
```

---

## Create the Logical volumes

```bash
$ lvcreate -L 8G grp -n swap
$ lvcreate -L 20G grp -n root
$ lvcreate -l 100%FREE grp -n home
```

---

## Format the volumes

```bash
$ mkfs.ext4 -L ROOT /dev/grp/root
$ mkfs.ext4 -L HOME /dev/grp/home
```

---

## Setup the Swap partition

```bash
# Format the Swap partition
$ mkswap -L SWAP /dev/grp/swap

# Activate the Swap partition
$ swapon /dev/grp/swap
```

---

## Mount the volumes

```bash
# Mount the root partition
$ mount /dev/grp/root /mnt

# Create directories
$ mkdir /mnt/home

# Mount the home and efi partitions
$ mount /dev/grp/home /mnt/home

```

---

## Setup the EFI partition
{: .d-inline-block}

UEFI
{: .label .label-blue .ml-2}

```bash
# Format the EFI partition
$ mkfs.fat -F32 -n EFI /dev/sda1

# Create the boot directory
$ mkdir /mnt/efi

# Mount the EFI partition
$ mount /dev/sda1 /mnt/efi
```

---

#### References
{: .no_toc .text-delta .pt-4}

1. [ArchWiki - LVM on LUKS - Preparing the logical volumes](https://wiki.archlinux.org/index.php/Dm-crypt/Encrypting_an_entire_system#Preparing_the_logical_volumes)
1. [ArchWiki - LVM - Volume operations](https://wiki.archlinux.org/index.php/LVM#Volume_operations)
1. [ArchWiki - Partitioning - Discrete partitions](https://wiki.archlinux.org/index.php/Partitioning#Discrete_partitions)
1. [VOID Linux Partitions Notes - SWAP partitions](https://docs.voidlinux.org/installation/live-images/partitions.html#swap-partitions)
1. [Man page - pvcreate](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/lvm2/pvcreate.8.en)
1. [Man page - vgcreate](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/lvm2/vgcreate.8.en)
1. [Man page - lvcreate](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/lvm2/lvcreate.8.en)

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
