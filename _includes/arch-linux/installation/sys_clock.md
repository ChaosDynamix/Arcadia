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
