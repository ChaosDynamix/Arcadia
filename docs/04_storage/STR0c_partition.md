---
layout: default
title: STR3 Partition
nav_exclude: true
permalink: /storage/partition/
has_toc: false
---

# Storage partition
{: .no_toc}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

## Linux Partition types

### Guid Partition Table (GPT)
{: .no_toc}

| Partition guid                       | Description                        |
| :----------------------------------- | :--------------------------------- |
| C12A7328-F81F-11D2-BA4B-00A0C93EC93B | EFI System partition               |
| 21686148-6449-6E6F-744E-656564454649 | BIOS boot partition                |
| 0FC63DAF-8483-4772-8E79-3D69D8477DE4 | Linux Filesystem                   |
| 4F68BCE3-E8CD-4DB1-96E7-FBCAF984B709 | Linux Root partition (x86-64)      |
| BC13C2FF-59E6-4262-A352-B275FD6F7172 | Linux Boot partition               |
| 0657FD6D-A4AB-43C4-84E5-0933C84B4F4F | Linux Swap partition               |
| E6D6D379-F507-44C2-A23C-238F2A3DF928 | Linux Logical Volume Manager (LVM) |
| 933AC7E1-2EB4-4F13-B844-0E14E2AEF915 | Linux Home partition               |
| CA7D7CCB-63ED-4C53-861C-1742536059CC | Linux Unified Key Setup (LUKS)     |
| 7FFEC5C9-2D00-49B7-8941-3EA10A5586B7 | Linux Plain dm-crypt partition     |
| A19D880F-05FC-4D3B-A006-743F0F84911E | Linux RAID partition               |

### References
{: .no_toc .text-delta .pt-4}

- [Wikipedia - Partition type](https://en.wikipedia.org/wiki/Partition_type)
- [Wikipedia - GUID partition table](https://en.wikipedia.org/wiki/GUID_Partition_Table)

---

## Swap partition size recommendations

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

## Partitionning with fdisk

fdisk is a dialog-driven program for creation and manipulation of partition tables. It understands GPT, MBR, Sun, SGI and BSD partition tables.

### Open fdisk
{: .no_toc}

```bash
$ fdisk /dev/sdX
```

### List of commands
{: .no_toc .pt-2}

| Command | Action                                            |
| :------ | :------------------------------------------------ |
| g       | Create a new empty GPT partition table            |
| o       | Create a new empty MBR partition table            |
| n       | Add a new partition                               |
| d       | Delete a partition                                |
| l       | List the partition types for your partition table |
| t       | Change a partition type                           |
| w       | Write table to disk and exit                      |
| q       | Quit without saving changes                       |


### References
{: .no_toc .text-delta .pt-4}

- [ArchWiki - fdisk](https://wiki.archlinux.org/index.php/Fdisk)

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
