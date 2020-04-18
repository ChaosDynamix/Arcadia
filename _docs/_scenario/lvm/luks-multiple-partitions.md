---
title: Luks on multiple partitions
nav_order: 2
has_children: true
---

# {{ page.section | upcase }} / {{ page.title }}

```text
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
