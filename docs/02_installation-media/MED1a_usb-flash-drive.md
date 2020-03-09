---
layout: default
title: USB flash drive
permalink: /installation-media/preparation/usb-flash-drive/
parent: Preparation
grand_parent: Installation media
nav_order: 1
---

# Installation media preparation (USB flash drive)
{: .no_toc}

---

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

## Flash your USB flash drive with dd

dd copies a file (from standard input to standard output, by default) with a changeable I/O block size, while optionally performing conversions on it.

### List your devices
{: .no_toc .pt-2}

```bash
$ fdisk -l
```

### Flash the USB flash drive
{: .no_toc .pt-4}

Edit path/to/archlinux.iso and sdX accordingly

```bash
$ dd bs=4M if=path/to/archlinux.iso of=/dev/sdX status=progress oflag=sync
```

### INFORMATIONS
{: .no_toc .text-delta .pt-4}

1. [Wikipedia - dd](https://en.wikipedia.org/wiki/Dd_(Unix))

### GUIDES
{: .no_toc .text-delta .pt-2}

1. [ArchWiki - dd](https://wiki.archlinux.org/index.php/Dd)
1. [ArchWiki - USB flash installation media - Using dd](https://wiki.archlinux.org/index.php/USB_flash_installation_media#Using_dd)

### MANUALS
{: .no_toc .text-delta .pt-2}

1. [GNU - dd](https://www.gnu.org/software/coreutils/manual/html_node/dd-invocation.html#dd-invocation)

---

## Boot your computer on the USB flash drive

In order to boot on the USB device, we need to modify the firmware configuration with the firmware setup utility.

If asked (by pressing a key), you can temporarily select and boot on a device. You don't have to follow this procedure if you are in this scenario.

1. Turn on your computer
1. When asked, press the key to enter your firmware setup utility
1. Change the boot order and put your USB device in the first position
1. Save changes and reboot
1. Select `boot Arch Linux (X86_64)` or `Arch Linux archiso X86_64 UEFI CD`

### INFORMATIONS
{: .no_toc .text-delta .pt-4}

1. [Wikipedia - Firmware](https://en.wikipedia.org/wiki/Firmware)
1. [Wikipedia - BIOS - Configuration](https://en.wikipedia.org/wiki/BIOS#Configuration)

### GUIDES
{: .no_toc .text-delta .pt-2}

1. [ArchWiki - Installation guide - Boot the live environment](https://wiki.archlinux.org/index.php/Installation_guide#Boot_the_live_environment)
