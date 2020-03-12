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

## Uefi storage bases

The encrypted bases scenario includes Luks1 with an encrypted /boot. A key is implemented in the Initramfs avoiding us to enter two passphrases during the boot.

It also include a EFI system partition allowing the Uefi-compliant firmwares to load the boot manager.

### [Uefi-Ext4](/Andromeda/storage/base/uefi-ext4/)
{: .no_toc .pt-2}

```
+--------------+--------------+--------------+--------------+
| EFI system   | Root         | Swap         | Home         |
| partition    | partition    | partition    | partition    |
| /dev/sda1    | /dev/sda2    | /dev/sda3    | /dev/sda4    |
+--------------+--------------+--------------+--------------+
```

### [Uefi-Lvm](/Andromeda/storage/base/uefi-lvm/)
{: .no_toc .pt-4}

```
+----------------------+------------------------------------+
| EFI system partition | LVM partition                      |
| /dev/sda1            | /dev/sda2                          |
+----------------------+------------------------------------+
```

### [Uefi-Btrfs](/Andromeda/storage/base/uefi-btrfs/)
{: .no_toc .pt-4}

```
+----------------------+------------------------------------+
| EFI system partition | BTRFS partition                    |
| /dev/sda1            | /dev/sda2                          |
+----------------------+------------------------------------+
```

### [Uefi-Luks](/Andromeda/storage/base/uefi-luks/)
{: .no_toc .pt-4}

```
+----------------------+------------------------------------+
| EFI system partition | LUKS1 encrypted partition          |
|                      +------------------------------------+
| /dev/sda1            | /dev/sda2                          |
+----------------------+------------------------------------+
```

### [Uefi-Raid1-Luks](/Andromeda/storage/base/uefi-raid1-luks/)
{: .no_toc .pt-4}

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

---

## BIOS storage bases with GUID partition table

BIOS/GPT storage bases include a BIOS boot partition allowing the boot manager to install on it.

### [Bios-Gpt-Ext4](/Andromeda/storage/base/bios-gpt-ext4/)
{: .no_toc .pt-2}

```
+--------------+--------------+--------------+--------------+
| BIOS boot    | Root         | Swap         | Home         |
| partition    | partition    | partition    | partition    |
| /dev/sda1    | /dev/sda2    | /dev/sda3    | /dev/sda4    |
+--------------+--------------+--------------+--------------+
```
