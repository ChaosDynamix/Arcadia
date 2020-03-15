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

### [Lvm for encrypted foundations](/Andromeda/storage/controller/lvm-encrypted-foundations/)
{: .no_toc .pt-2}

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

### [Lvm for non-encrypted foundations](/Andromeda/storage/controller/lvm-non-encrypted-foundations/)
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

## B-tree filesystem

Btrfs, an abbreviation for b-tree file system is a file system based on the copy-on-write (COW) principle, initially designed at Oracle Corporation for use in Linux.

Btrfs is intended to address the lack of pooling, snapshots, checksums, and integral multi-device spanning in Linux file systems.

### [Btrfs for encrypted foundations](/Andromeda/storage/controller/btrfs-encrypted-foundations/)
{: .no_toc .pt-2}

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
