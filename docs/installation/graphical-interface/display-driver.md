---
title: Display driver
---

# Display driver
This page describes how to install and configure the Nvidia proprietary driver on the system.

## Setup the display driver

### Install the Nvidia proprietary driver
``` bash
sudo pacman -S nvidia-lts
```

### Enable DRM kernel mode setting by editing `/boot/loader/entries/arch.conf`
Enabling DRM kernel mode setting allow the Xorg server to run without root privileges. It provide a nice security improvement.

``` conf
options     cryptdevice=UUID=<UUID>:cryptroot:allow-discards root="UUID=<UUID>" nvidia-drm.modeset=1 quiet rw
```

---

??? info "References"
    - [ArchWiki - Nvidia](https://wiki.archlinux.org/index.php/NVIDIA)
