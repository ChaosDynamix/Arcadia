---
layout: default
title: PAR4 Setup
nav_order: 4
parent: 04 Partition
permalink: /partition/setup/
has_toc: false
---

# Partition setup
{: .no_toc}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

## Basic partition setup

### Format the partitions
{: .no_toc .pt-4}

#### Ext4 filesystem
{: .no_toc .pt-4}

```bash
$ mkfs.ext4 -L ROOT /dev/sdXY
$ mkfs.ext4 -L HOME /dev/sdXY
```

#### EFI filesystem
{: .no_toc .pt-4}

```bash
$ mkfs.fat -F32 -n EFI /dev/sdXY
```

---

### Setup the swap partition
{: .no_toc}

```bash
$ mkswap -L SWAP /dev/sdXY
$ swapon /dev/sdXY
```

---

### Mount the file systems
{: .no_toc}

#### Root partition
{: .no_toc .pt-4}

```bash
$ mount /dev/sdXY /mnt
```

#### Home partition
{: .no_toc .pt-4}

```bash
# Create the directory
$ mkdir /mnt/home

# Mount the partition
$ mount /dev/sdXY /mnt/home
```

#### EFI partition
{: .no_toc .pt-4}

```bash
# Create the directory
$ mkdir /mnt/boot

# Mount the partition
$ mount /dev/sdXY /mnt/boot
```

### References
{: .no_toc .text-delta .pt-4}

- [ArchWiki - Installation guide - Format the partitions](https://wiki.archlinux.org/index.php/Installation_guide#Format_the_partitions)
- [ArchWiki - Installation guide - Mount the file systems](https://wiki.archlinux.org/index.php/Installation_guide#Mount_the_file_systems)
- [ArchWiki - EFI system partition](https://wiki.archlinux.org/index.php/EFI_system_partition)
- [Manual - mkfs.ext4](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/e2fsprogs/mkfs.ext4.8.en)
- [Manual - mkfs.fat](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/dosfstools/mkfs.fat.8.en)
- [Manual - mkswap](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/util-linux/mkswap.8.en)
- [Manual - swapon](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/man-pages/swapon.2.en)
- [Manual - mkdir](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/coreutils/mkdir.1.en)
- [Manual - mount](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/util-linux/mount.8.en)

---

## LVM on LUKS

[Partition setup for LVM on LUKS](/Andromeda/partition/setup/lvm/){: .btn .btn-purple .d-inline-block .mt-4}

---

## BTRFS on LUKS

[Partition setup for BTRFS on LUKS](/Andromeda/partition/setup/btrfs/){: .btn .btn-purple .d-inline-block .mt-4}
