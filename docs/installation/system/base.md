---
title: Base
---

# Base
This page describes how to install the base packages of Arch Linux. This page also describes how to generate the fstab and enter the system using the chroot command.

## Install the essential packages

### Select the packages 
1. Select a [Linux kernel](https://wiki.archlinux.org/index.php/Kernel)
1. Select a [Text editor](https://wiki.archlinux.org/index.php/List_of_applications#Text_editors)
1. Select a [Privilege elevation program](https://wiki.archlinux.org/index.php/List_of_applications#Privilege_elevation)

### Install the packages with pacstrap
Pacstrap is designed to create a new system installation from scratch. The specified packages will be installed into a given directory after setting up some basic mountpoints. By default, the host system’s pacman signing keys and mirrorlist will be used to seed the chroot.

``` bash
pacstrap /mnt base base-devel linux-lts linux-firmware nano man-db man-pages
```

!!! note
    `base` package is mandatory. `linux-firmware` package is recommended. The other packages are based on my personal choices.

---

## Generate the filesystem table
genfstab helps fill in an fstab file by autodetecting all the current mounts below a given mountpoint and printing them in fstab-compatible format to standard output.

It can be used to persist a manually mounted filesystem hierarchy and is often used during the initial install and configuration of an OS.

``` bash
genfstab -U /mnt >> /mnt/etc/fstab
```

---

## Enter the system
arch-chroot wraps the chroot command while ensuring that important functionality is available, e.g. mounting `/dev/`, `/proc` and other API filesystems, or exposing resolv.conf to the chroot. chroot is made for running command or interactive shell with special root directory. 

``` bash
arch-chroot /mnt
```

---

??? info "References"
    - [ArchWiki - Kernel](https://wiki.archlinux.org/index.php/Kernel)
    - [ArchWiki - Installation guide](https://wiki.archlinux.org/index.php/Installation_guide)
    - [ManPage - Pacstrap](https://jlk.fjfi.cvut.cz/arch/manpages/man/extra/arch-install-scripts/pacstrap.8.en)
    - [Wikipedia - Fstab](https://en.wikipedia.org/wiki/Fstab)
    - [ArchWiki - Fstab](https://wiki.archlinux.org/index.php/Fstab)
    - [ArchWiki - Installation guide](https://wiki.archlinux.org/index.php/Installation_guide)
    - [ManPage - Genfstab](https://jlk.fjfi.cvut.cz/arch/manpages/man/extra/arch-install-scripts/genfstab.8.en)
    - [ArchWiki - Chroot](https://wiki.archlinux.org/index.php/Chroot)
    - [ManPage - Arch-chroot](https://jlk.fjfi.cvut.cz/arch/manpages/man/extra/arch-install-scripts/arch-chroot.8.en)
