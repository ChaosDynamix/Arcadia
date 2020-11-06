---
title     : !!str Desktop
parent    : !!str Arch Linux
nav_order : !!int 5
permalink : !!str /arch-linux/desktop
---

# {{ page.title }}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

## Install the Nvidia display driver

### Edit the pacman configuration in `/etc/pacman.conf`

Uncomment the following lines

```
[multilib]
Include = /etc/pacman.d/mirrorlist
```

### Update the repositories
```
pacman -Syy
```

### Get informations about your video card
```
lspci -k | grep -A 2 -E "(VGA|3D)"
```

### Install the packages

#### OpenGL
```
pacman -S mesa lib32-mesa
```

#### Vulkan
```
pacman -S vulkan-icd-loader lib32-vulkan-icd-loader
```

#### Nvidia
```
pacman -S nvidia lib32-nvidia-utils
```

---

## Activate DMS kernel Mode Setting

In order to run rootless Xorg, we need to manually activate Direct Rendering Manager Kernel Mode Setting.

### Edit the configuration in `/etc/default/grub`
```
GRUB_CMDLINE_LINUX_DEFAULT="rd.luks.options=discard nvidia-drm.modeset=1 loglevel=3 quiet"
```

**Note**: `rd.luks.options=discard` should not be present in your configuration if you dont have Solid State Drive.
{: .fs-3}

### Update the Grub configuration
```
grub-mkconfig -o /boot/grub/grub.cfg
```

---

## Install the Xorg display server

### Install the packages
```
pacman -S xorg-{server,xinit,xrandr}
```

### Copy the Xinit configuration example file

The xinit program allows a user to manually start an Xorg display server. The `startx` script is a front-end for `xinit`. It is typically used to start window managers or desktop environments.

```
cp /etc/X11/xinit/xinitrc ~/.xinitrc
```

### Edit the Xinit configuration in `~/.xinitrc`

At the end of the file, delete the following lines.

```
twm &
xclock -geometry 50x50-1+1 &
xterm -geometry 80x50+494+51 &
xterm -geometry 80x20+494-0 &
exec xterm -geometry 80x66+0+0 -name login
```

