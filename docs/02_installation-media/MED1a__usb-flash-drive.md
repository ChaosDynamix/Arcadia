---
layout: default
title: Usb flash drive
permalink: /installation-media/preparation/usb-flash-drive/
nav_exclude: true
---

[Return to Installation media preparation](/Andromeda/installation-media/preparation/){: .btn .btn-purple }

# Installation media preparation for Usb flash drive
{: .no_toc}

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
