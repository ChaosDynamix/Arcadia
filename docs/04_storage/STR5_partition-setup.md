---
layout: default
title: STR5 Partition setup
nav_order: 5
parent: 04 Storage
permalink: /storage/partition-setup/
has_toc: false
---

# Storage partition setup
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
$ mkfs.ext4 -L ROOT /dev/sdXY
$ mkfs.ext4 -L HOME /dev/sdXY
```

#### UEFI / GPT
{: .no_toc .pt-4}

```bash
$ mkfs.fat -F32 -n EFI /dev/sdXY
```

### Setup the swap partition
{: .no_toc .pt-4}

```bash
$ mkswap -L SWAP /dev/sdXY
$ swapon /dev/sdXY
```

### Mount the partitions
{: .no_toc .pt-4}

```bash
# Create the home directory
$ mkdir /mnt/home

# Mount the partitions
$ mount /dev/sdXY /mnt
$ mount /dev/sdXY /mnt/home
```

#### UEFI / GPT
{: .no_toc .pt-4}

```bash
# Create the boot directory
$ mkdir /mnt/boot

# Mount the partition
$ mount /dev/sdXY /mnt/boot
```

### References
{: .no_toc .text-delta .pt-4}

- [ArchWiki - Installation guide - Format the partitions](https://wiki.archlinux.org/index.php/Installation_guide#Format_the_partitions)
- [ArchWiki - EFI system partition](https://wiki.archlinux.org/index.php/EFI_system_partition)
- [Manual - mkfs.ext4](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/e2fsprogs/mkfs.ext4.8.en)
- [Manual - mkfs.fat](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/dosfstools/mkfs.fat.8.en)
- [Manual - mkswap](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/util-linux/mkswap.8.en)
- [Manual - swapon](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/man-pages/swapon.2.en)
- [ArchWiki - Installation guide - Mount the file systems](https://wiki.archlinux.org/index.php/Installation_guide#Mount_the_file_systems)
- [ArchWiki - EFI system partition](https://wiki.archlinux.org/index.php/EFI_system_partition)
- [Manual - mkdir](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/coreutils/mkdir.1.en)
- [Manual - mount](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/util-linux/mount.8.en)

---

## Lvm

### Create the physical volume
{: .no_toc}

```bash
$ pvcreate /dev/sda2
```

#### LUKS
{: .no_toc .pt-4}

```bash
$ pvcreate /dev/mapper/lvm
```

### Create the volume group
{: .no_toc}

```bash
$ vgcreate grp /dev/sda2
```

#### LUKS
{: .no_toc .pt-4}

```bash
$ vgcreate grp /dev/mapper/lvm
```

### Create the logical volumes
{: .no_toc}

```bash
$ lvcreate -L 8G grp -n swap
$ lvcreate -L 32G grp -n root
$ lvcreate -l 100%FREE grp -n home
```

### Formating logical volumes
{: .no_toc}

```bash
$ mkfs.ext4 /dev/grp/root
$ mkfs.ext4 /dev/grp/home
```

### Setup Swap
{: .no_toc}

```bash
$ mkswap /dev/grp/swap
$ swapon /dev/grp/swap
```

### Mounting logical volumes
{: .no_toc}

```bash
$ mount /dev/grp/root /mnt
$ mkdir /mnt/home
$ mount /dev/grp/home /mnt/home
```

### Setup the boot partition
{: .no_toc}

```bash
$ mkfs.fat -F32 /dev/sda1
$ mkdir /mnt/boot
$ mount /dev/sda1 /mnt/boot
```

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

### Formating the boot partition
{: .no_toc}

```bash
mkfs.fat -F32 /dev/sda1
```
