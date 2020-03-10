---
layout: default
title: Ext4
permalink: /storage/configuration/ext4/
nav_exclude: true
---

# Storage configuration for Ext4
{: .no_toc}

---

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

## Configuring the partitions

| Partition | Label   | Filesystem | Mounting point |
| :-------- | :------ | :--------- | :------------- |
| /dev/sda1 | EFI     | Fat32      | /mnt/boot      |
| /dev/sda2 | ROOT    | Ext4       | /mnt           |
| /dev/sda3 | SWAP    | Swap       |                |
| /dev/sda4 | HOME    | Ext4       | /mnt/home      |

### Format the partitions
{: .no_toc .pt-2}

```bash
# Format the EXT4 filesystem partitions
$ mkfs.ext4 -L ROOT /dev/sda2
$ mkfs.ext4 -L HOME /dev/sda4

# Format the FAT32 filesystem partition
$ mkfs.fat -F32 -n EFI /dev/sda1
```

### Setup the Swap partition
{: .no_toc .pt-4}

```bash
# Format the Swap partition
$ mkswap -L SWAP /dev/sda3

# Activate the Swap partition
$ swapon /dev/sda3
```

### Mount the partitions
{: .no_toc .pt-4}

```bash
# Mount the root partition
$ mount /dev/sda2 /mnt

# Create directories
$ mkdir /mnt/{home,boot}

# Mount the home and efi partitions
$ mount /dev/sda1 /mnt/boot
$ mount /dev/sda4 /mnt/home
```

### GUIDES
{: .no_toc .text-delta .pt-4}

1. [ArchWiki - EFI system partition](https://wiki.archlinux.org/index.php/EFI_system_partition)
1. [ArchWiki - File systems](https://wiki.archlinux.org/index.php/File_systems)
1. [ArchWiki - Fat](https://wiki.archlinux.org/index.php/FAT)
1. [ArchWiki - Ext4](https://wiki.archlinux.org/index.php/Ext4)

### MANUALS
{: .no_toc .text-delta .pt-2}

1. [Man page - mkfs.ext4](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/e2fsprogs/mkfs.ext4.8.en)
1. [Man page - mkfs.fat](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/dosfstools/mkfs.fat.8.en)
1. [Man page - mkswap](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/util-linux/mkswap.8.en)
1. [Man page - swapon](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/man-pages/swapon.2.en)
1. [Man page - mkdir](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/coreutils/mkdir.1.en)
1. [Man page - mount](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/util-linux/mount.8.en)
