---
layout: default
title: LIV4 System clock
nav_order: 4
has_children: false
parent: 04 Live environment
permalink: /live-environment/system-clock/
has_toc: false
---

# Live environment system clock
{: .no_toc}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

## About

The system clock (a.k.a. the software clock) keeps track of: time, time zone, and DST if applicable. It is calculated by the Linux kernel as the number of seconds since midnight January 1st 1970, UTC.

The initial value of the system clock is calculated from the real-time clock, dependent on the contents of `/etc/adjtime`.

After boot-up has completed, the system clock runs independently of the real-time clock. The Linux kernel keeps track of the system clock by counting timer interrupts.

### Real-time clock
{: .no_toc}

The real-time clock (RTC) is a computer clock (most often in the form of an integrated circuit) that keeps track of the time.

On a motherboard, this integrated circuit is powered by a CMOS battery (usually a CR2032 button cell).

### Network Time Protocol
{: .no_toc}

The Network Time Protocol (NTP) is a networking protocol for clock synchronization between computer systems over packet-switched, variable-latency data networks.

### References
{: .no_toc .text-delta .pt-5}

- [ArchWiki - System time](https://wiki.archlinux.org/index.php/System_time)
- [Wikipedia - System time](https://en.wikipedia.org/wiki/System_time)
- [Wikipedia - Real time clock](https://en.wikipedia.org/wiki/Real-time_clock)
- [Wikipedia - Network Time Protocol](https://en.wikipedia.org/wiki/Network_Time_Protocol)

---

## Update the system clock

In order to synchronize the time and date, we will activate the NTP service on the system clock.

```bash
## Activate the NTP service
timedatectl set-ntp true

## Check the current system clock time, NTP service and the RTC
timedatectl
```

### References
{: .no_toc .text-delta .pt-5}

- [ArchWiki - Installation guide - Update the system clock](https://wiki.archlinux.org/index.php/Installation_guide#Update_the_system_clock)
