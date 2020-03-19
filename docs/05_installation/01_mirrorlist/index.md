---
layout: default
title: Mirrorlist
permalink: /installation/mirrorlist/
parent: Installation
nav_order: 1
---

# Installation mirrorlist

---

## Update Arch Linux keyring

```bash
$ pacman -Sy archlinux-keyring
```

---

## Generate a mirrorlist

### Install reflector package
{: .no_toc .pt-2}

```bash
$ pacman -S reflector
```

### Launch the reflector script with your parameters
{: .no_toc .pt-4}

```bash
$ reflector --country France --age 15 --protocol https --sort rate --save /etc/pacman.d/mirrorlist
```

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
