---
layout: default
title: MED2 Boot
permalink: /installation-media/boot/
parent: Installation media
nav_order: 2
has_children: true
has_toc: false
---

# Installation media boot
{: .no_toc}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

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
