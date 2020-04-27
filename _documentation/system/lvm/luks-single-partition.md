---
title: Luks on single partition
uuid: b84ab5fb-9500-4b17-b322-bd04e31f5d3a
nav_order: 1
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
