---
layout: default
title: USB flash drive
parent: 02 Preparation
nav_order: 1
permalink: /preparation/usb-flash-drive/
---

# Preparation of the USB flash drive
{: .no_toc}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

## Flash your USB flash drive with the Arch Linux ISO

### With dd
{: .no_toc .pt-2 .d-inline-block}

Console
{: .label .mx-2}

dd copies a file (from standard input to standard output, by default) with a changeable I/O block size, while optionally performing conversions on it.

```bash
# List the device
$ fdisk -l

# Flash the device (edit path/to/archlinux.iso and sdX accordingly)
$ dd bs=4M if=path/to/archlinux.iso of=/dev/sdX status=progress oflag=sync
```

### With Etcher
{: .no_toc .pt-4 .d-inline-block}

Graphical
{: .label .mx-2}

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
{: .no_toc .text-delta .pt-4}

- [ArchWiki - USB flash installation media](https://wiki.archlinux.org/index.php/USB_flash_installation_media)
- [GNU - dd documentation](https://www.gnu.org/software/coreutils/manual/html_node/dd-invocation.html#dd-invocation)

---

## Boot your computer on the USB flash drive

In order to boot on the USB device, we need to modify the firmware configuration with the firmware setup utility.

If asked (by pressing a key), you can temporarily select and boot on a device. You don't have to follow this procedure if you are in this scenario.

1. Turn on your computer
1. When asked, press the key to enter your firmware setup utility
1. Change the boot order and put your USB device in the first position
1. Save changes and reboot
1. Select `boot Arch Linux (X86_64)` or `Arch Linux archiso X86_64 UEFI CD`

### References
{: .no_toc .text-delta .pt-5}

- [Wikipedia - Firmware](https://en.wikipedia.org/wiki/Firmware)
- [Wikipedia - BIOS - Configuration](https://en.wikipedia.org/wiki/BIOS#Configuration)
- [ArchWiki - Installation guide - Boot the live environment](https://wiki.archlinux.org/index.php/Installation_guide#Boot_the_live_environment)
