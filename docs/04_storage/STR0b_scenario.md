---
layout: default
title: STR2 Scenario
nav_exclude: true
permalink: /storage/scenario/
has_toc: false
---

# Storage scenario
{: .no_toc}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

## Select a partition scheme

You can use a Swap file instead of the Swap partition. See [the configuration of the filesystems](/Andromeda/configuration/filesystems/) for more info.

#### UEFI / EXT4
{: .no_toc .pt-4}

| Partition | Mounting point | Partition type                | Size     |
| :-------- | :------------- | :---------------------------- | :------- |
| /dev/sda1 | /boot          | EFI system partition          | 260M     |
| /dev/sda2 | /              | Linux Root partition (x86-64) | 23 - 32G |
| /dev/sda3 |                | Linux Swap partition          | > 512M   |
| /dev/sda4 | /home          | Linux Home partition          | 100%FREE |

#### UEFI / RAID1
{: .no_toc .pt-4}

| Device | Partition | Partition type       | Size            |
| :----- | :-------- | :------------------- | :-------------- |
| 1      | /dev/sda1 | Linux RAID partition | 512M            |
| 1      | /dev/sda2 | Linux RAID partition | 100%FREE - 100M |
| 2      | /dev/sdb1 | Linux RAID partition | 512M            |
| 2      | /dev/sdb2 | Linux RAID partition | 100%FREE - 100M |

#### UEFI / LVM
{: .no_toc .pt-4}

| Partition | Mounting point  | Partition type                     | Size     |
| :-------- | :-------------  | :--------------------------------- | :------- |
| /dev/sda1 | /efi            | EFI system partition               | 512M     |
| /dev/sda2 |                 | Linux Logical Volume Manager (LVM) | 100%FREE |

#### UEFI / BTRFS
{: .no_toc .pt-4}

| Partition | Mounting point  | Partition type       | Size     |
| :-------- | :-------------  | :------------------- | :------- |
| /dev/sda1 | /efi            | EFI system partition | 512M     |
| /dev/sda2 |                 | Linux Filesystem     | 100%FREE |

#### BIOS / GPT / EXT4
{: .no_toc .pt-4}

| Partition | Mounting point | Partition type                | Size     |
| :-------- | :------------- | :---------------------------- | :------- |
| /dev/sda1 |                | BIOS boot partition           | 1M       |
| /dev/sda2 | /              | Linux Root partition (x86-64) | 23 - 32G |
| /dev/sda3 |                | Linux Swap partition          | > 512M   |
| /dev/sda4 | /home          | Linux Home partition          | 100%FREE |

A BIOS boot partition is only required when using GRUB for BIOS booting from a GPT disk. The partition has nothing to do with /boot, and it must not be formatted with a file system or mounted.
{: .fs-2}

#### BIOS / MBR / EXT4
{: .no_toc .pt-4}

| Partition | Mounting point | Partition type            | Size     | Boot flag |
| :-------- | :------------- | :------------------------ | :------- | :-------- |
| /dev/sda1 | /              | Linux Filesystem          | 23 - 32G | yes       |
| /dev/sda2 |                | Linux Swap partition      | > 512M   | No        |
| /dev/sda3 | /home          | Linux Filesystem          | 100%FREE | No        |

### References
{: .no_toc .text-delta .pt-4}

- [ArchWiki Partitioning - Example layouts](https://wiki.archlinux.org/index.php/Partitioning#Example_layouts)
- [ArchWiki - Dm-crypt/Encrypting an entire system - LVM on LUKS](https://wiki.archlinux.org/index.php/Dm-crypt/Encrypting_an_entire_system#LVM_on_LUKS)
- [ArchWiki - Dm-crypt/Encrypting an entire system - Btrfs subvolumes with swap](https://wiki.archlinux.org/index.php/Dm-crypt/Encrypting_an_entire_system#Btrfs_subvolumes_with_swap)
