---
layout: default
title: Luks on single partition
permalink: /storage/foundation/luks-single-partition/
nav_exclude: true
---

[Return to Storage foundation](/Andromeda/storage/foundation/){: .btn .btn-purple }

# Storage foundation for Luks on single partition
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

### Open a dm-crypt container with Plain mode
{: .no_toc .pt-2}

```bash
$ cryptsetup open --type plain -d /dev/urandom /dev/sda erased_device
```

### Secure erase the device with dd
{: .no_toc .pt-4}


```bash
$ dd if=/dev/zero of=/dev/mapper/erased_device status=progress
```

### Close the container
{: .no_toc .pt-4}

```bash
$ cryptsetup close erased_device
```

---

## Partition the device

### UEFI / GPT
{: .no_toc .pt-2}

| Partition | Partition type       | Size     |
| :-------- | :------------------- | :------- |
| /dev/sda1 | EFI system partition | 260M     |
| /dev/sda2 | Linux LUKS partition | 100%FREE |

#### SGDISK SCRIPT
{: .no_toc}

```bash
$ sgdisk -o -n=1:0:+260M -n=2:0:0 -t=1:ef00 -t=2:8309 /dev/sda
```

### BIOS / GPT
{: .no_toc .pt-4}

| Partition | Partition type       | Size     |
| :-------- | :------------------- | :------- |
| /dev/sda1 | BIOS boot partition  | 1M       |
| /dev/sda2 | Linux LUKS partition | 100%FREE |

#### SGDISK SCRIPT
{: .no_toc}

```bash
$ sgdisk -o -n=1:0:+1M -n=2:0:0 -t=1:ef02 -t=2:8309 /dev/sda
```

---

## Encrypt the partition

### Create the LUKS1 container
{: .no_toc .pt-2}

```bash
$ cryptsetup --type luks1 luksFormat /dev/sda2
```

### Open the container
{: .no_toc .pt-4}

```bash
$ cryptsetup open /dev/sda2 cryptvolume
```

---

## References

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
