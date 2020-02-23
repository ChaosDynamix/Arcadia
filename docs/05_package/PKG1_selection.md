---
layout: default
title: PKG1 Selection
nav_order: 1
parent: 05 Package
permalink: /package/selection/
has_toc: false
---

# Package selection
{: .no_toc}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

## Base

`base` package set to define a basic Arch Linux installation. If you want to install packages from the Arch User Repository, Install the `base-devel` package group.

#### Examples
{: .no_toc .pt-4}

| Package            | Description                                                   |
| :----------------- | :------------------------------------------------------------ |
| base               | Minimal package set to define a basic Arch Linux installation |
| base-devel         | Package group needed by the Arch User Repository              |


### References
{: .no_toc .text-delta .pt-4}

- [ArchWiki - Installation guide - Essential packages](https://wiki.archlinux.org/index.php/Installation_guide#Install_essential_packages)
- [ArchWiki - Arch user repository - Prerequisites](https://wiki.archlinux.org/index.php/Arch_User_Repository#Prerequisites)

---

## Kernel

Arch Linux is based on the Linux kernel. There are various alternative Linux kernels available for Arch Linux in addition to the latest stable kernel.

#### Examples
{: .no_toc .pt-4}

| Package            | Description                                    |
| :----------------- | :--------------------------------------------- |
| linux              | The Linux kernel and modules                   |
| linux-lts          | The Long Time Support Linux kernel and modules |
| linux-hardened     | The Security-Hardened Linux kernel and modules |
| linux-zen          | The Linux ZEN kernel and modules               |

### References
{: .no_toc .text-delta .pt-4}

- [ArchWiki - Installation guide - Essential packages](https://wiki.archlinux.org/index.php/Installation_guide#Install_essential_packages)
- [ArchWiki - Kernel](https://wiki.archlinux.org/index.php/Kernel)

---

## Firmware

The firmware packages represent the drivers for your hardware devices, `linux-firmware` contain a lot of commonly used hardware device firmware. Some of your hardware might not be present in this package so you need to install it with its own package.

#### Examples
{: .no_toc .pt-4}

| Package            | Description                               |
| :----------------- | :---------------------------------------- |
| linux-fimware      | Firmware files for Linux                  |
| broadcom-wl        | Broadcom 802.11 Linux STA wireless driver |

### References
{: .no_toc .text-delta .pt-4}

- [ArchWiki - Installation guide - Essential packages](https://wiki.archlinux.org/index.php/Installation_guide#Install_essential_packages)

---

## Utilities

Userspace utilities for the management of file systems that will be used on the system

#### Examples
{: .no_toc .pt-4}

| Package            | Description                          |
| :----------------- | :----------------------------------- |
| lvm2               | Logical Volume Manager 2 utilities   |
| btrfs-progs        | Btrfs filesystem utilities           |
| ntfs-3g            | NTFS filesystem driver and utilities |
| dosfstools         | DOS filesystem utilities             |

### References
{: .no_toc .text-delta .pt-4}

- [ArchWiki - Installation guide - Essential packages](https://wiki.archlinux.org/index.php/Installation_guide#Install_essential_packages)
- [ArchWiki - File systems](https://wiki.archlinux.org/index.php/File_systems)

---

## Editor

#### Examples
{: .no_toc .pt-4}

| Package            | Description                                                                |
| :----------------- | :------------------------------------------------------------------------- |
| vim                | Vi Improved, a highly configurable, improved version of the vi text editor |
| nano               | Pico editor clone with enhancements                                        |

### References
{: .no_toc .text-delta .pt-4}

- [ArchWiki - Installation guide - Essential packages](https://wiki.archlinux.org/index.php/Installation_guide#Install_essential_packages)
- [ArchWiki - List of applications - Text editors](https://wiki.archlinux.org/index.php/List_of_applications#Text_editors)

---

## Documentation

#### Examples
{: .no_toc .pt-4}

| Package            | Description                                                         |
| :----------------- | :------------------------------------------------------------------ |
| man-db             | A utility for reading man pages                                     |
| man-pages          | Linux man pages                                                     |
| texinfo            | GNU documentation system for on-line information and printed output |

### References
{: .no_toc .text-delta .pt-4}

- [ArchWiki - Installation guide - Essential packages](https://wiki.archlinux.org/index.php/Installation_guide#Install_essential_packages)
- [ArchWiki - Man page](https://wiki.archlinux.org/index.php/Man_page)
- [ArchWiki - GNU - Texinfo](https://wiki.archlinux.org/index.php/GNU#Texinfo)
