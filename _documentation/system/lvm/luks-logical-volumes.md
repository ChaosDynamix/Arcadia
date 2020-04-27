---
title: Luks on logical volumes
uuid: a852843f-53ac-47e9-a82d-d6cf288c8b76
nav_order: 4
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
