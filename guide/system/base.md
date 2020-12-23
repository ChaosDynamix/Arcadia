---
title     : !!str Base
nav_order : !!int 1
permalink : !!str /system/base
parent    : !!str System
---

## Install the essential packages

### Select the packages 

1. Select a [Linux kernel](https://wiki.archlinux.org/index.php/Kernel)
1. Select a [Text editor](https://wiki.archlinux.org/index.php/List_of_applications#Text_editors)
1. Select a [Privilege elevation program](https://wiki.archlinux.org/index.php/List_of_applications#Privilege_elevation)

### Install the packages with pacstrap

Pacstrap is designed to create a new system installation from scratch. The specified packages will be installed into a given directory after setting up some basic mountpoints. By default, the host system’s pacman signing keys and mirrorlist will be used to seed the chroot.

```
pacstrap /mnt base base-devel linux-lts linux-firmware neovim man-db man-pages
```

**Note**: `base` package is mandatory. `linux-firmware` package is recommended. The other packages are based on my personal choices.
{: .fs-3}

### References
{: .text-delta .pt-4}

1. [ArchWiki - Kernel](https://wiki.archlinux.org/index.php/Kernel)
1. [ArchWiki - Installation guide](https://wiki.archlinux.org/index.php/Installation_guide)
1. [ManPage - Pacstrap](https://jlk.fjfi.cvut.cz/arch/manpages/man/extra/arch-install-scripts/pacstrap.8.en)
{: .fs-3}

---

## Generate the filesystem table

genfstab helps fill in an fstab file by autodetecting all the current mounts below a given mountpoint and printing them in fstab-compatible format to standard output.

It can be used to persist a manually mounted filesystem hierarchy and is often used during the initial install and configuration of an OS.

```
genfstab -U /mnt >> /mnt/etc/fstab
```

### References
{: .text-delta .pt-4}

1. [Wikipedia - Fstab](https://en.wikipedia.org/wiki/Fstab)
1. [ArchWiki - Fstab](https://wiki.archlinux.org/index.php/Fstab)
1. [ArchWiki - Installation guide](https://wiki.archlinux.org/index.php/Installation_guide)
1. [ManPage - Genfstab](https://jlk.fjfi.cvut.cz/arch/manpages/man/extra/arch-install-scripts/genfstab.8.en)
{: .fs-3}

---

## Enter the system

arch-chroot wraps the chroot command while ensuring that important functionality is available, e.g. mounting `/dev/`, `/proc` and other API filesystems, or exposing resolv.conf to the chroot. chroot is made for running command or interactive shell with special root directory. 

```
arch-chroot /mnt
```

### References
{: .text-delta .pt-4}

1. [ArchWiki - Chroot](https://wiki.archlinux.org/index.php/Chroot)
1. [ManPage - Arch-chroot](https://jlk.fjfi.cvut.cz/arch/manpages/man/extra/arch-install-scripts/arch-chroot.8.en)
{: .fs-3}
