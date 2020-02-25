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

## [LVM](/Andromeda/storage/scenarios/lvm/)

| Partition | Mounting point  | Partition type                     | Size     |
| :-------- | :-------------  | :--------------------------------- | :------- |
| /dev/sda1 | /efi            | EFI system partition               | 512M     |
| /dev/sda2 |                 | Linux Logical Volume Manager (LVM) | 100%FREE |

```
+------------------------------------------------+------------------------------------------------+
| EFI system partition                           | LUKS1 encrypted partition                      |
| /efi                                           | /dev/mapper/lvm                                |
|                                                +------------------------------------------------+
|                                                |                                                |
| /dev/sda1                                      | /dev/sda2                                      |
+------------------------------------------------+------------------------------------------------+
```

---

## [LVM on RAID1](/Andromeda/storage/scenarios/lvm-on-RAID1/)

| Device | Partition | Partition type       | Size            |
| :----- | :-------- | :------------------- | :-------------- |
| 1      | /dev/sda1 | EFI system partition | 512M            |
| 1      | /dev/sda2 | Linux RAID partition | 100%FREE - 100M |
| 2      | /dev/sdb1 | EFI system partition | 512M            |
| 2      | /dev/sdb2 | Linux RAID partition | 100%FREE - 100M |

```
+----------------------+------------------------+ +----------------------+------------------------+
| EFI system partition | LUKS1 encrypted volume | | EFI system partition | LUKS1 encrypted volume |
| /efi                 | /dev/mapper/lvm        | | /efi2                | /dev/mapper/lvm        |
|                      +------------------------+ |                      +------------------------+
|                      | RAID1 array (part 1)   | |                      | RAID1 array (part 2)   |
|                      | /dev/md/lvm            | |                      | /dev/md/lvm            |
|                      +------------------------+ |                      +------------------------+
|                      |                        | |                      |                        |
| /dev/sda1            | /dev/sda2              | | /dev/sdb1            | /dev/sdb2              |
+----------------------+------------------------+ +--------------------- +------------------------+
```

---

## BTRFS

| Partition | Mounting point | Partition type       | Size     |
| :-------- | :------------- | :------------------- | :------- |
| /dev/sda1 | /efi           | EFI system partition | 512M     |
| /dev/sda2 |                | Linux Filesystem     | 100%FREE |

```
+------------------------------------------------+------------------------------------------------+
| EFI system partition                           | LUKS1 encrypted partition                      |
| /efi                                           | /dev/mapper/btrfs                              |
|                                                +------------------------------------------------+
|                                                |                                                |
| /dev/sda1                                      | /dev/sda2                                      |
+------------------------------------------------+------------------------------------------------+
```

---

## BTRFS on RAID1

| Device | Partition | Partition type       | Size            |
| :----- | :-------- | :------------------- | :-------------- |
| 1      | /dev/sda1 | EFI system partition | 512M            |
| 1      | /dev/sda2 | Linux RAID partition | 100%FREE - 100M |
| 2      | /dev/sdb1 | EFI system partition | 512M            |
| 2      | /dev/sdb2 | Linux RAID partition | 100%FREE - 100M |

```
+----------------------+------------------------+ +--------------------- +------------------------+
| EFI system partition | LUKS1 encrypted volume | | EFI system partition | LUKS1 encrypted volume |
| /efi                 | /dev/mapper/btrfs      | | /efi2                | /dev/mapper/btrfs      |
|                      +------------------------+ |                      +------------------------+
|                      | RAID1 array (part 1)   | |                      | RAID1 array (part 2)   |
|                      | /dev/md/btrfs          | |                      | /dev/md/btrfs          |
|                      +------------------------+ |                      +------------------------+
|                      |                        | |                      |                        |
| /dev/sda1            | /dev/sda2              | | /dev/sdb1            | /dev/sdb2              |
+----------------------+------------------------+ +--------------------- +------------------------+
```
