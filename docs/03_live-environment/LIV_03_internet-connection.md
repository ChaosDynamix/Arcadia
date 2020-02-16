---
layout: default
title: LIV_Internet connection
nav_order: 3
has_children: false
parent: Live environment
permalink: /live-environment/internet-connection/
has_toc: false
---

# Live environment internet connection
{: .no_toc}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

## About

The Arch Linux installation require a working internet connection in order to download the needed package.
This step verify that the connection is active.

## Ensure your network interface is listed and enabled

```bash
ip link
```

The UP in <BROADCAST,MULTICAST,UP,LOWER_UP> is what indicates the interface is up.

## Ethernet

The Arch Linux live environment provide a DHCP client, if you have a DHCP server and a working ethernet card, the configuration might be already done.

### Check connectivity
{: .no_toc}

```bash
## -c option limit the ping attempts to the number append to it
ping -c 3 archlinux.org
```

### References
{: .no_toc .text-delta .pt-5}

- [ArchWiki - Installation guide - Connect to the internet](https://wiki.archlinux.org/index.php/Installation_guide#Connect_to_the_internet)
- [Manual - ping](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/iputils/ping.8.en)
