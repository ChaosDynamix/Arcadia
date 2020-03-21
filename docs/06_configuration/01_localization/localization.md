---
layout: default
title: Localization
permalink: /configuration/localization/
parent: Configuration
nav_order: 1
has_toc: false
---

# Configuration of the localization
{: .no_toc}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

## Create symbolic link for the time zone

```bash
$ ln -sf /usr/share/zoneinfo/Region/City /etc/localtime
```

---

## Synchronize the hardware clock with the system clock

```bash
$ hwclock --systohc --utc
```

---

## Select needed locales

/etc/locale.gen
{: .fs-3 .mb-0}

```bash
# Uncomment the needed locales
fr_FR.UTF-8 UTF-8
en_US.UTF-8 UTF-8
```

---

## Generate locales

```bash
$ locale-gen
```

---

## Set the system locale

/etc/locale.conf
{: .fs-3 .mb-0}

```bash
LANG=fr_FR.UTF-8
LC_COLLATE=C
```

---

## Set the console locale

/etc/vconsole.conf
{: .fs-3 .mb-0}

```bash
KEYMAP=fr-latin9
```

---

## References
{: .no_toc}

### TIME ZONE
{: .no_toc .text-delta .pt-2}

1. [Wikipedia - Time zone](https://en.wikipedia.org/wiki/Time_zone)
1. [ArchWiki - Installation guide - Time zone](https://wiki.archlinux.org/index.php/Installation_guide#Time_zone)
1. [ArchWiki - System time - Time zone](https://wiki.archlinux.org/index.php/System_time#Time_zone)

### SYSTEM TIME CLOCK
{: .no_toc .text-delta .pt-4}

1. [Wikipedia - System time](https://en.wikipedia.org/wiki/System_time)

### REAL TIME CLOCK
{: .no_toc .text-delta .pt-4}

1. [Wikipedia - Real time clock](https://en.wikipedia.org/wiki/Real-time_clock)
1. [ArchWiki - System time - Hardware clock](https://wiki.archlinux.org/index.php/System_time#Hardware_clock)

### LOCALIZATION
{: .no_toc .text-delta .pt-4}

1. [ArchWiki - Installation guide - Localization](https://wiki.archlinux.org/index.php/Installation_guide#Localization)
1. [ArchWiki - Locale](https://wiki.archlinux.org/index.php/Locale)
1. [ArchWiki - Linux console - Keyboard configuration](https://wiki.archlinux.org/index.php/Linux_console/Keyboard_configuration)

### MANUALS
{: .no_toc .text-delta .pt-4}

1. [Man page - ln](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/coreutils/ln.1.en)
1. [Man page - hwclock](https://jlk.fjfi.cvut.cz/arch/manpages/man/hwclock.8)