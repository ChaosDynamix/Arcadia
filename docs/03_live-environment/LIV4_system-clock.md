---
layout: default
title: System clock
permalink: /live-environment/system-clock/
parent: Live environment
nav_order: 4
---

# Live environment system clock

---

### Update the system clock
{: .no_toc .pt-2}

```bash
# Activate the NTP service
$ timedatectl set-ntp true

# Check the current system clock time, NTP service and the RTC
$ timedatectl
```
