---
layout: default
title: Base
permalink: /storage/base/
parent: Storage
nav_order: 1
has_children: true
has_toc: false
---

# Storage base

---

## [Uefi-Ext4](/Andromeda/storage/base/uefi-ext4/)

```
+--------------+--------------+--------------+--------------+
| EFI system   | Root         | Swap         | Home         |
| partition    | partition    | partition    | partition    |
| /dev/sda1    | /dev/sda2    | /dev/sda3    | /dev/sda4    |
+--------------+--------------+--------------+--------------+
```

---

## [Uefi-Lvm](/Andromeda/storage/base/uefi-lvm/)

```
+----------------------+------------------------------------+
| EFI system partition | LVM partition                      |
| /dev/sda1            | /dev/sda2                          |
+----------------------+------------------------------------+
```

---

## [Uefi-Btrfs](/Andromeda/storage/base/uefi-btrfs/)

```
+----------------------+------------------------------------+
| EFI system partition | BTRFS partition                    |
| /dev/sda1            | /dev/sda2                          |
+----------------------+------------------------------------+
```

---

## [Uefi-Luks](/Andromeda/storage/base/uefi-luks/)

This scenario includes Luks1 with an encrypted /boot. A key is implemented in the Initramfs avoiding us to enter two passphrases during the boot.

```
+----------------------+------------------------------------+
| EFI system partition | LUKS1 encrypted partition          |
|                      +------------------------------------+
| /dev/sda1            | /dev/sda2                          |
+----------------------+------------------------------------+
```

---

## [Uefi-Raid1-Luks](/Andromeda/storage/base/uefi-raid1-luks/)

This scenario includes Luks1 with an encrypted /boot. A key is implemented in the Initramfs avoiding us to enter two passphrases during the boot.

```
Drive 1                           Drive 2
+------------+-----------------+  +------------+-----------------+
| EFI system | LUKS1 encrypted |  | EFI system | LUKS1 encrypted |
| partition  | volume          |  | partition  | volume          |
|            +-----------------+  |            +-----------------+
|            | RAID1 array     |  |            | RAID1 array     |
|            +-----------------+  |            +-----------------+
| /dev/sda1  | /dev/sda2       |  | /dev/sdb1  | /dev/sdb2       |
+------------+-----------------+  +------------+-----------------+
```