---
title: Firmware
---

# Firmware
This page describes how to verify the boot mode of your computer. This guide only cover the UEFI boot mode.

## Verify the boot mode of the live environment
UEFI firmware is required to follow this guide. This guide don't cover BIOS and UEFI-CSM modes. Make sure that EFI variables are available with the following command.

``` bash
ls /sys/firmware/efi/efivars
```

| Firmware / mode    | Result            |
| :----------------- | :---------------- |
| UEFI               | List of variables |
| UEFI with CSM mode | No directory      |
| BIOS               | No directory      |

---

??? info "References"
    - [Wikipedia - Firmware](https://en.wikipedia.org/wiki/Firmware)
    - [Wikipedia - BIOS](https://en.wikipedia.org/wiki/BIOS)
    - [Wikipedia - UEFI](https://en.wikipedia.org/wiki/Unified_Extensible_Firmware_Interface)
    - [ArchWiki - UEFI](https://wiki.archlinux.org/index.php/Unified_Extensible_Firmware_Interface)
    - [ManPage - Ls](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/coreutils/ls.1.en)
