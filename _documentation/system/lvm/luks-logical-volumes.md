---
title: Luks on logical volumes
uuid: a852843f-53ac-47e9-a82d-d6cf288c8b76
nav_order: 4
---

# {{ page.title }}
{: .d-inline-block}

ENCRYPTED BOOT
{: .label .label-blue}

UNTESTED
{: .label .label-yellow}

To use encryption on top of LVM, the LVM volumes are set up first and then used as the base for the encrypted partitions. This way, a mixture of encrypted and non-encrypted volumes/partitions is possible as well.
{: .fs-5 .fw-300 }

```text
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
