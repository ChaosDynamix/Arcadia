---
layout: default
title: Luks-multiple-partitions
permalink: /storage/foundation/luks-multiple-partitions/
grand_parent: Storage
parent: Foundation
nav_order: 3
---

# Multiple devices / Luks on multiple partitions
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

If you have more than 2 devices, just clone the second device with the command `sgdisk -R=/dev/sdc /dev/sdb` and make sure to create new GUID for each of them with `sgdisk -G /dev/sdc`.

Be aware that each device must be unlock during boot time which is not the easiest solution if you have a lot of devices. Workarounds can be found to unlock multiple devices with the same passphrase but there are not covered in this guide.

### UEFI / GPT
{: .no_toc .text-delta}

```bash
$ sgdisk -o -n=1:0:+260M -n=2:0:0 -t=1:ef00 -t=2:8309 /dev/sda
$ sgdisk -o -n=1:0:0 -t=1:8309 /dev/sdb
```

| Device | Partition | Partition type       | Size     |
| :----- | :-------- | :------------------- | :------- |
| 1      | /dev/sda1 | EFI system partition | 260M     |
| 1      | /dev/sda2 | Linux LUKS partition | 100%FREE |
| 2      | /dev/sdb1 | Linux LUKS partition | 100%FREE |

### BIOS / GPT
{: .no_toc .text-delta .mt-6}

```bash
$ sgdisk -o -n=1:0:+1M -n=2:0:0 -t=1:ef02 -t=2:8309 /dev/sda
$ sgdisk -o -n=1:0:0 -t=1:8309 /dev/sdb
```

| Device | Partition | Partition type       | Size     |
| :----- | :-------- | :------------------- | :------- |
| 1      | /dev/sda1 | BIOS boot partition  | 1M       |
| 1      | /dev/sda2 | Linux LUKS partition | 100%FREE |
| 2      | /dev/sdb1 | Linux LUKS partition | 100%FREE |

---

## Encrypt the partitions

GRUB does not support LUKS2 headers to unlock encrypted `/boot` partition so you need to specify `--type luks1` on encrypted device that GRUB need to access.

### Create the LUKS1 containers
{: .no_toc .pt-2}

```bash
$ cryptsetup --type luks1 luksFormat /dev/sda2
$ cryptsetup --type luks1 luksFormat /dev/sdb1
```

### Open the containers
{: .no_toc .pt-4}

```bash
$ cryptsetup open /dev/sda2 container1
$ cryptsetup open /dev/sdb1 container2
```

---

## References
{: .no_toc}

### SECURE ERASE
{: .no_toc .text-delta .pt-2}

1. [ArchWiki - Dm-crypt - Drive preparation - Secure erasure of the hard disk drive](https://wiki.archlinux.org/index.php/Dm-crypt/Drive_preparation#Secure_erasure_of_the_hard_disk_drive)

### GPT FDISK
{: .no_toc .text-delta .pt-4}

1. [ArchWiki - GPT fdisk](https://wiki.archlinux.org/index.php/GPT_fdisk)

### MANUALS
{: .no_toc .text-delta .pt-4}

1. [Man page - cryptsetup](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/cryptsetup/cryptsetup.8.en)
1. [Man page - dd](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/coreutils/dd.1.en)
1. [Man page - sgdisk](https://jlk.fjfi.cvut.cz/arch/manpages/man/extra/gptfdisk/sgdisk.8.en)
