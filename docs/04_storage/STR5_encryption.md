---
layout: default
title: STR5 Encryption
nav_order: 5
parent: 04 Storage
permalink: /storage/encryption/
has_toc: false
---

# Storage encryption
{: .no_toc}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

## Partition encryption

#### LVM
{: .no_toc .pt-4}

```bash
$ cryptsetup luksFormat /dev/sdXY
$ cryptsetup open /dev/sdXY lvm
```

#### BTRFS
{: .no_toc .pt-4}

```bash
$ cryptsetup --type luks1 luksFormat /dev/sdXY
$ cryptsetup open /dev/sdXY btrfs
```

### References
{: .no_toc .text-delta .pt-4}

- [ArchWiki - LVM on LUKS - Preparing the disk](https://wiki.archlinux.org/index.php/Dm-crypt/Encrypting_an_entire_system#Preparing_the_disk_2)
- [ArchWiki - BTRFS on LUKS - Preparing the system partition](https://wiki.archlinux.org/index.php/Dm-crypt/Encrypting_an_entire_system#Preparing_the_system_partition)

---

## Full disk encryption

#### LVM
{: .no_toc .pt-4}

```bash
$ cryptsetup --cipher=aes-xts-plain64 --offset=0 --key-file=/dev/sdc --key-size=512 open --type plain /dev/sda lvm
```

#### BTRFS
{: .no_toc .pt-4}

```bash
$ cryptsetup --cipher=aes-xts-plain64 --offset=0 --key-file=/dev/sdc --key-size=512 open --type plain /dev/sda btrfs
```

### References
{: .no_toc .text-delta .pt-4}

- [ArchWiki - Full disk encryption - Preparing the non boot partition](https://wiki.archlinux.org/index.php/Dm-crypt/Encrypting_an_entire_system#Preparing_the_non-boot_partitions)
