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

| Base            | Controller       |
| :-------------- | :--------------- |
| Uefi-Ext4       | Ext4             |
| Uefi-Lvm        | Lvm, Lvm-Dmcrypt |
| Uefi-Btrfs      | Btrfs            |
| Uefi-Luks       | Lvm, Btrfs       |
| Uefi-Raid1-Luks | Lvm, Btrfs       |

## Logical Volume Manager

Logical Volume Manager (LVM) is a device mapper target that provides logical volume management for the Linux kernel.

### [Lvm-Ext4](/Andromeda/storage/controller/lvm-ext4/)
{: .no_toc .pt-4}

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

### [Lvm-Dmcrypt-Ext4](/Andromeda/storage/controller/lvm-dmcrypt-ext4/)
{: .no_toc .pt-4}

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
{: .no_toc .pt-2}

```
+-------------------+-------------------+-------------------+
| Root partition    | Swap partition    | Home partition    |
+-------------------+-------------------+-------------------+
```

### [Btrfs](/Andromeda/storage/controller/btrfs/)
{: .no_toc .pt-4}

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
