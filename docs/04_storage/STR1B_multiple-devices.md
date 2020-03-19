---
layout: default
title: Multiple devices
permalink: /storage/foundation/multiple-devices/
grand_parent: Storage
parent: Foundation
nav_order: 2
---

# Storage Foundation for multiple devices
{: .no_toc}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

## Universal foundations

### [Luks on partition](/Andromeda/storage/foundation/)
{: .no_toc .pt-2}

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

### [Luks on Raid1](/Andromeda/storage/foundation/)
{: .no_toc .pt-4}

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

---

## Lvm specific foundations

### [Luks on Lvm](/Andromeda/storage/foundation/)
{: .no_toc .pt-2}

If you want to encrypt the volumes instead of the partitions itself, you can select this non-encrypted foundation. LVM can be used to have encrypted volumes span multiple disks. Easy mix of un-/encrypted volume groups

```
Device 1                               Device 2
+----------------------------------+   +--------------------+
| Partition   | Partition          |   | Partition          |
| BIOS/EFI    | LVM                |   | LVM                |
+-------------+-----||-------------+   +-------------||-----+
              +-----\/-------------------------------\/-----+
              |            Logical Volume Manager           |
              +--------------+--------------+---------------+
              | Volume       | Volume       | Volume        |
              | SWAP         | ROOT         | HOME          |
              +--------------+--------------+---------------+
              | Container    | Container    | Container     |
              | PLAIN        | LUKS1        | LUKS1         |
              +--------------+--------------+---------------+      
```
