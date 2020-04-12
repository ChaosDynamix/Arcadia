---
layout: default
title: Luks on single partition
section: lvm
nav_order: 1
has_children: true
---

# {{ page.section | upcase }} / {{ page.title }}

```
Device
+------------------------+----------------------------------+
| Partition BIOS/EFI     | Partition LUKS                   |
+------------------------+----------------------------------+
                         | Container LUKS1                  |
                         +----------------------------------+
                         | Logical Volume Manager           |
                         +----------------------------------+
```
