---
title     : !!str Network
nav_order : !!int 3
permalink : !!str /live-environment/network
parent    : !!str Live environment
---

# {{ page.title }}
{: .no_toc }

This page describes how to verify the network of the live environment, set the system clock using NTP protocol and allow an optional SSH connection on the computer you want to install Arch Linux on.
{: .fs-5 .fw-300}

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

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

---

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

---

## Connect another system into the live environment with SSH
{: .d-inline-block .mt-0}

OPTIONAL
{: .label .label-blue}

Secure Shell (SSH) is a cryptographic network protocol for operating network services securely over an unsecured network. Typical applications include remote command-line login and remote command execution, but any network service can be secured with SSH.

In this context, SSH daemon can be started to allow other systems to connect into the current live environment. It can be useful if you want to display this website and copy and paste commands.

### Get the ip address of your network interface
```
ip address show dev eno1
```

**Caution**: Replace `eno1` if your network interface name is different.
{: .fs-3 .text-red-200}

### Set the root password
```
passwd
```

### Start the SSH daemon
```
systemctl start sshd.service
```

### Start the SSH connection as root

This command must be running from another system than the current computer you want to install Arch Linux on.

```
ssh root@192.168.1.10
```

**Caution**: Replace `192.168.1.10` if your ip address is different.
{: .fs-3 .text-red-200}

### References
{: .text-delta .pt-4}

1. [Wikipedia - Computer network](https://en.wikipedia.org/wiki/Computer_network)
1. [ArchWiki - Network configuration](https://wiki.archlinux.org/index.php/Network_configuration#IP_addresses)
1. [ArchWiki - Secure shell](https://wiki.archlinux.org/index.php/Secure_Shell)
1. [ArchWiki - OpenSSH](https://wiki.archlinux.org/index.php/OpenSSH#Server_usage)
1. [ManPage - Ip-address](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/iproute2/ip-address.8.en)
{: .fs-3}
