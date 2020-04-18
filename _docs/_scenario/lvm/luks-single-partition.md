---
title: Luks on single partition
nav_order: 1
has_children: true
---

# {{ page.section | upcase }} / {{ page.title }}

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
