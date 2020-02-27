---
layout: default
title: LVM with RAID1
nav_order: 2
parent: 04 Installation
permalink: /installation/lvm-with-raid1/
has_toc: false
---

# Installation guide for LVM with RAID1
{: .no_toc}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

## [LVM with RAID1](/Andromeda/storage/scenarios/lvm-with-RAID1/)
{: .d-inline-block}

UEFI
{: .label .label-purple .ml-4}

LUKS1
{: .label .label-purple}

EXT4
{: .label .label-purple}

#### Partition layout
{: .no_toc}

| Device | Partition | Partition type                     | Size            |
| :----- | :-------- | :--------------------------------- | :-------------- |
| 1      | /dev/sda1 | EFI system partition               | 512M            |
| 1      | /dev/sda2 | Linux Logical Volume Manager (LVM) | 100%FREE - 100M |
| 2      | /dev/sdb1 | EFI system partition               | 512M            |
| 2      | /dev/sdb2 | Linux Logical Volume Manager (LVM) | 100%FREE - 100M |

```
+----------------------+------------------------+ +----------------------+------------------------+
| EFI system partition | Logical Volume Manager | | EFI system partition | Logical Volume Manager |
| /efi                 |                        | | /efi2                |                        |
|                      |                        | |                      |                        |
|                      |                        | |                      |                        |
| /dev/sda1            | /dev/sda2              | | /dev/sdb1            | /dev/sdb2              |
+----------------------+------------------------+ +--------------------- +------------------------+
```

#### LVM layout
{: .no_toc .pt-4}

```
+-------------------------------------------------------------------------------------------------+
|                                        Physical volume                                          |
|                                      /dev/sda2 /dev/sdb2                                        |
+-------------------------------------------------------------------------------------------------+
|                                         Group volume                                            |
|                                           /dev/grp/                                             |
+-------------------------------+-------------------------------+---------------------------------+
| Logical volume 1              | Logical volume 2              | Logical volume 3                |
| /dev/grp/swap                 | /dev/grp/root                 | /dev/grp/home                   |
+-------------------------------+-------------------------------+---------------------------------+
| Encrypted volume              | LUKS1 encrypted volume        | LUKS2 encrypted volume          |
| [SWAP]                        | /                             | /home                           |
| /dev/mapper/swap              | /dev/mapper/root              | /dev/mapper/home                |
+-------------------------------+-------------------------------+---------------------------------+
```

---

### Utilities for accessing the storage
{: .no_toc .pt-4}

| System | Package     |
| :----- | :---------- |
| RAID   | mdadm       |
| LVM    | lvm2        |
| BTRFS  | btrfs-progs |
