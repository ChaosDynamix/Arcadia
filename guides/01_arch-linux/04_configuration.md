---
title     : !!str Configuration
parent    : !!str Arch Linux
nav_order : !!int 4
permalink : !!str /arch-linux/configuration
---

# {{ page.title }}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

## Setup the display server and driver

### Install the Xorg server
```
sudo pacman -S xorg-{server,xinit,xrandr}
```

### Install the Nvidia proprietary driver
```
sudo pacman -S nvidia-lts
```

### Enable DRM kernel mode setting by editing `/boot/loader/entries/arch.conf`

Enabling DRM kernel mode setting allow the Xorg server to run without root privileges. It provide a nice security improvement.

```
options     rd.luks.options=discard root="UUID=root_filesystem" nvidia-drm.modeset=1 quiet rw
```

### References
{: .text-delta .pt-4}

1. [ArchWiki - Xorg](https://wiki.archlinux.org/index.php/Xorg)
1. [ArchWiki - Nvidia](https://wiki.archlinux.org/index.php/NVIDIA)
{: .fs-3}

---
