---
title: Luks on logical volumes
nav_order: 4
has_children: true
---

# {{ page.title }}

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
