---
layout: default
title: STR2 Scenarios
nav_order: 2
parent: 04 Storage
permalink: /storage/scenarios/
has_toc: false
has_children: true
---

# Storage scenarios
{: .no_toc}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

## [LVM on 1 device](/Andromeda/storage/scenarios/lvm-on-1-device/)

| Partition | Mounting point  | Partition type                     | Size     |
| :-------- | :-------------  | :--------------------------------- | :------- |
| /dev/sda1 | /efi            | EFI system partition               | 512M     |
| /dev/sda2 |                 | Linux Logical Volume Manager (LVM) | 100%FREE |

```
+----------------+ +-----------------------------------------------------------------------+
| EFI partition  | | Logical volume 1      | Logical volume 2      | Logical volume 3      |
| /efi           | | [SWAP]                | /                     | /home                 |
|                | | /dev/grp/swap         | /dev/grp/root         | /dev/grp/home         |
|                | +-----------------------+-----------------------+-----------------------+
|                | |                             Group volume                              |
|                | |                               /dev/grp/                               |
|                | +-----------------------------------------------------------------------+
|                | |                            Physical volume                            |
|                | |                            /dev/mapper/lvm                            |
|                | +-----------------------------------------------------------------------+
|                | |                       LUKS1 encrypted partition                       |
| /dev/sda1      | |                              /dev/sda2                                |
+----------------+-+-----------------------------------------------------------------------+
```

---

## BTRFS on 1 device

| Partition | Mounting point  | Partition type       | Size     |
| :-------- | :-------------  | :------------------- | :------- |
| /dev/sda1 | /efi            | EFI system partition | 512M     |
| /dev/sda2 |                 | Linux Filesystem     | 100%FREE |

```
+----------------+ +----------------------------------------------------------------------+
| EFI partition  | |                       BTRFS Filesystem partition                     |
| /efi           | |                           /dev/mapper/btrfs                          |
|                | +----------------------------------------------------------------------+
|                | |                       LUKS1 encrypted partition                      |
| /dev/sda1      | |                              /dev/sda2                               |
+----------------+ +----------------------------------------------------------------------+
```

```
subvolid=5 (/dev/mapper/btrfs)
   |
   ├── @ (mounted as /)
   |       ├── /bin (directory)
   |       ├── /home (mounted @home subvolume)
   |       ├── /usr (directory)
   |       ├── /.snapshots (mounted @snapshots subvolume)
   |       ├── /var/cache/pacman/pkg (nested subvolume)
   |       ├── ... (other directories and nested subvolumes)
   ├── @snapshots (mounted as /.snapshots)
   ├── @home (mounted as /home)
   └── @... (additional subvolumes you wish to use as mount points)
```

---

## RAID1 with LVM

| Device | Partition | Partition type       | Size            |
| :----- | :-------- | :------------------- | :-------------- |
| 1      | /dev/sda1 | EFI system partition | 512M            |
| 1      | /dev/sda2 | Linux RAID partition | 100%FREE - 100M |
| 2      | /dev/sdb1 | EFI system partition | 512M            |
| 2      | /dev/sdb2 | Linux RAID partition | 100%FREE - 100M |

```
+----------------------+------------------------+ +--------------------- +------------------------+
| EFI system partition | LUKS1 encrypted volume | | EFI system partition | LUKS1 encrypted volume |
|                      | /dev/mapper/lvm        | |                      | /dev/mapper/lvm        |
|                      +------------------------+ |                      +------------------------+
|                      | RAID1 array (part 1)   | |                      | RAID1 array (part 2)   |
|                      | /dev/md/lvm            | |                      | /dev/md/lvm            |
|                      +------------------------+ |                      +------------------------+
| /dev/sda1            | /dev/sda2              | | /dev/sdb1            | /dev/sdb2              |
+----------------------+------------------------+ +--------------------- +------------------------+
```

---

## RAID1 with BTRFS

| Device | Partition | Partition type       | Size            |
| :----- | :-------- | :------------------- | :-------------- |
| 1      | /dev/sda1 | EFI system partition | 512M            |
| 1      | /dev/sda2 | Linux RAID partition | 100%FREE - 100M |
| 2      | /dev/sdb1 | EFI system partition | 512M            |
| 2      | /dev/sdb2 | Linux RAID partition | 100%FREE - 100M |

```
+----------------------+------------------------+ +--------------------- +------------------------+
| EFI system partition | LUKS1 encrypted volume | | EFI system partition | LUKS1 encrypted volume |
|                      | /dev/mapper/btrfs      | |                      | /dev/mapper/btrfs      |
|                      +------------------------+ |                      +------------------------+
|                      | RAID1 array (part 1)   | |                      | RAID1 array (part 2)   |
|                      | /dev/md/btrfs          | |                      | /dev/md/btrfs          |
|                      +------------------------+ |                      +------------------------+
| /dev/sda1            | /dev/sda2              | | /dev/sdb1            | /dev/sdb2              |
+----------------------+------------------------+ +--------------------- +------------------------+
```

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
