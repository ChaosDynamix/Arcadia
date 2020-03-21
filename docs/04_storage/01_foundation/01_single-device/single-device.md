---
layout: default
title: Single device
permalink: /storage/foundation/single-device/
grand_parent: Storage
parent: Foundation
nav_order: 1
---

# Storage foundation for single device

---

## Encrypted foundation

### [Luks on partition](/Andromeda/storage/foundation/single-device/luks-partition/)
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

### [Luks on device](/Andromeda/storage/foundation/single-device/luks-device/)
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
