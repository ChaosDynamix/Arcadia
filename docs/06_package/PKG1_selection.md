---
layout: default
title: PKG1 Selection
nav_order: 1
parent: 06 Package
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

#### Base

`base` package set to define a basic Arch Linux installation. If you want to install packages from the Arch User Repository, Install the `base-devel` package group.

| Type             | Package examples                                 |
| ---------------- | ------------------------------------------------ |
| {base}           | `base` `base-devel`                              |


##### Sources
- [ArchWiki - Installation guide - Essential packages](https://wiki.archlinux.org/index.php/Installation_guide#Install_essential_packages)
- [ArchWiki - Arch user repository - Prerequisites](https://wiki.archlinux.org/index.php/Arch_User_Repository#Prerequisites)

---

#### Kernel

Arch Linux is based on the Linux kernel. There are various alternative Linux kernels available for Arch Linux in addition to the latest stable kernel.

| Type             | Package examples                                 |
| ---------------- | ------------------------------------------------ |
| {kernel}         | `linux` `linux-lts` `linux-hardened` `linux-zen` |

##### Sources
- [ArchWiki - Installation guide - Essential packages](https://wiki.archlinux.org/index.php/Installation_guide#Install_essential_packages)
- [ArchWiki - Kernel](https://wiki.archlinux.org/index.php/Kernel)

---

#### Firmware

The firmware packages represent the drivers for your hardware devices, `linux-firmware` contain a lot of commonly used hardware device firmware. Some of your hardware might not be present in this package so you need to install it with its own package.

| Type             | Package examples                                 |
| ---------------- | ------------------------------------------------ |
| {firmware}       | `linux-fimware` `broadcom-wl`                    |

##### Sources
- [ArchWiki - Installation guide - Essential packages](https://wiki.archlinux.org/index.php/Installation_guide#Install_essential_packages)

---

#### Utilities

Userspace utilities for the management of file systems that will be used on the system

| Type             | Package examples                                 |
| ---------------- | ------------------------------------------------ |
| {utilities}      | `lvm2` `btrfs-progs` `ntfs-3g` `dosfstools`      |

##### Sources
- [ArchWiki - Installation guide - Essential packages](https://wiki.archlinux.org/index.php/Installation_guide#Install_essential_packages)
- [ArchWiki - File systems](https://wiki.archlinux.org/index.php/File_systems)

---

#### Editor

| Type             | Package examples                                 |
| ---------------- | ------------------------------------------------ |
| {editor}         | `vim` `nano`                                     |

##### Sources
- [ArchWiki - Installation guide - Essential packages](https://wiki.archlinux.org/index.php/Installation_guide#Install_essential_packages)
- [ArchWiki - List of applications - Text editors](https://wiki.archlinux.org/index.php/List_of_applications#Text_editors)

---

#### Documentation

| Type             | Package examples                                 |
| ---------------- | ------------------------------------------------ |
| {documentation}  | `man-db` `man-pages` `texinfo`                   |

##### Sources
- [ArchWiki - Installation guide - Essential packages](https://wiki.archlinux.org/index.php/Installation_guide#Install_essential_packages)
- [ArchWiki - Man page](https://wiki.archlinux.org/index.php/Man_page)
- [ArchWiki - GNU - Texinfo](https://wiki.archlinux.org/index.php/GNU#Texinfo)
