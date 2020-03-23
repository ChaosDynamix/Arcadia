---
layout: default
title: DD
permalink: /installation-media/preparation/usb-flash-device/dd/
nav_exclude: true
---

<ol class="breadcrumb-nav-list" style="padding-left:0; position:relative; top:-17px;">
    <li class="breadcrumb-nav-list-item"><a href="http://localhost:4000/Andromeda/installation-media/">Installation media</a></li>
    <li class="breadcrumb-nav-list-item"><a href="http://localhost:4000/Andromeda/installation-media/preparation/">Preparation</a></li>
    <li class="breadcrumb-nav-list-item"><a href="http://localhost:4000/Andromeda/installation-media/preparation/usb-flash-device/">USB flash device</a></li>
    <li class="breadcrumb-nav-list-item"><span>dd</span></li>
</ol>

# [USB flash device](/Andromeda/installation-media/preparation/usb-flash-device/) / dd
{: .mt-0 .no_toc}

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
