---
layout: default
title: USB_Preparation
nav_order: 1
has_children: true
parent: USB device
permalink: /usb-device/preparation/
has_toc: false
---

# USB device preparation
{: .no_toc}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

In order to instal Arch Linux on the storage space of our choice, we need to copy the Arch Linux ISO image on a USB device. **This will irrevocably destroy all data on your USB device**
{: .fs-5}

---

## With dd

Console
{: .label .mx-0}

dd copies a file (from standard input to standard output, by default) with a changeable I/O block size, while optionally performing conversions on it.

```bash
# List the device
$ fdisk -l

# Flash the device (edit path/to/archlinux.iso and sdX accordingly)
$ dd bs=4M if=path/to/archlinux.iso of=/dev/sdX status=progress oflag=sync
```

### References
{: .no_toc .text-delta .pt-5}

- [ArchWiki - USB flash installation media](https://wiki.archlinux.org/index.php/USB_flash_installation_media)
- [GNU - dd documentation](https://www.gnu.org/software/coreutils/manual/html_node/dd-invocation.html#dd-invocation)

---

## With Etcher

Graphical
{: .label .mx-0}

Etcher is a powerful OS image flasher built with web technologies to ensure flashing an SDCard or USB drive is a pleasant and safe experience. It protects you from accidentally writing to your hard-drives, ensures every byte of data was written correctly and much more.

1. **Download and install Etcher**
    * From the [Official website](https://www.balena.io/etcher/) (Windows, Mac, Linux/Appimage)
    * From the [Github repository](https://github.com/balena-io/etcher/) (Ubuntu/Debian, RHEL/Fedora, Solus)
    * From the [Arch User Repository](https://aur.archlinux.org/packages/balena-etcher/) (Arch Linux)
1. **Open Etcher**
    1. Select the Arch Linux ISO image
    1. Carefully choose your USB flash device
    1. Flash !

### References
{: .no_toc .text-delta .pt-5}

- [ArchWiki - USB flash installation media](https://wiki.archlinux.org/index.php/USB_flash_installation_media)
