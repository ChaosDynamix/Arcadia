---
layout: default
title: STR2 Configuration
permalink: /storage/configuration/
parent: Storage
nav_order: 2
has_children: true
has_toc: false
---

# Storage configuration
{: .no_toc}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

| Preparation     | Compatible configuration |
| :-------------- | :----------------------- |
| Uefi-Ext4       | Ext4                     |
| Uefi-Lvm        | Lvm, Lvm-Dmcrypt         |
| Uefi-Btrfs      | Btrfs                    |
| Uefi-Luks       | Lvm, Btrfs               |
| Uefi-Raid1-Luks | Lvm, Btrfs               |

## [Ext4](/Andromeda/storage/preparation/uefi-ext4/)

```
+--------------+--------------+--------------+--------------+
| Partition 1  | Partition 2  | Partition 3  | Partition 4  |
| EFI          | ROOT         | SWAP         | HOME         |
+--------------+--------------+--------------+--------------+
```

---

## [Lvm](/Andromeda/storage/preparation/uefi-ext4/)

```
+-----------------------------------------------------------+
|                      Physical volume                      |
+-----------------------------------------------------------+
|                       Group volume                        |
+-------------------+-------------------+-------------------+
| Logical volume 1  | Logical volume 2  | Logical volume 3  |
| SWAP              | ROOT              | HOME              |
+-------------------+-------------------+-------------------+
```

---

## [Lvm-Dmcrypt](/Andromeda/storage/preparation/uefi-ext4/)

```
+-----------------------------------------------------------+
|                      Physical volume                      |
+-----------------------------------------------------------+
|                        Group volume                       |
+-------------------+-------------------+-------------------+
| Logical volume 1  | Logical volume 2  | Logical volume 3  |
+-------------------+-------------------+-------------------+
| Plain Encrypted   | LUKS1 encrypted   | LUKS1 encrypted   |
| SWAP              | ROOT              | HOME              |
+-------------------+-------------------+-------------------+
```

---

## [Btrfs](/Andromeda/storage/preparation/uefi-ext4/)

```
subvolid=5 (/dev/mapper/btrfs)
   ├── @ (mounted as /)
   |       ├── /home                  (mounted @home subvolume)
   |       ├── /.snapshots            (mounted @snapshots subvolume)
   |       ├── /.swap                 (mounted @swap subvolume)
   |       |
   |       ├── /var/cache/pacman/pkg  (nested subvolume)
   |       ├── /var/abs               (nested subvolume)
   |       ├── /var/tmp               (nested subvolume)
   |       ├── /srv                   (nested subvolume)
   ├── @home (mounted as /home)
   ├── @snapshots (mounted as /.snapshots)
   └── @swap (mounted as /.swap)
```
