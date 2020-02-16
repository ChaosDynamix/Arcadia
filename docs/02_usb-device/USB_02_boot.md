---
layout: default
title: USB_Boot
nav_order: 2
has_children: true
parent: USB device
permalink: /usb-device/boot/
has_toc: false
---

# USB device boot
{: .no_toc}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

## About firmware

The firmware is a software that provides the low-level control for the device's specific hardware. The firmware is the very first program that is executed once the system is switched on.

The most common computer Firmwares are :
- **BIOS**
- **UEFI** compliant firmware

### References
{: .no_toc .text-delta .pt-5}

- [Wikipedia - Firmware](https://en.wikipedia.org/wiki/Firmware)

---

## About firmware setup utility

The firmware setup utility allow the user to configure and monitor your computer hardware.

A modern firmware setup utility has a menu-based user interface (UI) accessed by pressing a certain key on the keyboard when the computer starts. Usually, the key is advertised for short time during the early startup. The actual key depends on specific hardware.

### References
{: .no_toc .text-delta .pt-5}

- [Wikipedia - BIOS - Configuration](https://en.wikipedia.org/wiki/BIOS#Configuration)

---

## Boot on the USB device

In order to boot on the USB device, we need to modify the firmware configuration with the firmware setup utility.

If asked (by pressing a key), you can temporarily select and boot on a device. You don't have to follow this procedure if you are in this scenario.

1. Turn on your computer
1. When asked, press the key to enter your firmware setup utility
1. Change the boot order and put your USB device in the first position
1. Save changes and reboot
1. Select `boot Arch Linux (X86_64)` or `Arch Linux archiso X86_64 UEFI CD`

### References
{: .no_toc .text-delta .pt-5}

- [ArchWiki - Installation guide - Boot the live environment](https://wiki.archlinux.org/index.php/Installation_guide#Boot_the_live_environment)
