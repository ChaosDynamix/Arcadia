---
layout: default
title: LIV2 Boot mode
nav_order: 2
has_children: false
parent: 04 Live environment
permalink: /live-environment/boot-mode/
has_toc: false
---

# Live environment boot mode
{: .no_toc}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

## About

When your computer starts, the firmware search for a specific location in order to launch your boot loader.

| Firmware                     | requirement   |
| :--------------------------- | :------------ |
| BIOS                         | Boot sector   |
| UEFI compliant               | EFI partition |
| UEFI compliant with CSM mode | Boot sector   |

### CSM mode
{: .no_toc}

To ensure backward compatibility, most UEFI compliant firmwares also support booting in legacy BIOS mode from MBR-partitioned disks, through the Compatibility Support Module (CSM) that provides legacy BIOS compatibility. In this scenario, booting is performed in the same way as on legacy BIOS-based systems, by ignoring the partition table and relying on the content of a boot sector.

### References
{: .no_toc .text-delta .pt-5}

- [Wikipedia - BIOS](https://en.wikipedia.org/wiki/BIOS)
- [Wikipedia - Boot sector](https://en.wikipedia.org/wiki/Boot_sector)
- [Wikipedia - UEFI](https://en.wikipedia.org/wiki/Unified_Extensible_Firmware_Interface)
- [Wikipedia - EFI system partition](https://en.wikipedia.org/wiki/EFI_system_partition)

---

## Verify the boot mode

The job here is to define if you need a boot sector or a EFI partition on your storage space. You can do that by checking the presence of the EFI variables on your system.

BIOS don't provide EFI variables, so if there is no result to the above command, you can assume that you are in BIOS or UEFI/CSM boot mode.

```bash
## Using ls
ls /sys/firmware/efi/efivars

## Using efivar
efivar -l
```

Knowing the boot mode allow us to define the proper partition layout and configuration. This information is very important for the next section.

### References
{: .no_toc .text-delta .pt-5}

- [ArchWiki - Installation guide - Verify the boot mode](https://wiki.archlinux.org/index.php/Installation_guide#Verify_the_boot_mode)
