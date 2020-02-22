---
layout: default
title: STR2 Partition scheme
nav_order: 2
parent: 04 Storage
permalink: /storage/partition-scheme/
has_toc: false
---

# Storage partition scheme
{: .no_toc}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

## Select a recommended SWAP size

A swap partition is not strictly required, but recommended for systems with low RAM. If you want to use hibernation, you will need a swap partition. The following table has recommendations for swap partition size.

| System RAM | Recommended swap space | Swap space if using hibernation |
| :--------- | :--------------------- | :------------------------------ |
| < 2GB      | 2x the amount of RAM   | 3x the amount of RAM            |
| 2 - 8G     | Equal to amount of RAM | 2x the amount of RAM            |
| 8 - 64G    | At least 4GB           | 1.5x the amount of RAM          |
| 64G        | At least 4GB           | Hibernation not recommended     |

### References
{: .no_toc .text-delta .pt-4}

- [VOID Linux Partitions Notes - SWAP partitions](https://docs.voidlinux.org/installation/live-images/partitions.html#swap-partitions)

---

## Select a partition scheme

### UEFI / GPT
{: .no_toc .pt-4}

#### EXT4
{: .no_toc .pt-4}

| Partition | Mounting point | Partition type                | Size     |
| :-------- | :------------- | :---------------------------- | :------- |
| /dev/sda1 | /boot          | EFI system partition          | 260M     |
| /dev/sda2 | /              | Linux Root partition (x86-64) | 23 - 32G |
| /dev/sda3 | [SWAP]         | Linux Swap partition          | > 512M   |
| /dev/sda4 | /home          | Linux Home partition          | 100%FREE |

#### RAID 1
{: .no_toc .pt-4}

| Partition | Mounting point | Partition type       | Size            |
| :-------- | :------------- | :------------------- | :-------------- |
| /dev/sda1 |                | Linux RAID partition | 512M            |
| /dev/sda2 |                | Linux RAID partition | 100%FREE - 100M |
| /dev/sdb1 |                | Linux RAID partition | 512M            |
| /dev/sdb2 |                | Linux RAID partition | 100%FREE - 100M |

#### LVM
{: .no_toc .pt-4}

| Partition | Mounting point | Partition type                     | Size     |
| :-------- | :------------- | :--------------------------------- | :------- |
| /dev/sda1 | /boot          | EFI system partition               | 512M     |
| /dev/sda2 |                | Linux Logical Volume Manager (LVM) | 100%FREE |

#### BTRFS
{: .no_toc .pt-4}

| Partition | Mounting point | Partition type       | Size     |
| :-------- | :------------- | :------------------- | :------- |
| /dev/sda1 |                | EFI system partition | 512M     |
| /dev/sda2 |                | Linux Filesystem     | 100%FREE |

### BIOS
{: .no_toc .pt-4}

#### GPT / EXT4
{: .no_toc .pt-4}

| Partition | Mounting point | Partition type                | Size     |
| :-------- | :------------- | :---------------------------- | :------- |
| /dev/sda1 |                | BIOS boot partition           | 1M       |
| /dev/sda2 | /              | Linux Root partition (x86-64) | 23 - 32G |
| /dev/sda3 | [SWAP]         | Linux Swap partition          | > 512M   |
| /dev/sda4 | /home          | Linux Home partition          | 100%FREE |

A BIOS boot partition is only required when using GRUB for BIOS booting from a GPT disk. The partition has nothing to do with /boot, and it must not be formatted with a file system or mounted.
{: .fs-2}

#### MBR / EXT4
{: .no_toc .pt-4}

| Partition | Mounting point | Partition type            | Size     | Boot flag |
| :-------- | :------------- | :------------------------ | :------- | :-------- |
| /dev/sda1 | /              | Linux Filesystem          | 23 - 32G | yes       |
| /dev/sda2 | [SWAP]         | Linux Swap partition      | > 512M   | No        |
| /dev/sda3 | /home          | Linux Filesystem          | 100%FREE | No        |

### References
{: .no_toc .text-delta .pt-4}

- [ArchWiki Partitioning - Example layouts](https://wiki.archlinux.org/index.php/Partitioning#Example_layouts)
- [ArchWiki - Dm-crypt/Encrypting an entire system - LVM on LUKS](https://wiki.archlinux.org/index.php/Dm-crypt/Encrypting_an_entire_system#LVM_on_LUKS)
- [ArchWiki - Dm-crypt/Encrypting an entire system - Btrfs subvolumes with swap](https://wiki.archlinux.org/index.php/Dm-crypt/Encrypting_an_entire_system#Btrfs_subvolumes_with_swap)
