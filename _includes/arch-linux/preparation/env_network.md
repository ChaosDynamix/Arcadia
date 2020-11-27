## Verify the internet connection of the live environment

### Ensure your network interface is listed and enabled

You can identify your ethernet network interface by looking at the prefix of the listed interfaces. 

| Prefix | Description                                          |
| :----- | :--------------------------------------------------- |
| en     | Ethernet                                             |
| wl     | Wireless local area network (WLAN)                   |
| lo     | Loop device (not used in making network connections) |

```
ip link
```

**Note**: The UP in <BROADCAST,MULTICAST,UP,LOWER_UP> is what indicates the interface is up, not the later state DOWN.
{: .fs-3}

### Ensure your network interface is configured by your DHCP server

If your network interface is properly connected to your network (ethernet cable plugged in), your DHCP server should take care of your network settings (ip/mask & gateway).

```
ip address show dev eno1
ip route show
```

**Caution**: Replace `eno1` if your network device name is different.
{: .fs-3 .text-red-200}

### Verify the internet connection
```
ping -c 3 archlinux.org
```

### References
{: .text-delta .pt-4}

1. [Wikipedia - Computer network](https://en.wikipedia.org/wiki/Computer_network)
1. [ArchWiki - Network configuration](https://wiki.archlinux.org/index.php/Network_configuration)
1. [ArchWiki - Network configuration / Ethernet](https://wiki.archlinux.org/index.php/Network_configuration/Ethernet)
1. [ManPage - Ip link](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/iproute2/ip-link.8.en)
1. [ManPage - Ip address](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/iproute2/ip-address.8.en)
1. [ManPage - Ip route](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/iproute2/ip-route.8.en)
1. [ManPage - Ping](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/iputils/ping.8.en)
{: .fs-3}
