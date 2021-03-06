---
title     : !!str Display driver
nav_order : !!int 2
permalink : !!str /graphical-interface/display-driver
parent    : !!str Graphical interface
---

# {{ page.title }}
{: .no_toc }

This page describes how to install and configure the Nvidia proprietary driver on the system.
{: .fs-5 .fw-300}

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

## Setup the display driver

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

1. [ArchWiki - Nvidia](https://wiki.archlinux.org/index.php/NVIDIA)
{: .fs-3}
