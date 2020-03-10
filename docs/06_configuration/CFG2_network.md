---
layout: default
title: CFG2 Network
permalink: /configuration/network/
parent: Configuration
nav_order: 2
has_toc: false
---

# Configuration of the network
{: .no_toc}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

## Network

### Set the hostname
{: .no_toc .pt-2}

/etc/hostname
{: .fs-3 .mb-0}

```bash
myhostname
```

### Set the hosts
{: .no_toc .pt-4}

/etc/hosts
{: .fs-3 .mb-0}

```bash
127.0.0.1   localhost
::1         localhost
127.0.1.1   myhostname.localdomain	myhostname
```

### Install a manager
{: .no_toc .pt-4}

```bash
$ pacman -S networkmanager
$ systemctl enable NetworkManager
```

---

### GUIDES
{: .no_toc .text-delta .pt-4}

1. [ArchWiki - Installation guide - Network configuration](https://wiki.archlinux.org/index.php/Installation_guide#Network_configuration)
1. [ArchWiki - Network configuration - Set the hostname](https://wiki.archlinux.org/index.php/Network_configuration#Set_the_hostname)
1. [ArchWiki - Network configuration - Network managers](https://wiki.archlinux.org/index.php/Network_configuration#Network_managers)
1. [ArchWiki - NetworkManager](https://wiki.archlinux.org/index.php/NetworkManager)
1. [ArchWiki - Systemctl - Basic systemctl usage](https://wiki.archlinux.org/index.php/Systemd#Basic_systemctl_usage)

### MANUALS
{: .no_toc .text-delta .pt-2}

1. [Man page - systemctl](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/systemd/systemctl.1.en)

---
