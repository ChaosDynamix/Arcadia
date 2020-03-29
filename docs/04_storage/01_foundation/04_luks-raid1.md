---
layout: default
title: Luks-Raid1
permalink: /storage/foundation/luks-raid1/
grand_parent: Storage
parent: Foundation
nav_order: 4
---

# Multiple devices / Luks on Raid1
{: .no_toc}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

## Secure erase the device
{: .d-inline-block}

IRREVERSIBLE DATA ERASE
{: .label .label-red .mx-2}

Before setting up encryption on the mass storage device, consider securely wiping it first. This consists of overwriting the entire device with a stream of zero bytes or random bytes, and is done for one or both of the following reasons

- Prevent recovery of previously stored data
- Prevent disclosure of usage patterns on the encrypted device

### Create the temporary encrypted containers
{: .no_toc}

```bash
$ cryptsetup open --type plain -d /dev/urandom /dev/sda to_be_wiped1
$ cryptsetup open --type plain -d /dev/urandom /dev/sda to_be_wiped2
```

### Wipe the containers with zeros
{: .no_toc .mt-6}


```bash
$ dd if=/dev/zero of=/dev/mapper/to_be_wiped1 status=progress
$ dd if=/dev/zero of=/dev/mapper/to_be_wiped2 status=progress
```

### Close the temporary containers
{: .no_toc .mt-6}

```bash
$ cryptsetup close to_be_wiped1
$ cryptsetup close to_be_wiped2
```

---

## Partition the devices

If you have more than 2 devices, just clone one of the device with the command `sgdisk -R=/dev/sdc /dev/sdb` and make sure to create new GUID for each of them with `sgdisk -G /dev/sdc`.

The first command create the partition table and the partitions on the devices (with the same GUID). The second command create a new partition GUID for the second device in order to identify each device properly.

### UEFI / GPT
{: .no_toc .text-delta .mt-6}

```bash
$ sgdisk -o -n=1:0:+260M -n=2:0:-100M -t=1:ef00 -t=2:fd00 -R=/dev/sdb /dev/sda
$ sgdisk -G /dev/sdb
```

| Device | Partition | Partition type       | Size            |
| :----- | :-------- | :------------------- | :-------------- |
| 1      | /dev/sda1 | EFI system partition | 260M            |
| 1      | /dev/sda2 | Linux RAID partition | 100%FREE - 100M |
| 2      | /dev/sdb1 | EFI system partition | 260M            |
| 2      | /dev/sdb2 | Linux RAID partition | 100%FREE - 100M |

### BIOS / GPT
{: .no_toc .text-delta .mt-8}

```bash
$ sgdisk -o -n=1:0:+1M -n=2:0:-100M -t=1:ef02 -t=2:fd00 -R=/dev/sdb /dev/sda
$ sgdisk -G /dev/sdb
```

| Device | Partition | Partition type       | Size            |
| :----- | :-------- | :------------------- | :-------------- |
| 1      | /dev/sda1 | BIOS boot partition  | 1M              |
| 1      | /dev/sda2 | Linux RAID partition | 100%FREE - 100M |
| 2      | /dev/sdb1 | BIOS boot partition  | 1M              |
| 2      | /dev/sdb2 | Linux RAID partition | 100%FREE - 100M |

---

## Create the RAID array

Redundant Array of Independent Disks (RAID) is a storage technology that combines multiple disk drive components (typically disk drives or partitions thereof) into a logical unit. Depending on the RAID implementation, this logical unit can be a file system or an additional transparent layer that can hold several partitions.

### Create a RAID1 array with the devices
{: .no_toc}

```bash
$ mdadm --create --level=1 --metadata=1.2 --raid-devices=2 /dev/md/array /dev/sda2 /dev/sdb2
```

### Check the synchronization of the array
{: .no_toc .mt-6}

```bash
$ watch /proc/mdstat
```

---

## Encrypt the RAID array

GRUB does not support LUKS2 headers to unlock encrypted `/boot` partition so you need to specify `--type luks1` on encrypted device that GRUB need to access.

### Create the LUKS1 container
{: .no_toc}

```bash
$ cryptsetup --type luks1 luksFormat /dev/md/array
```

### Open the container
{: .no_toc .mt-6}

```bash
$ cryptsetup open /dev/md/array container
```

---

## References
{: .no_toc}

### SECURE ERASE
{: .no_toc .text-delta}

1. [ArchWiki - Dm-crypt - Drive preparation - Secure erasure of the hard disk drive](https://wiki.archlinux.org/index.php/Dm-crypt/Drive_preparation#Secure_erasure_of_the_hard_disk_drive)

### GPT FDISK
{: .no_toc .text-delta .mt-6}

1. [ArchWiki - GPT fdisk](https://wiki.archlinux.org/index.php/GPT_fdisk)

### MANUALS
{: .no_toc .text-delta .mt-6}

1. [Man page - cryptsetup](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/cryptsetup/cryptsetup.8.en)
1. [Man page - dd](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/coreutils/dd.1.en)
1. [Man page - sgdisk](https://jlk.fjfi.cvut.cz/arch/manpages/man/extra/gptfdisk/sgdisk.8.en)
