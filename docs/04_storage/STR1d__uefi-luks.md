---
layout: default
title: Uefi-Luks
permalink: /storage/preparation/uefi-luks/
nav_exclude: true
---

[Return to Storage preparation](/Andromeda/storage/preparation/){: .btn .btn-purple }

# Storage preparation for Uefi-Luks
{: .no_toc}

---

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

```
+------------------------+---------------------------------------------------+
| EFI system partition   | LUKS1 encrypted partition                         |
| /efi                   | /dev/mapper/container                             |
|                        +---------------------------------------------------+
| /dev/sda1              | /dev/sda2                                         |
+------------------------+---------------------------------------------------+
```

---

## Secure erase the drive(s)
{: .d-inline-block}

IRREVERSIBLE DATA ERASE
{: .label .label-red .mx-2}

Before setting up disk encryption on a (part of a) disk, consider securely wiping it first. This consists of overwriting the entire drive or partition with a stream of zero bytes or random bytes, and is done for one or both of the following reasons

- Prevent recovery of previously stored data
- Prevent disclosure of usage patterns on the encrypted drive

```bash
# Open the container
$ cryptsetup open --type plain -d /dev/urandom /dev/sda erase_drive

# Secure erase the drive
$ dd if=/dev/zero of=/dev/mapper/erase_drive status=progress

# Close the container
$ cryptsetup close erase_drive
```

---

## Partition the drive

| Partition | Partition type       | Size     |
| :-------- | :------------------- | :------- |
| /dev/sda1 | EFI system partition | 260M     |
| /dev/sda2 | Linux LUKS partition | 100%FREE |

### With sgdisk
{: .no_toc .pt-4}

```bash
$ sgdisk -o -n=1:0:+260M -n=2:0:0 -t=1:ef00 -t=2:8309 /dev/sda
```

---

## Encrypt the partition

```bash
# Create the container
$ cryptsetup --type luks1 luksFormat /dev/sda2

# Open the container
$ cryptsetup open /dev/sdXY lvm
```

---

### References
{: .no_toc .text-delta .pt-4}

1. [ArchWiki - Dm-crypt - Drive preparation - Secure erasure of the hard disk drive](https://wiki.archlinux.org/index.php/Dm-crypt/Drive_preparation#Secure_erasure_of_the_hard_disk_drive)
1. [Man page - cryptsetup](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/cryptsetup/cryptsetup.8.en)
1. [Man page - dd](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/coreutils/dd.1.en)
