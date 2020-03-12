---
layout: default
title: System clock
permalink: /live-environment/system-clock/
parent: Live environment
nav_order: 4
---

# Live environment system clock

---

## Update the system clock

### Activate the NTP service
{: .no_toc .pt-2}

```bash
$ timedatectl set-ntp true
```

### Check the current system clock time, NTP service and the RTC
{: .no_toc .pt-4}

```bash
$ timedatectl
```
