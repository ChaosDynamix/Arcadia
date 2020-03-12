---
layout: default
title: Controller
permalink: /storage/controller/
parent: Storage
nav_order: 2
has_children: true
has_toc: false
---

# Storage controller

---

## Logical Volume Manager

Logical Volume Manager (LVM) is a device mapper target that provides logical volume management for the Linux kernel.

LVM storage scenarios includes Ext4 file system for the Root and Home partitions.

### [Lvm](/Andromeda/storage/controller/lvm-ext4/)
{: .no_toc .d-inline-block}

UEFI-LVM
{: .label .label-blue .ml-2}

UEFI-LUKS
{: .label .label-blue}

UEFI-RAID1-LUKS
{: .label .label-blue}

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

### [Lvm-Dmcrypt](/Andromeda/storage/controller/lvm-dmcrypt-ext4/)
{: .no_toc .d-inline-block}

UEFI-LVM
{: .label .label-blue .ml-2}

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

## File system

The file system or filesystem (often abbreviated to fs), controls how data is stored and retrieved. Without a file system, data placed in a storage medium would be one large body of data with no way to tell where one piece of data stops and the next begins. By separating the data into pieces and giving each piece a name, the data is easily isolated and identified.

### [Ext4](/Andromeda/storage/controller/ext4/)
{: .no_toc .d-inline-block}

UEFI-EXT4
{: .label .label-blue .ml-2}

BIOS-GPT-EXT4
{: .label .label-blue}

```
+-------------------+-------------------+-------------------+
| Root partition    | Swap partition    | Home partition    |
+-------------------+-------------------+-------------------+
```

### [Btrfs](/Andromeda/storage/controller/btrfs/)
{: .no_toc .d-inline-block}

UEFI-BTRFS
{: .label .label-blue .ml-2}

UEFI-LUKS
{: .label .label-blue}

UEFI-RAID1-LUKS
{: .label .label-blue}

```
subvolid=5
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

---
