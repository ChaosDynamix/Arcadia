---
layout: default
title: Uefi
permalink: /storage/preparation/uefi/
nav_exclude: true
---

# Storage preparation for Uefi
{: .no_toc}

---

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

## Secure erase the drive(s)
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


## Ext4

```
+-----------------+-----------------+-----------------+-----------------+
| EFI system      | Root            | Swap            | Home            |
| partition       | partition       | partition       | partition       |
| /dev/sda1       | /dev/sda2       | /dev/sda3       | /dev/sda4       |
+-----------------+-----------------+-----------------+-----------------+
```

### Partitioning
{: .no_toc .pt-2}

| Partition | Partition type                | Size     |
| :-------- | :---------------------------- | :------- |
| /dev/sda1 | EFI system partition          | 260M     |
| /dev/sda2 | Linux Root partition (x86-64) | 23 - 32G |
| /dev/sda3 | Linux Swap partition          | > 512M   |
| /dev/sda4 | Linux Home partition          | 100%FREE |

#### SGDISK SCRIPT
{: .no_toc .pt-2}

```bash
# Edit the sizes accordingly
$ sgdisk -o -n=1:0:+260M -n=2:0:+30G -n=3:0:1G -n=4:0:0 -t=1:ef00 -t=2:8304 -t=3:8200 -t=4:8302 /dev/sda
```

---

## Lvm

```
+------------------------+----------------------------------------------+
| EFI system partition   | Logical Volume Manager                       |
| /dev/sda1              | /dev/sda2                                    |
+------------------------+----------------------------------------------+
```

### Partitioning
{: .no_toc .pt-2}

| Partition | Partition type                     | Size     |
| :-------- | :--------------------------------- | :------- |
| /dev/sda1 | EFI system partition               | 260M     |
| /dev/sda2 | Linux Logical Volume Manager (LVM) | 100%FREE |

#### SGDISK SCRIPT
{: .no_toc .pt-2}

```bash
# Edit the sizes accordingly
$ sgdisk -o -n=1:0:+260M -n=2:0:0 -t=1:ef00 -t=2:8e00 /dev/sda
```

---

## Btrfs

```
+------------------------+----------------------------------------------+
| EFI system partition   | Btrfs partition                              |
| /dev/sda1              | /dev/sda2                                    |
+------------------------+----------------------------------------------+
```

### Partitioning
{: .no_toc .pt-2}

| Partition | Partition type       | Size     |
| :-------- | :------------------- | :------- |
| /dev/sda1 | EFI system partition | 260M     |
| /dev/sda2 | Linux Filesystem     | 100%FREE |

#### SGDISK SCRIPT
{: .no_toc .pt-2}

```bash
# Edit the sizes accordingly
$ sgdisk -o -n=1:0:+260M -n=2:0:0 -t=1:ef00 -t=2:8300 /dev/sda
```

---

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
