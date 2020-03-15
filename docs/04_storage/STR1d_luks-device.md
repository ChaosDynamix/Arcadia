---
layout: default
title: Luks on device
permalink: /storage/foundation/luks-device/
nav_exclude: true
---

[Return to Storage foundation](/Andromeda/storage/foundation/){: .btn .btn-purple }

# Storage foundation for Luks on device
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

## Partition the USB flash device

### UEFI / GPT
{: .no_toc .pt-2}

| Partition | Partition type       | Size     |
| :-------- | :------------------- | :------- |
| /dev/sdb1 | EFI system partition | 260M     |

#### SGDISK SCRIPT
{: .no_toc}

```bash
$ sgdisk -o -n=1:0:+260M -t=1:ef00 /dev/sdb
```

### BIOS / GPT
{: .no_toc .pt-4}

| Partition | Partition type       | Size     |
| :-------- | :------------------- | :------- |
| /dev/sdb1 | BIOS boot partition  | 1M       |

#### SGDISK SCRIPT
{: .no_toc}

```bash
$ sgdisk -o -n=1:0:+1M -t=1:ef02 /dev/sdb
```

---

## Encrypt the device

### Create the header
{: .no_toc .pt-2}

```bash
$ dd if=/dev/zero of=header.img bs=16M count=1
```

### Create the LUKS1 container with detached header
{: .no_toc .pt-4}

The `--offset` option allows specifying the start of encrypted data on a device. By reserving a space at the beginning of device you have the option of later reattaching the LUKS header. The value is specified in 512-byte sectors.

```bash
$ cryptsetup --type luks1 --offset 32768 --header header.img luksFormat /dev/sda
```

### Open the container with the header
{: .no_toc .pt-4}

```bash
$ cryptsetup open --header header.img /dev/sda cryptvolume
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
