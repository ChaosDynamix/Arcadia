---
title     : !!str Firmware
nav_order : !!int 2
permalink : !!str /live-environment/firmware
parent    : !!str Live environment
---

# {{ page.title }}
{: .no_toc }

This page describes how to verify the boot mode of your computer. This guide only cover the UEFI boot mode.
{: .fs-5 .fw-300}

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

## Verify the boot mode of the live environment

UEFI firmware is required to follow this guide. This guide don't cover BIOS and UEFI-CSM modes. Make sure that EFI variables are available with the following command.

```
ls /sys/firmware/efi/efivars
```

| Firmware / mode    | Result            |
| :----------------- | :---------------- |
| UEFI               | List of variables |
| UEFI with CSM mode | No directory      |
| BIOS               | No directory      |

### References
{: .text-delta .pt-4}

1. [Wikipedia - Firmware](https://en.wikipedia.org/wiki/Firmware)
1. [Wikipedia - BIOS](https://en.wikipedia.org/wiki/BIOS)
1. [Wikipedia - UEFI](https://en.wikipedia.org/wiki/Unified_Extensible_Firmware_Interface)
1. [ArchWiki - UEFI](https://wiki.archlinux.org/index.php/Unified_Extensible_Firmware_Interface)
1. [ManPage - Ls](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/coreutils/ls.1.en)
{: .fs-3}
