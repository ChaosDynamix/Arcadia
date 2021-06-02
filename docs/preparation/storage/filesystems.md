---
title: Filesystems
---

# Filesystems
This page describes how to create and mount the filesystems required to install Arch Linux.

## Create the filesystems
| Node                  | Filesystem | Label |
| :-------------------- | :--------- | :---- |
| /dev/nvme0n1p1        | Fat32      | BOOT  |
| /dev/mapper/cryptroot | Ext4       | ROOT  |

```
mkfs.ext4 -L ROOT /dev/mapper/cryptroot
mkfs.fat -F32 -n BOOT /dev/nvme0n1p1
```

### References
1. [ArchWiki - Installation guide](https://wiki.archlinux.org/index.php/Installation_guide#Format_the_partitions)
1. [ArchWiki - Filesystems](https://wiki.archlinux.org/index.php/File_systems)
1. [ArchWiki - Dm-crypt/Encrypting an entire system](https://wiki.archlinux.org/index.php/Dm-crypt/Encrypting_an_entire_system)
1. [ArchWiki - EFI system partition](https://wiki.archlinux.org/index.php/EFI_system_partition)
1. [ManPage - Mkfs](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/util-linux/mkfs.8.en)

## Mount the filesystems
| Node                  | Mountpoint | Create directory ? |
| :-------------------- | :--------- | :----------------- |
| /dev/nvme0n1p1        | /mnt/boot  | yes                |
| /dev/mapper/cryptroot | /mnt       | no                 |

```
mount /dev/mapper/cryptroot /mnt
mkdir /mnt/boot
mount /dev/nvme0n1p1 /mnt/boot
```

### References
1. [ArchWiki - Installation guide](https://wiki.archlinux.org/index.php/Installation_guide#Mount_the_file_systems)
1. [ManPage - Mount](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/man-pages/mount.2.en)
1. [ManPage - Mkdir](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/coreutils/mkdir.1.en)