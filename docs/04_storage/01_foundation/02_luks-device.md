---
layout: default
title: Luks-device
permalink: /storage/foundation/luks-device/
grand_parent: Storage
parent: Foundation
nav_order: 2
---

# Single device / Luks on device
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

### Create the temporary encrypted container
{: .no_toc .pt-2}

```bash
$ cryptsetup open --type plain -d /dev/urandom /dev/sda to_be_wiped
```

### Wipe the container with zeros
{: .no_toc .pt-4}


```bash
$ dd if=/dev/zero of=/dev/mapper/to_be_wiped status=progress
```

### Close the temporary container
{: .no_toc .pt-4}

```bash
$ cryptsetup close to_be_wiped
```

---

## Encrypt the device

GRUB does not support LUKS2 headers to unlock encrypted `/boot` partition so you need to specify `--type luks1` on encrypted device that GRUB need to access.

### Create the header
{: .no_toc}

```bash
$ dd if=/dev/zero of=header.img bs=16M count=1
```

### Create the LUKS1 container with detached header
{: .no_toc .mt-6}

```bash
$ cryptsetup --type luks1 luksFormat /dev/sda --offset 32768 --header header.img
```

The `--offset` option allows specifying the start of encrypted data on a device. By reserving a space at the beginning of device you have the option of later reattaching the LUKS header. The value is specified in 512-byte sectors.

### Open the container
{: .no_toc .mt-6}

```bash
$ cryptsetup open --header header.img /dev/sda container
```

---

## Partition the USB flash device

#### UEFI / GPT
{: .no_toc .text-delta}

```bash
$ sgdisk -o -n=1:0:+260M -n=2:0:0 -t=1:ef00 -t=2:8300 /dev/sdb
```

| Partition | Partition type       | Size     |
| :-------- | :------------------- | :------- |
| /dev/sdb1 | EFI system partition | 260M     |
| /dev/sdb2 | Linux filesystem     | 100%FREE |

#### BIOS / GPT
{: .no_toc .text-delta .mt-6}

```bash
$ sgdisk -o -n=1:0:+1M -n=2:0:0 -t=1:ef02 -t=2:8300 /dev/sdb
```

| Partition | Partition type       | Size     |
| :-------- | :------------------- | :------- |
| /dev/sdb1 | BIOS boot partition  | 1M       |
| /dev/sdb2 | Linux filesystem     | 100%FREE |

---

## References
{: .no_toc}
