---
layout: default
title: Foundation
permalink: /storage/foundation/
parent: Storage
nav_order: 1
has_children: true
has_toc: false
---

# Storage / Foundation

---

## Single device

### [Luks on single partition](/Andromeda/storage/foundation/luks-single-partition/)
{: .d-inline-block}

LVM
{: .label .label-blue .ml-2}

BTRFS
{: .label .label-blue}

Luks on single partition is the simplest way to achieve a full system encryption. You first create a partition and after the encrypted container. You can then select Logical Volume Manager or B-tree filesystem for create the volumes required by Arch Linux.

```
Device
+------------------------+----------------------------------+
| Partition BIOS/EFI     | Partition LUKS                   |
+------------------------+----------------------------------+
                         | Container LUKS1                  |
                         +----------------------------------+
```

### [Luks on device](/Andromeda/storage/foundation/luks-device/)
{: .pt-4 .d-inline-block}

LVM
{: .label .label-blue .ml-2}

BTRFS
{: .label .label-blue}

Different to Luks on single partition, Luks on device dont require a partition table, all the device is encrypted. The informations of the device (header) are moved to a USB flash drive which also contain the informations needed for your computer to boot on the system (EFI / Boot sector). This solution is recommended for users who want high protection over the data.

```
Device                                 USB flash device
+----------------------------------+   +--------------------+
| Container LUKS1                  |   | Partition BIOS/EFI |
+----------------------------------+   +--------------------+
```

---

## Multiple devices

### [Luks on multiple partitions](/Andromeda/storage/foundation/luks-multiple-partitions/)
{: .d-inline-block}

LVM
{: .label .label-blue .ml-2}

BTRFS
{: .label .label-blue}

Different to Luks on a partition, Luks on multiple partitions allow multi-device spanning to contain the system using LVM or BTRFS. Udev is replaced by Systemd in order to decrypt multiple devices on boot easily with crypttab.initramfs.

```
Device 1                               Device 2
+----------------------------------+   +--------------------+
| Partition   | Partition          |   | Partition          |
| BIOS/EFI    | LUKS               |   | LUKS               |
+-------------+--------------------+   +--------------------+
              | Container LUKS1    |   | Container LUKS1    |
              +--------------------+   +--------------------+
```

### [Luks on Raid1](/Andromeda/storage/foundation/luks-raid1/)
{: .pt-4 .d-inline-block}

LVM
{: .label .label-blue .ml-2}

BTRFS
{: .label .label-blue}

Different to Luks on multiple partitions, Luks on Raid1 is a mirroring system used for data redundancy. Only use this scenario with devices with the same size. Due to the redundancy feature, this scenario reduce the final system size.

```
Device 1                        Device 2
+-------------+-------------+   +-------------+-------------+
| Partition   | Partition   |   | Partition   | Partition   |
| BIOS/EFI    | RAID        |   | BIOS/EFI    | RAID        |
+-------------+-----||------+   +-------------+------||-----+
              +-----\/-------------------------------\/-----+
              |                 Array RAID1                 |
              +---------------------------------------------+
              |               Container LUKS1               |
              +---------------------------------------------+   
```

### [Luks on Lvm](/Andromeda/storage/foundation/luks-lvm/)
{: .pt-4 .d-inline-block}

LVM
{: .label .label-blue .ml-2}

If you want to encrypt the volumes instead of the partitions itself, you can select this non-encrypted foundation. LVM can be used to have encrypted volumes span multiple disks. Easy mix of un-/encrypted volume groups

```
Device 1                               Device 2
+----------------------------------+   +--------------------+
| Partition   | Partition          |   | Partition          |
| BIOS/EFI    | LVM                |   | LVM                |
+-------------+--------------------+   +--------------------+      
```

---

## References
