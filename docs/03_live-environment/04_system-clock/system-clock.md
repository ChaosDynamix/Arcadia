---
layout: default
title: System clock
permalink: /live-environment/system-clock/
parent: Live environment
nav_order: 4
---

# Live environment system clock
{: .no_toc}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

## Activate the NTP service

```bash
$ timedatectl set-ntp true
```

---

## Check the current system clock time, NTP service and the RTC

```bash
$ timedatectl
```

---

## References
{: .no_toc}

### SYSTEM CLOCK
{: .no_toc .text-delta .pt-2}

1. [ArchWiki - Installation guide - Update the system clock](https://wiki.archlinux.org/index.php/Installation_guide#Update_the_system_clock)
1. [ArchWiki - System time](https://wiki.archlinux.org/index.php/System_time)

### MANUALS
{: .no_toc .text-delta .pt-4}

1. [Man page - timedatectl](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/systemd/timedatectl.1.en)
