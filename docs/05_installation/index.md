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

## [Mirrorlist](/Andromeda/installation/mirrorlist/)

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
