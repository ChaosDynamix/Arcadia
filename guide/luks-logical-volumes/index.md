---
title     	: !!str Luks on logical volumes
nav_order 	: !!int 4
has_children	: !!bool true
permalink	: !!str /luks-logical-volumes
---

# {{ page.title }}
{: .d-inline-block}

ENCRYPTED BOOT
{: .label .label-blue}

IN PROGRESS
{: .label .label-red}

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
