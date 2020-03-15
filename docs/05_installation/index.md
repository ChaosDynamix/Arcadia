---
layout: default
title: Installation
permalink: /installation/
nav_order: 5
has_children: true
has_toc: false
---

# Installation

---

## [Mirrorlist](/Andromeda/live-environment/mirrorlist/)

When downloading packages, pacman uses the mirrors in the order they are listed in /etc/pacman.d/mirrorlist. The order servers appear in the list sets their priority.

It is not optimal to only rank mirrors based on speed since the fastest servers might be out-of-sync. Instead, make a list of mirrors sorted by their speed, then remove those from the list that are out of sync according to their status.

It is recommended to repeat this process before every system upgrade to keep the list of mirrors up-to-date.

---

## [Essential packages](/Andromeda/installation/essential-packages/)

---

## [Filesystem table](/Andromeda/installation/filesystem-informations/)

The fstab (or file systems table) file is a system configuration file on Unix and Unix-like computer systems. In Linux it is part of the util-linux package.

The fstab file typically lists all available disk partitions and other types of file systems and data sources that are not necessarily disk-based, and indicates how they are to be initialized or otherwise integrated into the larger file system structure.

---

## [Initial ramdisk](/Andromeda/installation/initial-ramdisk/)

In computing (specifically as regards Linux computing), initrd (initial ramdisk) is a scheme for loading a temporary root file system into memory, which may be used as part of the Linux startup process.

`initrd` and `initramfs` refer to two different methods of achieving this. Both are commonly used to make preparations before the real root file system can be mounted.

---

## [Boot loader](/Andromeda/installation/boot-loader/)

Second-stage boot loaders, such as GNU GRUB, rEFInd, BOOTMGR, Syslinux, NTLDR or BootX, are not themselves operating systems, but are able to load an operating system properly and transfer execution to it; the operating system subsequently initializes itself and may load extra device drivers. The second-stage boot loader does not need drivers for its own operation, but may instead use generic storage access methods provided by system firmware such as the BIOS or Open Firmware, though typically with restricted hardware functionality and lower performance.

---

## References

### MIRROR LIST
{: .no_toc .text-delta .pt-2}

1. [ArchWiki - Mirrors - Sorting mirrors](https://wiki.archlinux.org/index.php/Mirrors#Sorting_mirrors)
1. [Wikipedia - Mirror site](https://en.wikipedia.org/wiki/Mirror_site)

### ESSENTIAL PACKAGES
{: .no_toc .text-delta .pt-4}

1. [ArchWiki - Installation guide - Install essential packages](https://wiki.archlinux.org/index.php/Installation_guide#Install_essential_packages)

### FILESYSTEM TABLE
{: .no_toc .text-delta .pt-4}

1. [Wikipedia - Fstab](https://en.wikipedia.org/wiki/Fstab)
1. [ArchWiki - Installation guide - Fstab](https://wiki.archlinux.org/index.php/Installation_guide#Fstab)

### INITIAL RAMDISK
{: .no_toc .text-delta .pt-4}

1. [Wikipedia - Initial ramdisk](https://en.wikipedia.org/wiki/Initial_ramdisk)

### BOOT LOADER
{: .no_toc .text-delta .pt-4}

1. [Wikipedia - Boot loader](https://en.wikipedia.org/wiki/Booting#Boot-loader)
