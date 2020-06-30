## Setup the live environment network

### Ensure your network interface is listed and enabled
```
$ ip link
```

### Check connectivity
```
$ ping -c 3 archlinux.org
```

### Update the system clock
```
$ timedatectl set-ntp true
```

### References
{: .text-delta .pt-4}

1. [Wikipedia - Computer network](https://en.wikipedia.org/wiki/Computer_network)
1. [ArchWiki - Network configuration](https://wiki.archlinux.org/index.php/Network_configuration)
1. [ArchWiki - System time](https://wiki.archlinux.org/index.php/System_time)
1. [ManPage - Ip](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/man-pages/ip.7.en)
1. [ManPage - Ping](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/iputils/ping.8.en)
1. [ManPage - Timedatectl](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/systemd/timedatectl.1.en)
{: .fs-3}
