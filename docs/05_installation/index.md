---
layout: default
title: Installation
permalink: /installation/
nav_order: 5
has_children: true
has_toc: false
---

# Installation
{: .no_toc}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

## Install Arch Linux essential packages

| Utilities | packages    |
| :-------- | :---------- |
| Lvm       | lvm2        |
| raid      | mdadm       |
| btrfs     | btrfs-progs |

### Example
{: .no_toc .pt-4}

```bash
$ pacstrap /mnt base base-devel linux linux-firmware vim man-db man-pages
```

---

## Generate static information about the filesystems

```bash
$ genfstab -U /mnt >> /mnt/etc/fstab
```

---

## Enter the system

```bash
$ arch-chroot /mnt
```

---

## Create the Swap file
{: .d-inline-block}

BTRFS
{: .label .ml-2}

```bash
$ truncate -s 0 /.swap/swapfile
$ chattr +C /.swap/swapfile
$ btrfs property set /.swap/swapfile compression none

$ fallocate -l 2G /.swap/swapfile
$ chmod 600 /.swap/swapfile
```

### Format the Swap file
{: .no_toc .pt-4}

```bash
$ mkswap /.swap/swapfile
```

### Activate the Swap file
{: .no_toc .pt-4}

```bash
$ swapon /.swap/swapfile
```

### Add the Swap file to the fstab
{: .no_toc .pt-4}

/etc/fstab
{: .fs-3 .mb-0}

```bash
/.swap/swapfile     none      swap      defaults      0 0
```

---

## GUIDES
{: .no_toc .text-delta}

1. [ArchWiki - Installation guide - Install essential packages](https://wiki.archlinux.org/index.php/Installation_guide#Install_essential_packages)
1. [ArchWiki - Installation guide - Fstab](https://wiki.archlinux.org/index.php/Installation_guide#Fstab)
1. [ArchWiki - Installation guide - Chroot](https://wiki.archlinux.org/index.php/Installation_guide#Chroot)
1. [ArchWiki - Fstab](https://wiki.archlinux.org/index.php/Fstab)
1. [ArchWiki - Swap - Swap file](https://wiki.archlinux.org/index.php/Swap#Swap_file)
{: .mb-6}

## MANUALS
{: .no_toc .text-delta}

1. [Man page - pacstrap](https://jlk.fjfi.cvut.cz/arch/manpages/man/extra/arch-install-scripts/pacstrap.8.en)
1. [Man page - truncate](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/coreutils/truncate.1.en)
1. [Man page - chattr](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/e2fsprogs/chattr.1.en)
1. [Man page - btrfs](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/btrfs-progs/btrfs.8.en)
1. [Man page - fallocate](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/util-linux/fallocate.1.en)
1. [Man page - chmod](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/coreutils/chmod.1.en)
1. [Man page - mkswap](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/util-linux/mkswap.8.en)
1. [Man page - swapon](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/man-pages/swapon.2.en)
