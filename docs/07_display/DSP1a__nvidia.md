---
layout: default
title: Nvidia
permalink: /display/driver/nvidia/
nav_exclude: true
---

[Return to display driver](/Andromeda/display/driver/){: .btn .btn-purple }

# Display driver for Nvidia
{: .no_toc}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

## Get informations about your video card

```bash
$ lspci -k | grep -A 2 -E "(VGA|3D)"
```

---

## Install the packages

### OpenGL
{: .no_toc .pt-2}

```bash
$ pacman -S mesa lib32-mesa
```

### Vulkan
{: .no_toc .pt-4}

```bash
$ pacman -S vulkan-icd-loader lib32-vulkan-icd-loader
```

### Nvidia
{: .no_toc .pt-4}

```bash
$ pacman -S nvidia lib32-nvidia-utils
```

---

## Activate (DMS) Kernel Mode Setting

In order to run rootless Xorg, we need to manually activate Direct Rendering Manager Kernel Mode Setting.

### Edit initramfs configuration
{: .no_toc .pt-2}

/etc/mkinitcpio.conf
{: .fs-3 .pt-2 .mb-0}

```bash
HOOKS=(nvidia nvidia_modeset nvidia_uvm nvidia_drm)
```

### Edit boot loader configuration
{: .no_toc .pt-4}

/etc/default/grub
{: .fs-3 .pt-2 .mb-0}

```bash
GRUB_CMDLINE_LINUX_DEFAULT="nvidia-drm.modeset=1"
```

### Create a pacman hook
{: .no_toc .pt-4}

To avoid the possibility of forgetting to update initramfs after an NVIDIA driver upgrade, you may want to use a pacman hook

/etc/pacman.d/hooks/nvidia.hook
{: .fs-3 .mb-0}

```bash
[Trigger]
Operation=Install
Operation=Upgrade
Operation=Remove
Type=Package
Target=nvidia
Target=linux
# Change the linux part above and in the Exec line if a different kernel is used

[Action]
Description=Update Nvidia module in initcpio
Depends=mkinitcpio
When=PostTransaction
NeedsTargets
Exec=/bin/sh -c 'while read -r trg; do case $trg in linux) exit 0; esac; done; /usr/bin/mkinitcpio -P'
```

---

## References

### NVIDIA
{: .no_toc .text-delta .pt-2}

1. [ArchWiki - Nvidia - Installation](https://wiki.archlinux.org/index.php/NVIDIA#Installation)

### VULKAN
{: .no_toc .text-delta .pt-4}

1. [ArchWiki - Vulkan - Installation](https://wiki.archlinux.org/index.php/Vulkan#Installation)

### KERNEL MODE SETTING
{: .no_toc .text-delta .pt-4}

1. [ArchWiki - Nvidia - DRM Kernel mode setting](https://wiki.archlinux.org/index.php/NVIDIA#DRM_kernel_mode_setting)

### MANUALS
{: .no_toc .text-delta .pt-4}

1. [Man pages - lspci](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/pciutils/lspci.8.en)
