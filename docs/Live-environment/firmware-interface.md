---
layout: default
title: Firmware interface
nav_order: 2
has_children: false
parent: Live environment
permalink: /live-environment/firmware-interface/
has_toc: false
---

# Live environment Firmware interface
{: .no_toc}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

## About

The firmware interface is the very first program that is executed once the system is switched on. Depending of what it is and its configuration, it will look for a specific place in order to launch the boot loader.

| Firmware interface | requirement   |
| ------------------ | ------------- |
| BIOS               | Boot sector   |
| UEFI               | EFI partition |
| UEFI with CSM      | Boot sector   |

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

Knowing the boot mode allow us to create the proper partition setup and that will be very important for the next section.

### References
{: .no_toc .text-delta .pt-5}

- [ArchWiki - Installation guide - Verify the boot mode](https://wiki.archlinux.org/index.php/Installation_guide#Verify_the_boot_mode)
