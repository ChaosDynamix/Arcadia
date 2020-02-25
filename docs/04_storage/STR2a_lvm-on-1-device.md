---
layout: default
title: STR2a LVM on 1 device
grand_parent: 04 Storage
parent: STR2 Scenarios
nav_order: 1
permalink: /storage/scenarios/lvm-on-1-device/
has_toc: false
---

# Storage scenario for LVM on 1 device
{: .no_toc}

```
+----------------+ +-----------------------------------------------------------------------+
| EFI partition  | | Logical volume 1      | Logical volume 2      | Logical volume 3      |
| /efi           | | [SWAP]                | /                     | /home                 |
|                | | /dev/grp/swap         | /dev/grp/root         | /dev/grp/home         |
|                | +-----------------------+-----------------------+-----------------------+
|                | |                             Group volume                              |
|                | |                               /dev/grp/                               |
|                | +-----------------------------------------------------------------------+
|                | |                            Physical volume                            |
|                | |                            /dev/mapper/lvm                            |
|                | +-----------------------------------------------------------------------+
|                | |                       LUKS1 encrypted partition                       |
| /dev/sda1      | |                              /dev/sda2                                |
+----------------+-+-----------------------------------------------------------------------+
```

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

## Partitioning

#### Partition scheme
{: .no_toc .pt-4}

| Partition | Mounting point  | Partition type                     | Size     |
| :-------- | :-------------  | :--------------------------------- | :------- |
| /dev/sda1 | /efi            | EFI system partition               | 512M     |
| /dev/sda2 |                 | Linux Logical Volume Manager (LVM) | 100%FREE |

#### Partition types
{: .no_toc .pt-4}

| Partition types guid                 | Description                        |
| :----------------------------------- | :--------------------------------- |
| C12A7328-F81F-11D2-BA4B-00A0C93EC93B | EFI System partition               |
| E6D6D379-F507-44C2-A23C-238F2A3DF928 | Linux Logical Volume Manager (LVM) |

### References
{: .no_toc .text-delta .pt-4}

- [Wikipedia - GUID partition table](https://en.wikipedia.org/wiki/GUID_Partition_Table)

---

## Encryption

### Create the container
{: .no_toc .pt-2}

```bash
$ cryptsetup --type luks1 luksFormat /dev/sda2
```

### Open the container
{: .no_toc .pt-4}

```bash
$ cryptsetup open /dev/sdXY lvm
```

---

## Logical Volume Manager

#### Swap partition size recommendations
{: .no_toc .pt-4}

| System RAM | Recommended swap space | Swap space if using hibernation |
| :--------- | :--------------------- | :------------------------------ |
| < 2GB      | 2x the amount of RAM   | 3x the amount of RAM            |
| 2 - 8G     | Equal to amount of RAM | 2x the amount of RAM            |
| 8 - 64G    | At least 4GB           | 1.5x the amount of RAM          |
| 64G        | At least 4GB           | Hibernation not recommended     |

### Create the physical volume
{: .no_toc .pt-4}

```bash
$ pvcreate /dev/mapper/lvm
```

### Create the volume group
{: .no_toc .pt-4}

```bash
$ vgcreate grp /dev/mapper/lvm
```

### Create the logical volumes
{: .no_toc .pt-4}

```bash
$ lvcreate -L 8G grp -n swap
$ lvcreate -L 32G grp -n root
$ lvcreate -l 100%FREE grp -n home
```

#### References
{: .no_toc .text-delta .pt-4}

- [ArchWiki - LVM on LUKS - Preparing the logical volumes](https://wiki.archlinux.org/index.php/Dm-crypt/Encrypting_an_entire_system#Preparing_the_logical_volumes)
- [VOID Linux Partitions Notes - SWAP partitions](https://docs.voidlinux.org/installation/live-images/partitions.html#swap-partitions)

---

## Format the partitions

```bash
$ mkfs.ext4 -L ROOT /dev/grp/root
$ mkfs.ext4 -L HOME /dev/grp/home

$ mkfs.fat -F32 -n EFI /dev/sda1
```

### References
{: .no_toc .text-delta .pt-4}

- [ArchWiki - Installation guide - Format the partitions](https://wiki.archlinux.org/index.php/Installation_guide#Format_the_partitions)
- [ArchWiki - EFI system partition](https://wiki.archlinux.org/index.php/EFI_system_partition)
- [Manual - mkfs.ext4](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/e2fsprogs/mkfs.ext4.8.en)
- [Manual - mkfs.fat](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/dosfstools/mkfs.fat.8.en)

---

## Swap partition

```bash
$ mkswap -L SWAP /dev/grp/swap
$ swapon /dev/grp/swap
```

### References
{: .no_toc .text-delta .pt-4}

- [ArchWiki - Installation guide - Format the partitions](https://wiki.archlinux.org/index.php/Installation_guide#Format_the_partitions)
- [Manual - mkswap](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/util-linux/mkswap.8.en)
- [Manual - swapon](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/man-pages/swapon.2.en)

---

## Mount the partitions

```bash
$ mount /dev/grp/root /mnt

$ mkdir /mnt/{home,efi}

$ mount /dev/grp/home /mnt/home
$ mount /dev/sda1 /mnt/efi
```

### References
{: .no_toc .text-delta .pt-4}

- [ArchWiki - Installation guide - Mount the file systems](https://wiki.archlinux.org/index.php/Installation_guide#Mount_the_file_systems)
- [ArchWiki - EFI system partition](https://wiki.archlinux.org/index.php/EFI_system_partition)
- [Manual - mkdir](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/coreutils/mkdir.1.en)
- [Manual - mount](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/util-linux/mount.8.en)
