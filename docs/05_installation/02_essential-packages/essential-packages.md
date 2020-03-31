---
layout: default
title: Essential packages
permalink: /installation/essential-packages/
parent: Installation
nav_order: 2
has_toc: false
---

# Installation / Essential packages
{: .no_toc}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

## Select the packages

### Base
{: .no_toc}

`base` package set to define a basic Arch Linux installation. If you want to install packages from the Arch User Repository, Install the `base-devel` package group.

#### EXAMPLES
{: .no_toc .mt-4}

| Package            | Description                                                   |
| :----------------- | :------------------------------------------------------------ |
| base               | Minimal package set to define a basic Arch Linux installation |
| base-devel         | Package group needed by the Arch User Repository              |

### Kernel
{: .no_toc .mt-8}

Arch Linux is based on the Linux kernel. There are various alternative Linux kernels available for Arch Linux in addition to the latest stable kernel.

#### EXAMPLES
{: .no_toc .mt-4}

| Package            | Description                                    |
| :----------------- | :--------------------------------------------- |
| linux              | The Linux kernel and modules                   |
| linux-lts          | The Long Time Support Linux kernel and modules |
| linux-hardened     | The Security-Hardened Linux kernel and modules |
| linux-zen          | The Linux ZEN kernel and modules               |

### Firmware
{: .no_toc .mt-8}

The firmware packages represent the drivers for your hardware devices, `linux-firmware` contain a lot of commonly used hardware device firmware. Some of your hardware might not be present in this package so you need to install it with its own package.

#### EXAMPLES
{: .no_toc .mt-4}

| Package            | Description                               |
| :----------------- | :---------------------------------------- |
| linux-fimware      | Firmware files for Linux                  |
| broadcom-wl        | Broadcom 802.11 Linux STA wireless driver |



### Utilities
{: .no_toc .mt-8}

Userspace utilities for the management of file systems that will be used on the system

#### EXAMPLES
{: .no_toc .mt-4}

| Package            | Description                          |
| :----------------- | :----------------------------------- |
| lvm2               | Logical Volume Manager 2 utilities   |
| btrfs-progs        | Btrfs filesystem utilities           |
| ntfs-3g            | NTFS filesystem driver and utilities |
| dosfstools         | DOS filesystem utilities             |
| mdadm              | Raid utility                         |

### Editor
{: .no_toc .mt-8}

#### EXAMPLES
{: .no_toc .mt-4}

| Package            | Description                                                                |
| :----------------- | :------------------------------------------------------------------------- |
| vim                | Vi Improved, a highly configurable, improved version of the vi text editor |
| nano               | Pico editor clone with enhancements                                        |

### Documentation
{: .no_toc .mt-8}

#### EXAMPLES
{: .no_toc .mt-4}

| Package            | Description                                                         |
| :----------------- | :------------------------------------------------------------------ |
| man-db             | A utility for reading man pages                                     |
| man-pages          | Linux man pages                                                     |
| texinfo            | GNU documentation system for on-line information and printed output |

---

## Install the packages

```bash
$ pacstrap /mnt base linux linux-firmware btrfs-progs vim man-db man-pages
```

---

## References
{: .no_toc}

- [ArchWiki - Installation guide - Essential packages](https://wiki.archlinux.org/index.php/Installation_guide#Install_essential_packages)
- [ArchWiki - Arch user repository - Prerequisites](https://wiki.archlinux.org/index.php/Arch_User_Repository#Prerequisites)
- [ArchWiki - Installation guide - Essential packages](https://wiki.archlinux.org/index.php/Installation_guide#Install_essential_packages)
- [ArchWiki - Kernel](https://wiki.archlinux.org/index.php/Kernel)
- [ArchWiki - Installation guide - Essential packages](https://wiki.archlinux.org/index.php/Installation_guide#Install_essential_packages)
- [ArchWiki - Installation guide - Essential packages](https://wiki.archlinux.org/index.php/Installation_guide#Install_essential_packages)
- [ArchWiki - File systems](https://wiki.archlinux.org/index.php/File_systems)
- [ArchWiki - Installation guide - Essential packages](https://wiki.archlinux.org/index.php/Installation_guide#Install_essential_packages)
- [ArchWiki - List of applications - Text editors](https://wiki.archlinux.org/index.php/List_of_applications#Text_editors)
- [ArchWiki - Installation guide - Essential packages](https://wiki.archlinux.org/index.php/Installation_guide#Install_essential_packages)
- [ArchWiki - Man page](https://wiki.archlinux.org/index.php/Man_page)
- [ArchWiki - GNU - Texinfo](https://wiki.archlinux.org/index.php/GNU#Texinfo)
