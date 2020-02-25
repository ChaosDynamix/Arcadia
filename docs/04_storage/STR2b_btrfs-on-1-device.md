---
layout: default
title: STR2a BTRFS on 1 device
nav_exclude: true
permalink: /storage/scenarios/btrfs-on-1-device/
has_toc: false
---

# Storage scenario for BTRFS on 1 device
{: .no_toc}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

## Partition encryption

```bash
$ cryptsetup --type luks1 luksFormat /dev/sdXY
$ cryptsetup open /dev/sdXY btrfs
```

### References
{: .no_toc .text-delta .pt-4}

- [ArchWiki - LVM on LUKS - Preparing the disk](https://wiki.archlinux.org/index.php/Dm-crypt/Encrypting_an_entire_system#Preparing_the_disk_2)
- [ArchWiki - BTRFS on LUKS - Preparing the system partition](https://wiki.archlinux.org/index.php/Dm-crypt/Encrypting_an_entire_system#Preparing_the_system_partition)

## Btrfs

### Setup mapped device
{: .no_toc}

#### Encryption
{: .no_toc .pt-4}

```bash
mkfs.btrfs -L btrfs /dev/mapper/btrfs
mount -o compress=zstd /dev/mapper/btrfs /mnt
```

### Create top-level subvolumes
{: .no_toc}

```bash
btrfs subvolume create /mnt/@
btrfs subvolume create /mnt/@home
btrfs subvolume create /mnt/@snapshots
btrfs subvolume create /mnt/@swap
```

### Mount top-level subvolumes
{: .no_toc}

```bash
mkdir /mnt/{home,.snapshots,.swap}
umount /dev/mapper/btrfs /mnt

mount -o compress=zstd,subvol=@ /dev/mapper/btrfs /mnt
mount -o compress=zstd,subvol=@home /dev/mapper/btrfs /mnt/home
mount -o compress=zstd,subvol=@snapshots /dev/mapper/btrfs /mnt/.snapshots
mount -o compress=zstd,subvol=@swap /dev/mapper/btrfs /mnt/.swap
```

### Create nested subvolumes
{: .no_toc}

```bash
mkdir -p /mnt/var/cache/pacman

btrfs subvolume create /mnt/var/cache/pacman/pkg
btrfs subvolume create /mnt/var/abs
btrfs subvolume create /mnt/var/tmp
btrfs subvolume create /mnt/srv
```

## Fat32

### Format the EFI partition
{: .no_toc}

```bash
$ mkfs.fat -F32 -n EFI /dev/sda1
```

#### RAID1
{: .no_toc .pt-4}
```bash
$ mkfs.fat -F32 -n EFIARRAY /dev/mdX
```

### Mount the EFI partition
{: .no_toc .pt-4}

```bash
$ mkdir /mnt/boot
$ mount /dev/sda1 /mnt/boot
```

#### RAID1
{: .no_toc .pt-4}

```bash
$ mkdir /mnt/boot
$ mount /dev/mdX /mnt/boot
```

### References
{: .no_toc .text-delta .pt-4}

- [ArchWiki - EFI system partition](https://wiki.archlinux.org/index.php/EFI_system_partition)
- [Manual - mkfs.fat](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/dosfstools/mkfs.fat.8.en)
- [Manual - mkdir](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/coreutils/mkdir.1.en)
- [Manual - mount](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/util-linux/mount.8.en)

---
