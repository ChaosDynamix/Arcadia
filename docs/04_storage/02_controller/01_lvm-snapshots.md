---
layout: default
title: Lvm-snapshots
permalink: /storage/controller/lvm-snapshots/
grand_parent: Storage
parent: Controller
nav_order: 1
---

# Controller / Lvm with snapshots
{: .no_toc}

## Scenarios
{: .no_toc .text-delta}

1. TOC
{:toc}

---

## Setup the Logical volume Manager

| Volume | Size recommendation                                                                                               |
| :----- | :---------------------------------------------------------------------------------------------------------------- |
| ROOT   | 15–20 GiB                                                                                                         |
| SWAP   | [VOID Linux recommendations](https://docs.voidlinux.org/installation/live-images/partitions.html#swap-partitions) |
| VAR    | 8–12 GiB                                                                                                          |
| HOME   | 100%FREE                                                                                                          |

### Create the Physical and Group Volume
{: .no_toc}

#### SINGLE CONTAINER
{: .no_toc .mt-5}

```bash
$ pvcreate /dev/mapper/container
$ vgcreate grp /dev/mapper/container
```

#### MULTIPLE CONTAINERS
{: .no_toc .mt-6}

```bash
$ pvcreate /dev/mapper/container1 /dev/mapper/container2
$ vgcreate grp /dev/mapper/container1 /dev/mapper/container2
```

### Create the Logical volumes
{: .no_toc .mt-6}

```bash
$ lvcreate -L SIZE grp -n root
$ lvcreate -L SIZE grp -n swap
$ lvcreate -L SIZE grp -n var
$ lvcreate -l 100%FREE grp -n home
```

### Reduce the Home Logical volume size
{: .no_toc .mt-6}

The goal here is to free the space needed by the snapshots volume for the Root volume. You remove 20% of the Home volume size which should be sufficient for the snapshots volume created later.

#### EXAMPLE FOR 20G
{: .no_toc .mt-5}

```bash
$ echo "20*0.2" | bc
$ lvreduce -L -4G /dev/grp/home
```

---

## Setup the volumes

### Format the Volumes
{: .no_toc}

```bash
$ mkfs.ext4 -L ROOT /dev/grp/root
$ mkswap -L SWAP /dev/grp/swap
$ mkfs.ext4 -L VAR /dev/grp/var
$ mkfs.ext4 -L HOME /dev/grp/home
```

### Mount the volumes
{: .no_toc .mt-6}

```bash
$ mount /dev/grp/root /mnt
$ mkdir /mnt/{var,home}
$ mount /dev/grp/var /mnt/var
$ mount /dev/grp/home /mnt/home
```

### Activate the Swap
{: .no_toc .mt-6}

```bash
$ swapon /dev/grp/swap
```

---

## Setup the EFI partition(s)
{: .d-inline-block}

UEFI
{: .label .label-blue .ml-2}

#### SINGLE PARTITION
{: .no_toc .mt-0}

```bash
$ mkfs.fat -F32 -n EFI /dev/sda1
$ mkdir /mnt/efi
$ mount /dev/sda1 /mnt/efi
```

#### MULTIPLE PARTITIONS
{: .no_toc .mt-6}

```bash
$ mkfs.fat -F32 -n EFI /dev/sda1
$ mkfs.fat -F32 -n EFI /dev/sdb1
$ mkdir /mnt/{efi1,efi2}
$ mount /dev/sda1 /mnt/efi1
$ mount /dev/sdb1 /mnt/efi2
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
