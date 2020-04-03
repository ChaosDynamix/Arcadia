---
layout: default
title: Network
permalink: /configuration/network/
parent: Configuration
nav_order: 2
---

# Configuration / Network
{: .no_toc}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

## Set the hostname

```bash
$ echo hostname > /etc/hostname
```

---

## Set the hosts

/etc/hosts
{: .fs-3 .mb-0}

```bash
127.0.0.1   localhost
::1         localhost
127.0.1.1   myhostname.localdomain	myhostname
```

---

## Install a manager

#### NETWORKMANAGER
{: .no_toc .pt-2}

```bash
$ pacman -S networkmanager
$ systemctl enable NetworkManager
```

---

## References
{: .no_toc}

### NETWORK
{: .no_toc .text-delta .pt-2}

1. [ArchWiki - Installation guide - Network configuration](https://wiki.archlinux.org/index.php/Installation_guide#Network_configuration)
1. [ArchWiki - Network configuration - Set the hostname](https://wiki.archlinux.org/index.php/Network_configuration#Set_the_hostname)
1. [ArchWiki - Network configuration - Network managers](https://wiki.archlinux.org/index.php/Network_configuration#Network_managers)
1. [ArchWiki - NetworkManager](https://wiki.archlinux.org/index.php/NetworkManager)
1. [ArchWiki - Systemctl - Basic systemctl usage](https://wiki.archlinux.org/index.php/Systemd#Basic_systemctl_usage)

### MANUALS
{: .no_toc .text-delta .pt-4}

1. [Man page - systemctl](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/systemd/systemctl.1.en)

---
