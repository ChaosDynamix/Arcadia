---
layout: default
title: Foundation
permalink: /storage/foundation/
parent: Storage
nav_order: 1
has_children: true
has_toc: false
---

# Storage foundation

---

## Encrypted foundations

### [Luks on single partition](/Andromeda/storage/foundation/luks-single-partition/)
{: .no_toc .pt-2}

Luks on single partition is the simplest way to achieve a full system encryption. You first create a partition and after the encrypted container. You can then select Logical Volume Manager or B-tree filesystem for create the volumes required by linux.

```
+-----------------------------------------------------------+
|                         Partition                         |
+-----------------------------------------------------------+
|                      LUKS1 container                      |
+-----------------------------------------------------------+
```

### [Luks on multiple partitions](/Andromeda/storage/foundation/luks-multiple-partitions/)
{: .no_toc .pt-4}

Different to Luks on a partition, Luks on multiple partitions allow multi-device spanning to contain the system using LVM or BTRFS. Udev is replaced by Systemd in order to decrypt multiple devices on boot easily with crypttab.initramfs.

```
Device 1                        Device 2
+---------------------------+   +---------------------------+
| Partition                 |   | Partition                 |
+---------------------------+   +---------------------------+
| LUKS1 container           |   | LUKS1 container           |
+---------------------------+   +---------------------------+
```

### [Luks on Raid1](/Andromeda/storage/foundation/luks-raid1/)
{: .no_toc .pt-4}

Different to Luks on multiple partitions, Luks on Raid1 is a mirroring system used for data redundancy. Only use this scenario with devices with the same size. Due to the redundancy feature, this scenario reduce the final system size.

```
Device 1                        Device 2
+---------------------------+   +---------------------------+
| Partition                 |   | Partition                 |
+-----------------------------------------------------------+
|                        RAID1 Array                        |
+-----------------------------------------------------------+
|                      LUKS1 Container                      |
+-----------------------------------------------------------+    
```

### [Luks on device](/Andromeda/storage/foundation/luks-device/)
{: .no_toc .pt-4}

Different to Luks on single partition, Luks on device dont require a partition table, all the device is encrypted. The informations of the device (header) are moved to a USB flash drive which also contain the informations needed for your computer to boot on the system (EFI / Boot sector). This solution is recommended for users who want high protection over the data.

```
Device                                   USB flash drive
+------------------------------------+   +------------------+
| LUKS1 container                    |   | Partition        |
+------------------------------------+   +------------------+
```

---

## Non-encrypted foundations

### [Lvm on multiple partitions](/Andromeda/storage/foundation/lvm-multiple-partitions/)
{: .no_toc .pt-2}

If you want to encrypt the volumes instead of the partitions itself, you can select this non-encrypted foundation. LVM can be used to have encrypted volumes span multiple disks. Easy mix of un-/encrypted volume groups

```
Device 1                        Device 2
+---------------------------+   +---------------------------+
| LVM Partition             |   | LVM Partition             |
+---------------------------+   +---------------------------+
```
