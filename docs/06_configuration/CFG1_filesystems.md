---
layout: default
title: CFG1 Filesystems
nav_order: 1
parent: 06 Configuration
permalink: /configuration/filesystems/
has_children: true
has_toc: false
---

# Configuration of the filesystems
{: .no_toc}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

## Generate static information about the filesystems

```bash
genfstab -U /mnt >> /mnt/etc/fstab
```

### References
{: .no_toc .text-delta .pt-4}

- [ArchWiki - Installation guide - Fstab](https://wiki.archlinux.org/index.php/Installation_guide#Fstab)
- [ArchWiki - Fstab](https://wiki.archlinux.org/index.php/Fstab)

---

## Swap file

If you decided to use a Swap file instead of a Swap partition, create it and add it to the `fstab` file.

### Create the Swap file
{: .no_toc .pt-2}

```bash
$ fallocate -l 2G /swapfile
$ chmod 600 /swapfile
```

#### BTRFS
{: .no_toc .pt-4}

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
$ mkswap /swapfile
```

#### BTRFS
{: .no_toc .pt-4}

```bash
$ mkswap /.swap/swapfile
```

### Activate the Swap file
{: .no_toc .pt-4}

```bash
$ swapon /swapfile
```

#### BTRFS
{: .no_toc .pt-4}

```bash
$ swapon /.swap/swapfile
```

### Edit the fstab and add the Swap file
{: .no_toc .pt-4}

```bash
/swapfile none swap defaults 0 0
```

#### BTRFS
{: .no_toc .pt-4}

```bash
/.swap/swapfile none swap defaults 0 0
```

### References
{: .no_toc .text-delta .pt-4}

- [ArchWiki - Swap - Swap file](https://wiki.archlinux.org/index.php/Swap#Swap_file)
- [Manual - truncate](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/coreutils/truncate.1.en)
- [Manual - chattr](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/e2fsprogs/chattr.1.en)
- [Manual - btrfs](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/btrfs-progs/btrfs.8.en)
- [Manual - fallocate](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/util-linux/fallocate.1.en)
- [Manual - chmod](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/coreutils/chmod.1.en)
- [Manual - mkswap](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/util-linux/mkswap.8.en)
- [Manual - swapon](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/man-pages/swapon.2.en)
