---
layout: default
title: USB flash device
permalink: /installation-media/preparation/usb-flash-device/
grand_parent: Installation media
parent: Preparation
nav_order: 1
---

# USB flash device
{: .no_toc}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

## List your devices
{: .pt-2}

```bash
$ fdisk -l
```

## Flash the USB flash drive with dd
{: .pt-4}

Edit path/to/archlinux.iso and sdX accordingly

```bash
$ dd bs=4M if=path/to/archlinux.iso of=/dev/sdX status=progress oflag=sync
```

---

## References
{: .no_toc}

### DD
{: .no_toc .text-delta}

1. [Wikipedia - dd](https://en.wikipedia.org/wiki/Dd_(Unix))
1. [ArchWiki - dd](https://wiki.archlinux.org/index.php/Dd)
1. [ArchWiki - USB flash installation media - Using dd](https://wiki.archlinux.org/index.php/USB_flash_installation_media#Using_dd)


### MANUALS
{: .no_toc .text-delta .mt-5}

1. [GNU documentation - dd](https://www.gnu.org/software/coreutils/manual/html_node/dd-invocation.html#dd-invocation)
