---
layout: default
title: Lvm-encrypted-volumes
permalink: /storage/controller/lvm-encrypted-volumes/
grand_parent: Storage
parent: Controller
nav_order: 2
---

# Controller / Lvm with encrypted volumes
{: .no_toc}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

## Create the Physical and Group volumes

```bash
$ pvcreate /dev/sda2 /dev/sdb1
$ vgcreate grp /dev/sda2 /dev/sdb1
```

---

## Create the Logical volumes

```bash
$ lvcreate -L 8G grp -n cryptswap
$ lvcreate -L 20G grp -n cryptroot
$ lvcreate -l 100%FREE grp -n crypthome
```

---

## Encrypt the Root volume

```bash
$ cryptsetup --type luks1 luksFormat /dev/grp/cryptroot
$ cryptsetup open /dev/grp/cryptroot root
```

---

## Setup the Root container

```bash
$ mkfs.ext4 -L ROOT /dev/mapper/root
$ mount /dev/mapper/root /mnt
```

---

## Setup the EFI partition(s)
{: .d-inline-block}

UEFI
{: .label .label-blue .ml-2}

```bash
$ mkfs.fat -F32 -n EFI /dev/sdXY
$ mkdir /mnt/efi
$ mount /dev/sdXY /mnt/efi
```

---

## References
{: .no_toc}

### LOGICAL VOLUME MANAGER
{: .no_toc .text-delta .pt-2}

1. [ArchWiki - LVM on LUKS - Preparing the logical volumes](https://wiki.archlinux.org/index.php/Dm-crypt/Encrypting_an_entire_system#Preparing_the_logical_volumes)
1. [ArchWiki - LVM - Volume operations](https://wiki.archlinux.org/index.php/LVM#Volume_operations)

### PARTITIONING
{: .no_toc .text-delta .pt-4}

1. [ArchWiki - Partitioning - Discrete partitions](https://wiki.archlinux.org/index.php/Partitioning#Discrete_partitions)
1. [VOID Linux Partitions Notes - SWAP partitions](https://docs.voidlinux.org/installation/live-images/partitions.html#swap-partitions)
1. [ArchWiki - Installation guide - Format the partitions](https://wiki.archlinux.org/index.php/Installation_guide#Format_the_partitions)
1. [ArchWiki - Installation guide - Mount the file systems](https://wiki.archlinux.org/index.php/Installation_guide#Mount_the_file_systems)
1. [ArchWiki - EFI system partition](https://wiki.archlinux.org/index.php/EFI_system_partition)


### MANUALS
{: .no_toc .text-delta .pt-4}

1. [Man page - pvcreate](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/lvm2/pvcreate.8.en)
1. [Man page - vgcreate](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/lvm2/vgcreate.8.en)
1. [Man page - lvcreate](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/lvm2/lvcreate.8.en)
1. [Man page - mkfs.ext4](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/e2fsprogs/mkfs.ext4.8.en)
1. [Man page - mkfs.fat](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/dosfstools/mkfs.fat.8.en)
1. [Man page - mkswap](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/util-linux/mkswap.8.en)
1. [Man page - swapon](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/man-pages/swapon.2.en)
1. [Man page - mkdir](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/coreutils/mkdir.1.en)
1. [Man page - mount](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/util-linux/mount.8.en)
