---
title     	: !!str Luks on single partition
nav_order 	: !!int 1
has_children	: !!bool true
---

# {{ page.title }}
{: .d-inline-block}

ENCRYPTED BOOT
{: .label .label-blue}

IN PROGRESS
{: .label .label-red}

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
