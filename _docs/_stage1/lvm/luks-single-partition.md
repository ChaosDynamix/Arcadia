---
title: Luks on single partition
nav_order: 1
has_children: true
---

# {{ page.title }}

Luks on single partition for the Logical Volume Manager. The boot partition is in the root volume and decrypted by GRUB during boot.
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
