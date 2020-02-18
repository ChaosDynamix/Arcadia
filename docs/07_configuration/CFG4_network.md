---
layout: default
title: CON4 Network
nav_order: 4
parent: 06 Configuration
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

## Hostname

```bash
echo myhostname > /etc/hostname
```

### References
{: .no_toc .text-delta .pt-4}

- [ArchWiki - Installation guide - Network configuration](https://wiki.archlinux.org/index.php/Installation_guide#Network_configuration)
- [Man - echo](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/coreutils/echo.1.en)

## Hosts

```bash
vim /etc/hosts
--------------------------------------------------
127.0.0.1   localhost
::1         localhost
127.0.1.1   myhostname.localdomain	myhostname
```

### References
{: .no_toc .text-delta .pt-4}

- [ArchWiki - Installation guide - Network configuration](https://wiki.archlinux.org/index.php/Installation_guide#Network_configuration)

## Manager

```bash
pacman -S networkmanager
systemctl enable NetworkManager
```

### References
{: .no_toc .text-delta .pt-4}

- [ArchWiki - NetworkManager](https://wiki.archlinux.org/index.php/NetworkManager)
- [ArchWiki - Systemctl](https://wiki.archlinux.org/index.php/Systemd#Basic_systemctl_usage)
