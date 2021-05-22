---
title     : !!str Network
nav_order : !!int 5
permalink : !!str /system/network
parent    : !!str System
---

# {{ page.title }}
{: .no_toc }

This page describes how to create a network configuration and configure the systemd network manager.
{: .fs-5 .fw-300}

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

## Setup the network informations

### Set the hostname in `/etc/hostname`

```
myhostname
```

### Set the hosts in `/etc/hosts`

```
127.0.0.1    localhost
::1          localhost
127.0.1.1    myhostname.localdomain    myhostname
```

---

## Install and activate Network Manager


### Installation
```
pacman -S networkmanager
```

### Activation
```
systemctl enable NetworkManager.service
```

#### References
{: .text-delta .pt-4}

1. [ArchWiki - Network Manager](https://wiki.archlinux.org/title/NetworkManager)
1. [ArchWiki - Network configuration](https://wiki.archlinux.org/index.php/Network_configuration)
1. [ManPage - Systemctl](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/systemd/systemctl.1.en)
{: .fs-3}
