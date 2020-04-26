---
title: Luks on single partition
uuid: cf65c6ee-bd52-47c4-af3d-a53c0ff8b032
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
                         | B-tree filesystem                |
                         +----------------------------------+
```
