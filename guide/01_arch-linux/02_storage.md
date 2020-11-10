---
title     : !!str Storage
parent    : !!str Arch Linux
nav_order : !!int 2
permalink : !!str /arch-linux/storage
---

# {{ page.title }}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

## About device files

In Unix-like operating systems, a device file or special file is an interface to a device driver that appears in a file system as if it were an ordinary file. These special files allow an application program to interact with a device by using its device driver via standard input/output system calls.

| Device type                           | Device file         | Partition file          |
| :------------------------------------ | :------------------ | :---------------------- |
| SCSI/PATA/SATA & USB/IEEE 1394 device | sda, sdb...         | sda1, sda2...           |
| IDE device                            | hda, hdb...         | hda1, hda2...           |
| NVMe device                           | nvme0, nvme1...     | nvme0n1p1, nvme0n1p2... |
| SD Cards, eMMC chips etc...           | mmcblk0, mmcblk1... | mmcblk0p1, mmcblk0p2... |

**Note**: NVMe devices contains namespaces. Partitioning is not directly made with the device file but with the namespace file (e.g. `nvme0(n1)p1`).
{: .fs-3}

### Identify the target device for the Arch Linux installation

```
fdisk -l
```

### References
{: .text-delta .pt-4}

1. [Wikipedia - Device file](https://en.wikipedia.org/wiki/Device_file)
1. [ManPage - Fdisk](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/util-linux/fdisk.8.en)
{: .fs-3}

---

## Create the partition table and the partitions

| Partition node | Partition type       | Partition size          |
| :------------- | :------------------- | :---------------------- |
| /dev/nvme0n1p1 | EFI system partition | 550 MiB                 |
| /dev/nvme0n1p2 | Linux LUKS partition | All the space remaining |

### Launch the Sgdisk script

Sgdisk is the command-line version of gdisk program. GPT fdisk (aka gdisk) is a text-mode menu-driven program for creation and manipulation of partition tables.

```
sgdisk --clear \
       --new 1:0:+550M \
       --new 2:0:0 \
       --typecode 1:ef00 \
       --typecode 2:8309 \
       /dev/nvme0n1
```

### References
{: .text-delta .pt-4}

1. [Wikipedia - Disk partitioning](https://en.wikipedia.org/wiki/Disk_partitioning)
1. [Wikipedia - Partition table](https://en.wikipedia.org/wiki/Partition_table)
1. [Wikipedia - GUID partition table](https://en.wikipedia.org/wiki/GUID_Partition_Table)
1. [ArchWiki - GPT fdisk](https://wiki.archlinux.org/index.php/GPT_fdisk)
1. [ManPage - Sgdisk](https://jlk.fjfi.cvut.cz/arch/manpages/man/extra/gptfdisk/sgdisk.8.en)
{: .fs-3}

---

## Encrypt the root partition

Replace every occurence of `/dev/nvme0n1p2` with your device name.

### Create the LUKS2 container
```
cryptsetup luksFormat /dev/nvme0n1p2
```

**Note**: Passwords must be complex enough to not be easily guessed from e.g. personal information, or cracked using methods like social engineering or brute-force attacks. The tenets of strong passwords are based on length and randomness.
{: .fs-3}

### Open the LUKS2 container
```
cryptsetup open /dev/nvme0n1p2 cryptroot
```

### References
{: .text-delta .pt-4}

1. [Wikipedia - Encryption](https://en.wikipedia.org/wiki/Encryption)
1. [Wikipedia - Dm-crypt](https://en.wikipedia.org/wiki/Dm-crypt)
1. [Wikipedia - LUKS](https://en.wikipedia.org/wiki/Linux_Unified_Key_Setup)
1. [ArchWiki - Dm-crypt/Device encryption](https://wiki.archlinux.org/index.php/Dm-crypt/Device_encryption)
1. [ArchWiki - Dm-crypt/Encrypting an entire system](https://wiki.archlinux.org/index.php/Dm-crypt/Encrypting_an_entire_system)
1. [ManPage - Cryptsetup](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/cryptsetup/cryptsetup.8.en)
{: .fs-3}

---

## Create the filesystems

| Partition node | Filesystem | Label |
| :------------- | :--------- | :---- |
| /dev/nvme0n1p1 | Fat32      | BOOT  |
| /dev/nvme0n1p2 | Ext4       | ROOT  |

```
mkfs.ext4 -L ROOT /dev/mapper/cryptroot
mkfs.fat -F32 -n BOOT /dev/nvme0n1p1
```

### References
{: .text-delta .pt-4}

1. [ArchWiki - Installation guide](https://wiki.archlinux.org/index.php/Installation_guide#Format_the_partitions)
1. [ArchWiki - Filesystems](https://wiki.archlinux.org/index.php/File_systems)
1. [ArchWiki - Dm-crypt/Encrypting an entire system](https://wiki.archlinux.org/index.php/Dm-crypt/Encrypting_an_entire_system)
1. [ArchWiki - EFI system partition](https://wiki.archlinux.org/index.php/EFI_system_partition)
1. [ManPage - Mkfs](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/util-linux/mkfs.8.en)
{: .fs-3}

---

## Mount the filesystems

| Partition node | Mountpoint | Create directory ? |
| :------------- | :--------- | :----------------- |
| /dev/nvme0n1p1 | /mnt/boot  | yes                |
| /dev/nvme0n1p2 | /mnt       | no                 |

```
mount /dev/mapper/cryptroot /mnt
mkdir /mnt/boot
mount /dev/nvme0n1p1 /mnt/boot
```

### References
{: .text-delta .pt-4}

1. [ArchWiki - Installation guide](https://wiki.archlinux.org/index.php/Installation_guide#Mount_the_file_systems)
1. [ManPage - Mount](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/man-pages/mount.2.en)
1. [ManPage - Mkdir](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/coreutils/mkdir.1.en)
{: .fs-3}

