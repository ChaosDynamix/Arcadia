---
layout: default
title: System clock
permalink: /live-environment/system-clock/
parent: Live environment
nav_order: 4
---

# Live environment / System clock

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

## Activate the NTP service

```
$ timedatectl set-ntp true
```

---

## Check the current system clock time, NTP service and the RTC

```
$ timedatectl
```

---

## References
{: .no_toc}

#### SYSTEM CLOCK
- [ArchWiki - Installation guide - Update the system clock](https://wiki.archlinux.org/index.php/Installation_guide#Update_the_system_clock)
- [ArchWiki - System time](https://wiki.archlinux.org/index.php/System_time)

#### MANUALS
- [Man page - timedatectl](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/systemd/timedatectl.1.en)
