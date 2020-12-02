## Update the system clock with the Network Time protocol

The Network Time Protocol (NTP) is a networking protocol for clock synchronization between computer systems over packet-switched, variable-latency data networks.

### Enable the Network Time Protocol with Timedatectl
```
timedatectl set-ntp true
timedatectl status
```

### References
{: .text-delta .pt-4}

1. [Wikipedia - Network Time Protocol](https://en.wikipedia.org/wiki/Network_Time_Protocol)
1. [ArchWiki - System time](https://wiki.archlinux.org/index.php/System_time)
1. [ManPage - Timedatectl](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/systemd/timedatectl.1.en)
{: .fs-3}
