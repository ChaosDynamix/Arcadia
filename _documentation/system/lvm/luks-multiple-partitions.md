---
title: Luks on multiple partitions
uuid: 66df9fd1-5ee6-42a1-831e-b3b9d6e26524
nav_order: 2
---

# {{ page.title }}
{: .d-inline-block}

ENCRYPTED BOOT
{: .label .label-blue}

UNTESTED
{: .label .label-yellow}

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
