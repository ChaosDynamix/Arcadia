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

## [Ext4](/Andromeda/storage/controller/ext4/)

```
+-------------------+-------------------+-------------------+
| Root partition    | Swap partition    | Home partition    |
+-------------------+-------------------+-------------------+
```

---

## [Lvm](/Andromeda/storage/controller/lvm/)

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

## [Lvm-Dmcrypt](/Andromeda/storage/controller/lvm-dmcrypt/)

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

## [Btrfs](/Andromeda/storage/controller/btrfs/)

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
