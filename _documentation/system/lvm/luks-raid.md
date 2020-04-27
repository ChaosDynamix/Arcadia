---
title: Luks on Raid
uuid: ff8a81bc-82d1-440a-9f71-df9676a19a26
nav_order: 3
---

# {{ page.title }}
{: .d-inline-block}

ENCRYPTED BOOT
{: .label .label-blue .ml-2}

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
