---
layout: default
title: Boot mode
permalink: /live-environment/boot-mode/
parent: Live environment
nav_order: 2
---

# Boot mode
{: .no_toc}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

## Verify the boot mode

```bash
$ ls /sys/firmware/efi/efivars
```

| Firmware           | Result |
| :----------------- | :----- |
| UEFI               | Yes    |
| UEFI with CSM mode | No     |
| BIOS               | No     |

---

## References
{: .no_toc}

### BOOT MODE
{: .no_toc .text-delta .pt-2}

1. [ArchWiki - Installation guide - Verify the boot mode](https://wiki.archlinux.org/index.php/Installation_guide#Verify_the_boot_mode)

### MANUALS
{: .no_toc .text-delta .pt-4}

1. [Man page - ls](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/coreutils/ls.1.en)