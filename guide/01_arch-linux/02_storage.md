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

## Setup the device

### Identify the name of your device
```
fdisk -l
```

| Device type                                  | Prefix  | Device name example |
| :------------------------------------------- | :------ | :------------------ |
| SCSI/PATA/SATA but also USB/IEEE 1394 device | sd      | /dev/sda            |
| IDE device                                   | hd      | /dev/hda            |
| NVMe device                                  | nvme    | /dev/nvme0n1        |
| SD Cards, eMMC chips etc...                  | mmcblk  | /dev/mmcblk0        |

**Note**: NVMe devices identifier contains a namespace before the partition name (`nvme0->n1<-p1`).
{: .fs-3}

### Create the partition table and the partitions

For the rest of the guide, I will use the NVMe naming convention. Replace `nvme0n1`, `nvme0n1p1` and `nvme0n1p2` if your device and partition names are different (e.g. `sda`, `sda1` and `sda2`).

| Partition node | Partition type       | Partition size |
| :------------- | :------------------- | :------------- |
| /dev/nvme0n1p1 | EFI system partition | 260 MiB        |
| /dev/nvme0n1p2 | Linux LUKS partition | 100%FREE       |

```
sgdisk -o -n=1:0:+260M -t=1:ef00 -n=2:0:0 -t=2:8309 /dev/nvme0n1
```

**Note**: I use sgdisk for this task which is the command-line version of gdisk program. GPT fdisk (aka gdisk) is a text-mode menu-driven program for creation and manipulation of partition tables.
{: .fs-3}

### References
{: .text-delta .pt4}

1. [Wikipedia - Device file](https://en.wikipedia.org/wiki/Device_file)
1. [Wikipedia - Disk partitioning](https://en.wikipedia.org/wiki/Disk_partitioning)
1. [Wikipedia - Partition table](https://en.wikipedia.org/wiki/Partition_table)
1. [Wikipedia - GUID partition table](https://en.wikipedia.org/wiki/GUID_Partition_Table)
1. [ArchWiki - GPT fdisk](https://wiki.archlinux.org/index.php/GPT_fdisk)
1. [ManPage - Sgdisk](https://jlk.fjfi.cvut.cz/arch/manpages/man/extra/gptfdisk/sgdisk.8.en)
{: .fs-3}

---

## Encrypt the system partition with dm-crypt/LUKS

Grub boot loader does not support LUKS2 headers to unlock encrypted `/boot` partition so you need to specify `--type luks1` on encrypted device that GRUB need to access.

### Create the LUKS1 container
```
cryptsetup --type luks1 luksFormat /dev/nvme0n1p2
```

**Note**: Passwords must be complex enough to not be easily guessed from e.g. personal information, or cracked using methods like social engineering or brute-force attacks. The tenets of strong passwords are based on length and randomness.
{: .fs-3}

### Open the container
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

## Setup the filesystems

### ROOT container
```
mkfs.ext4 -L ROOT /dev/mapper/cryptroot
mount /dev/mapper/cryptroot /mnt
```

### EFI partition
```
mkfs.fat -F32 -n EFI /dev/nvme0n1p1
mkdir /mnt/efi
mount /dev/nvme0n1p1 /mnt/efi
```

### References
{: .text-delta .pt-4}

1. [ArchWiki - Filesystems](https://wiki.archlinux.org/index.php/File_systems)
1. [ArchWiki - Dm-crypt/Encrypting an entire system](https://wiki.archlinux.org/index.php/Dm-crypt/Encrypting_an_entire_system)
1. [ArchWiki - EFI system partition](https://wiki.archlinux.org/index.php/EFI_system_partition)
1. [ManPage - Mkfs](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/util-linux/mkfs.8.en)
1. [ManPage - Mount](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/man-pages/mount.2.en)
1. [ManPage - Mkdir](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/coreutils/mkdir.1.en)
{: .fs-3}

