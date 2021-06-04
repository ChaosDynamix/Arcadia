---
title: Timezone
---

# Timezone
This page describes how to setup the timezone configuration of the system and synchronize the hardware clock with the system clock.

## Setup the timezone
This following command create an `/etc/localtime` symlink that points to a zoneinfo file under `/usr/share/zoneinfo/`.

``` bash
ln -sf /usr/share/zoneinfo/Europe/Paris /etc/localtime
```

!!! note
    This command set the Paris timezone, if you are living in a different area, run `ls /usr/share/zoneinfo/` to select your location and replace `Europe/Paris` in the above command.

---

## Set the hardware clock from your system clock
The following sets the hardware clock from the system clock. Additionally it updates `/etc/adjtime` or creates it if not present.

``` bash
hwclock --systohc --utc
```

---

??? info "References"
    - [Wikipedia - Timezone](https://en.wikipedia.org/wiki/Time_zone)
    - [ArchWiki - Installation guide](https://wiki.archlinux.org/index.php/Installation_guide)
    - [ManPage - Ln](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/coreutils/ln.1.en)
    - [ManPage - Ls](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/coreutils/ls.1.en)
    - [Wikipedia - System time](https://en.wikipedia.org/wiki/System_time)
    - [ArchWiki - Installation guide](https://wiki.archlinux.org/index.php/Installation_guide#Time_zone)
    - [ArchWiki - System time](https://wiki.archlinux.org/index.php/System_time#Hardware_clock_and_system_clock)
    - [ManPage - Hwclock](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/util-linux/hwclock.8.en)
