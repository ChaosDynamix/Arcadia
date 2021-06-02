---
title: Network
---

# Network
This page describes how to create a network configuration and configure the systemd network manager.

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
1. [ArchWiki - Network Manager](https://wiki.archlinux.org/title/NetworkManager)
1. [ArchWiki - Network configuration](https://wiki.archlinux.org/index.php/Network_configuration)
1. [ManPage - Systemctl](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/systemd/systemctl.1.en)
