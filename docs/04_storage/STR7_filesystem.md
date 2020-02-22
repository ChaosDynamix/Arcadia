---
layout: default
title: STR7 Filesystem
nav_order: 7
parent: 04 Storage
permalink: /storage/filesystem/
has_toc: false
---

# Storage filesystem
{: .no_toc}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

## Ext4

### Format the partitions
{: .no_toc .pt-4}

```bash
# Root partition
$ mkfs.ext4 -L ROOT /dev/sdXY

# Home partition
$ mkfs.ext4 -L HOME /dev/sdXY
```

#### LVM
{: .no_toc .pt-4}

```bash
# Root partition
$ mkfs.ext4 -L ROOT /dev/grp/root

# Home partition
$ mkfs.ext4 -L HOME /dev/grp/home
```

### Mount the partitions
{: .no_toc .pt-4}

```bash
# Root partition
$ mount /dev/sdXY /mnt

# Home partition
$ mkdir /mnt/home
$ mount /dev/sdXY /mnt/home
```

#### LVM
{: .no_toc .pt-4}

```bash
# Root partition
$ mount /dev/grp/root /mnt

# Home partition
$ mkdir /mnt/home
$ mount /dev/grp/home /mnt/home
```

### References
{: .no_toc .text-delta .pt-4}

- [ArchWiki - Installation guide - Format the partitions](https://wiki.archlinux.org/index.php/Installation_guide#Format_the_partitions)
- [ArchWiki - Installation guide - Mount the file systems](https://wiki.archlinux.org/index.php/Installation_guide#Mount_the_file_systems)
- [Manual - mkfs.ext4](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/e2fsprogs/mkfs.ext4.8.en)
- [Manual - mkdir](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/coreutils/mkdir.1.en)
- [Manual - mount](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/util-linux/mount.8.en)

---

## Swap

### Format the Swap partition
{: .no_toc .pt-4}

```bash
$ mkswap -L SWAP /dev/sdXY
```

#### LVM
{: .no_toc .pt-4}

```bash
$ mkswap -L SWAP /dev/grp/swap
```

### Activate the Swap partition
{: .no_toc .pt-4}

```bash
$ swapon /dev/sdXY
```

#### LVM
{: .no_toc .pt-4}

```bash
$ swapon /dev/grp/swap
```

### References
{: .no_toc .text-delta .pt-4}

- [ArchWiki - Installation guide - Format the partitions](https://wiki.archlinux.org/index.php/Installation_guide#Format_the_partitions)
- [Manual - mkswap](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/util-linux/mkswap.8.en)
- [Manual - swapon](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/man-pages/swapon.2.en)

---

## Fat32

### Format the EFI partition
{: .no_toc .pt-4}

```bash
$ mkfs.fat -F32 -n EFI /dev/sda1
```

### Mount the EFI partition
{: .no_toc .pt-4}

```bash
$ mkdir /mnt/boot
$ mount /dev/sda1 /mnt/boot
```

### References
{: .no_toc .text-delta .pt-4}

- [ArchWiki - EFI system partition](https://wiki.archlinux.org/index.php/EFI_system_partition)
- [Manual - mkfs.fat](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/dosfstools/mkfs.fat.8.en)
- [Manual - mkdir](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/coreutils/mkdir.1.en)
- [Manual - mount](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/util-linux/mount.8.en)

---

## Btrfs

### Setup mapped device
{: .no_toc}

#### LUKS
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
