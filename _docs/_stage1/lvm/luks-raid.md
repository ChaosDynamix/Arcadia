---
title: Luks on Raid
nav_order: 3
has_children: true
---

# {{ page.title }}

```text
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
