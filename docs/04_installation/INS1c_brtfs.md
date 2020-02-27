---
layout: default
title: BTRFS
nav_order: 3
parent: 04 Installation
permalink: /installation/btrfs/
has_toc: false
---

# Installation guide for BTRFS
{: .no_toc}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

```
subvolid=5 (/dev/mapper/btrfs)
   |
   ├── @ (mounted as /)
   |       ├── /bin (directory)
   |       ├── /home (mounted @home subvolume)
   |       ├── /usr (directory)
   |       ├── /.snapshots (mounted @snapshots subvolume)
   |       ├── /var/cache/pacman/pkg (nested subvolume)
   |       ├── ... (other directories and nested subvolumes)
   ├── @snapshots (mounted as /.snapshots)
   ├── @home (mounted as /home)
   └── @... (additional subvolumes you wish to use as mount points)
```

## [BTRFS](/Andromeda/storage/scenarios/btrfs/)
{: .d-inline-block}

UEFI
{: .label .label-purple .ml-4}

LUKS1
{: .label .label-purple}

#### Partition layout
{: .no_toc}

| Partition | Mounting point | Partition type       | Size     |
| :-------- | :------------- | :------------------- | :------- |
| /dev/sda1 | /efi           | EFI system partition | 512M     |
| /dev/sda2 |                | Linux Filesystem     | 100%FREE |

```
+-------------------------------+-----------------------------------------------------------------+
| EFI system partition          | LUKS1 encrypted partition                                       |
| /efi                          | /dev/mapper/btrfs                                               |
|                               +-----------------------------------------------------------------+
|                               |                                                                 |
| /dev/sda1                     | /dev/sda2                                                       |
+-------------------------------+-----------------------------------------------------------------+
```

#### BTRFS subvolumes
{: .no_toc .pt-4}

```
subvolid=5 (/dev/mapper/btrfs)
   |
   ├── @ (mounted as /)
   |       ├── /bin (directory)
   |       ├── /home (mounted @home subvolume)
   |       ├── /usr (directory)
   |       ├── /.snapshots (mounted @snapshots subvolume)
   |       ├── /var/cache/pacman/pkg (nested subvolume)
   |       ├── ... (other directories and nested subvolumes)
   ├── @snapshots (mounted as /.snapshots)
   ├── @home (mounted as /home)
   └── @... (additional subvolumes you wish to use as mount points)
```

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

### Edit /etc/fstab and add the Swap file
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
