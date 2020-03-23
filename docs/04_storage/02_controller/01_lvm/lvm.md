---
layout: default
title: Lvm
permalink: /storage/controller/lvm/
grand_parent: Storage
parent: Controller
nav_order: 1
---

# Storage Controller with Lvm
{: .no_toc}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

## Create the physical volume

Unix block device node, usable for storage by LVM. Examples: a hard disk, an MBR or GPT partition, a loopback file, a device mapper device (e.g. dm-crypt). It hosts an LVM header.

#### SINGLE CONTAINER
{: .no_toc .pt-2}

```bash
$ pvcreate /dev/mapper/container
```

#### MULTIPLE CONTAINERS
{: .no_toc .pt-4}

```bash
$ pvcreate /dev/mapper/container1 /dev/mapper/container2
```

---

## Create the volume group

Group of PVs that serves as a container for LVs. PEs are allocated from a VG for a LV.

#### SINGLE CONTAINER
{: .no_toc .pt-2}

```bash
$ vgcreate grp /dev/mapper/container
```

#### MULTIPLE CONTAINERS
{: .no_toc .pt-4}

```bash
$ vgcreate grp /dev/mapper/container1 /dev/mapper/container2
```

---

## Create the Logical volumes

"Virtual/logical partition" that resides in a VG and is composed of PEs. LVs are Unix block devices analogous to physical partitions, e.g. they can be directly formatted with a file system.

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

## Setup the Swap volume

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

# Mount the home partition
$ mount /dev/grp/home /mnt/home

```

---

## Setup the EFI partition(s)
{: .d-inline-block}

UEFI
{: .label .label-blue .ml-2}

### Single EFI partition
{: .no_toc .mt-0}

```bash
# Format the EFI partition
$ mkfs.fat -F32 -n EFI /dev/sdXY

# Create the boot directory
$ mkdir /mnt/efi

# Mount the EFI partition
$ mount /dev/sdXY /mnt/efi
```

### Multiple EFI partitions
{: .no_toc .pt-4}

```bash
# Format the EFI partition
$ mkfs.fat -F32 -n EFI /dev/sda1
$ mkfs.fat -F32 -n EFI /dev/sdb1

# Create the EFI directories
$ mkdir /mnt/{efi1,efi2}

# Mount the EFI partitions
$ mount /dev/sda1 /mnt/efi1
$ mount /dev/sdb1 /mnt/efi2
```

---

## References
{: .no_toc}

### LOGICAL VOLUME MANAGER
{: .no_toc .text-delta .pt-2}

1. [ArchWiki - LVM on LUKS - Preparing the logical volumes](https://wiki.archlinux.org/index.php/Dm-crypt/Encrypting_an_entire_system#Preparing_the_logical_volumes)
1. [ArchWiki - LVM - Volume operations](https://wiki.archlinux.org/index.php/LVM#Volume_operations)

### PARTITIONING
{: .no_toc .text-delta .pt-4}

1. [ArchWiki - Partitioning - Discrete partitions](https://wiki.archlinux.org/index.php/Partitioning#Discrete_partitions)
1. [VOID Linux Partitions Notes - SWAP partitions](https://docs.voidlinux.org/installation/live-images/partitions.html#swap-partitions)
1. [ArchWiki - Installation guide - Format the partitions](https://wiki.archlinux.org/index.php/Installation_guide#Format_the_partitions)
1. [ArchWiki - Installation guide - Mount the file systems](https://wiki.archlinux.org/index.php/Installation_guide#Mount_the_file_systems)
1. [ArchWiki - EFI system partition](https://wiki.archlinux.org/index.php/EFI_system_partition)


### MANUALS
{: .no_toc .text-delta .pt-4}

1. [Man page - pvcreate](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/lvm2/pvcreate.8.en)
1. [Man page - vgcreate](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/lvm2/vgcreate.8.en)
1. [Man page - lvcreate](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/lvm2/lvcreate.8.en)
1. [Man page - mkfs.ext4](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/e2fsprogs/mkfs.ext4.8.en)
1. [Man page - mkfs.fat](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/dosfstools/mkfs.fat.8.en)
1. [Man page - mkswap](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/util-linux/mkswap.8.en)
1. [Man page - swapon](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/man-pages/swapon.2.en)
1. [Man page - mkdir](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/coreutils/mkdir.1.en)
1. [Man page - mount](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/util-linux/mount.8.en)
