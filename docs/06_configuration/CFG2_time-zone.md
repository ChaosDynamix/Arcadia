---
layout: default
title: CFG2 Time zone
nav_order: 2
parent: 06 Configuration
permalink: /configuration/time-zone/
has_children: true
has_toc: false
---

# Configuration of the time zone
{: .no_toc}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

## Create a symbolic link

```bash
# Edit the time zone directory accordingly
ln -sf /usr/share/zoneinfo/Europe/Paris /etc/localtime
```

### References
{: .no_toc .text-delta .pt-4}

- [ArchWiki - Installation guide - Time zone](https://wiki.archlinux.org/index.php/Installation_guide#Time_zone)
- [Man - ln](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/coreutils/ln.1.en)

---

## Synchronize the hardware clock with the system clock

```bash
hwclock --systohc --utc
```

### References
{: .no_toc .text-delta .pt-4}

- [ArchWiki - Installation guide - Time zone](https://wiki.archlinux.org/index.php/Installation_guide#Time_zone)
- [Man - hwclock](https://jlk.fjfi.cvut.cz/arch/manpages/man/hwclock.8)
