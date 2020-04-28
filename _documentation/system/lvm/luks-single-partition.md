---
title: Luks on single partition
uuid: b84ab5fb-9500-4b17-b322-bd04e31f5d3a
nav_order: 1
---

# {{ page.title }}
{: .d-inline-block}

ENCRYPTED BOOT
{: .label .label-blue}

TESTED
{: .label .label-green}

The straightforward method is to set up LVM on top of the encrypted partition instead of the other way round. Technically the LVM is setup inside one big encrypted blockdevice. Hence, the LVM is not transparent until the blockdevice is unlocked and the underlying volume structure is scanned and mounted during boot.
{: .fs-5 .fw-300 }

```text
Device
+------------------------+----------------------------------+
| Partition BIOS/EFI     | Partition LUKS                   |
+------------------------+----------------------------------+
                         | Container LUKS1                  |
                         +----------------------------------+
                         | Logical Volume Manager           |
                         +----------------------------------+
```
