---
layout: default
title: 03 Network
nav_order: 3
parent: 05 Configuration
permalink: /configuration/network/
has_children: true
has_toc: false
---

# Configuration of the network
{: .no_toc}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

## Set the hostname

```bash
echo myhostname > /etc/hostname
```

### References
{: .no_toc .text-delta .pt-4}

- [ArchWiki - Installation guide - Network configuration](https://wiki.archlinux.org/index.php/Installation_guide#Network_configuration)
- [Man - echo](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/coreutils/echo.1.en)

---

## Set the hosts

#### /etc/hosts
{: .no_toc .pt-4}

```bash
127.0.0.1   localhost
::1         localhost
127.0.1.1   myhostname.localdomain	myhostname
```

### References
{: .no_toc .text-delta .pt-4}

- [ArchWiki - Installation guide - Network configuration](https://wiki.archlinux.org/index.php/Installation_guide#Network_configuration)

---

## Install a manager

```bash
pacman -S networkmanager
systemctl enable NetworkManager
```

### References
{: .no_toc .text-delta .pt-4}

- [ArchWiki - NetworkManager](https://wiki.archlinux.org/index.php/NetworkManager)
- [ArchWiki - Systemctl](https://wiki.archlinux.org/index.php/Systemd#Basic_systemctl_usage)
