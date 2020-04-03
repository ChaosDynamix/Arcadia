---
layout: default
title: Logical Volume Manager
permalink: /installation/lvm/
parent: Installation
nav_order: 1
has_children: true
has_toc: false
---

# Logical Volume Manager

---

## Single device

### [Luks on single partition](/Andromeda/installation/lvm/luks-single-partition/)

Luks on single partition is the simplest way to achieve a full system encryption. You first create a partition and after the encrypted container. You can then select Logical Volume Manager or B-tree filesystem for create the volumes required by Arch Linux.

```
Device
+------------------------+----------------------------------+
| Partition BIOS/EFI     | Partition LUKS                   |
+------------------------+----------------------------------+
                         | Container LUKS1                  |
                         +----------------------------------+
                         | Logical Volume Manager           |
                         +----------------------------------+
```

### [Luks on device](/Andromeda/installation/lvm/luks-device/)
{: .mt-8}

Different to Luks on single partition, Luks on device dont require a partition table, all the device is encrypted. The informations of the device (header) are moved to a USB flash drive which also contain the informations needed for your computer to boot on the system (EFI / Boot sector). This solution is recommended for users who want high protection over the data.

```
Device                                 USB flash device
+----------------------------------+   +--------------------+
| Container LUKS1                  |   | Partition BIOS/EFI |
+----------------------------------+   +--------------------+
| Logical Volume Manager           |
+----------------------------------+
```

---

## Multiple devices

### [Luks on multiple partitions](/Andromeda/installation/lvm/luks-multiple-partitions/)

Different to Luks on a partition, Luks on multiple partitions allow multi-device spanning to contain the system using LVM or BTRFS. Udev is replaced by Systemd in order to decrypt multiple devices on boot easily with crypttab.initramfs.

```
Device 1                               Device 2
+----------------------------------+   +--------------------+
| Partition   | Partition          |   | Partition          |
| BIOS/EFI    | LUKS               |   | LUKS               |
+-------------+--------------------+   +--------------------+
              | Container LUKS1    |   | Container LUKS1    |
              +-----||-------------+   +-------------||-----+
              +-----\/-------------------------------\/-----+
              |            Logical Volume Manager           |
              +---------------------------------------------+
```

### [Luks on Raid1](/Andromeda/installation/lvm/luks-raid1/)
{: .mt-8}

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
              |            Logical Volume Manager           |
              +---------------------------------------------+
```

### [Luks on logical volumes](/Andromeda/installation/lvm/luks-lvm/)
{: .mt-8}

If you want to encrypt the volumes instead of the partitions itself, you can select this non-encrypted foundation. LVM can be used to have encrypted volumes span multiple disks. Easy mix of un-/encrypted volume groups

```
Device 1                               Device 2
+----------------------------------+   +--------------------+
| Partition   | Partition          |   | Partition          |
| BIOS/EFI    | LVM                |   | LVM                |
+-------------+-----||-------------+   +-------------||-----+
              +-----\/-------------------------------\/-----+
              |            Logical Volume Manager           |
              +---------------------------------------------+
              |          Encrypted logical volumes          |
              +---------------------------------------------+       
```

---

## References
