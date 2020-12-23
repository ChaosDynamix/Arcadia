---
title     : !!str Timezone
nav_order : !!int 3
permalink : !!str /system/timezone
parent    : !!str System
---

## Setup the timezone

This following command create an `/etc/localtime` symlink that points to a zoneinfo file under `/usr/share/zoneinfo/`.

```
ln -sf /usr/share/zoneinfo/Europe/Paris /etc/localtime
```

**Note**: This command set the Paris timezone, if you are living in a different area, run `ls /usr/share/zoneinfo/` to select your location and replace `Europe/Paris` in the above command.
{: .fs-3}

#### References
{: .text-delta .pt-4}

1. [Wikipedia - Timezone](https://en.wikipedia.org/wiki/Time_zone)
1. [ArchWiki - Installation guide](https://wiki.archlinux.org/index.php/Installation_guide)
1. [ManPage - Ln](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/coreutils/ln.1.en)
1. [ManPage - Ls](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/coreutils/ls.1.en)
{: .fs-3}

---

## Set the hardware clock from your system clock

The following sets the hardware clock from the system clock. Additionally it updates `/etc/adjtime` or creates it if not present.

```
$ hwclock --systohc --utc
```

#### References
{: .text-delta .pt-4}

1. [Wikipedia - System time](https://en.wikipedia.org/wiki/System_time)
1. [ArchWiki - Installation guide](https://wiki.archlinux.org/index.php/Installation_guide#Time_zone)
1. [ArchWiki - System time](https://wiki.archlinux.org/index.php/System_time#Hardware_clock_and_system_clock)
1. [ManPage - Hwclock](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/util-linux/hwclock.8.en)
{: .fs-3}
