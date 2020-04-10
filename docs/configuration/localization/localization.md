---
layout: default
title: Localization
permalink: /configuration/localization/
parent: Configuration
nav_order: 1
---

# Configuration / Localization

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

## Setup the time zone

### List the time zones

```
$ ls /usr/share/zoneinfo/
```

### Create a symbolic link

#### EXAMPLE

```
$ ln -sf /usr/share/zoneinfo/Europe/Paris /etc/localtime
```

---

## Synchronize the hardware clock with the system clock

```
$ hwclock --systohc --utc
```

---

## Select needed locales

##### /etc/locale.gen
```
# Uncomment the needed locales
fr_FR.UTF-8 UTF-8
en_US.UTF-8 UTF-8
```

---

## Generate locales

```
$ locale-gen
```

---

## Set the system locale

##### /etc/locale.conf
```
LANG=fr_FR.UTF-8
LC_COLLATE=C
```

---

## References
{: .no_toc}

#### TIME ZONE
- [Wikipedia - Time zone](https://en.wikipedia.org/wiki/Time_zone)
- [ArchWiki - Installation guide - Time zone](https://wiki.archlinux.org/index.php/Installation_guide#Time_zone)
- [ArchWiki - System time - Time zone](https://wiki.archlinux.org/index.php/System_time#Time_zone)

#### SYSTEM TIME CLOCK
- [Wikipedia - System time](https://en.wikipedia.org/wiki/System_time)

#### REAL TIME CLOCK
- [Wikipedia - Real time clock](https://en.wikipedia.org/wiki/Real-time_clock)
- [ArchWiki - System time - Hardware clock](https://wiki.archlinux.org/index.php/System_time#Hardware_clock)

#### LOCALIZATION
- [ArchWiki - Installation guide - Localization](https://wiki.archlinux.org/index.php/Installation_guide#Localization)
- [ArchWiki - Locale](https://wiki.archlinux.org/index.php/Locale)
- [ArchWiki - Linux console - Keyboard configuration](https://wiki.archlinux.org/index.php/Linux_console/Keyboard_configuration)

#### MANUALS
- [Man page - ln](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/coreutils/ln.1.en)
- [Man page - hwclock](https://jlk.fjfi.cvut.cz/arch/manpages/man/hwclock.8)
