---
layout: default
title: DD
permalink: /installation-media/preparation/usb-flash-device/dd/
nav_exclude: true
---

# Installation media preparation for a USB flash device (dd)
{: .no_toc}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

## List your devices

```bash
$ fdisk -l
```

---

## Flash the USB flash drive

Edit path/to/archlinux.iso and sdX accordingly

```bash
$ dd bs=4M if=path/to/archlinux.iso of=/dev/sdX status=progress oflag=sync
```

---

## References

### DD
{: .no_toc .text-delta .pt-4}

1. [Wikipedia - dd](https://en.wikipedia.org/wiki/Dd_(Unix))
1. [ArchWiki - dd](https://wiki.archlinux.org/index.php/Dd)
1. [ArchWiki - USB flash installation media - Using dd](https://wiki.archlinux.org/index.php/USB_flash_installation_media#Using_dd)


### MANUALS
{: .no_toc .text-delta .pt-2}

1. [GNU - dd](https://www.gnu.org/software/coreutils/manual/html_node/dd-invocation.html#dd-invocation)