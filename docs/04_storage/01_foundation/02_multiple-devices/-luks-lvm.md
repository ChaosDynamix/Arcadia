---
layout: default
title: Luks on Lvm
permalink: /storage/foundation/multiple-devices/luks-lvm/
nav_exclude: true
---

<ol class="breadcrumb-nav-list" style="padding-left:0; position:relative; top:-17px;">
    <li class="breadcrumb-nav-list-item"><a href="https://chaosdynamix.github.io/Andromeda/storage/">Storage</a></li>
    <li class="breadcrumb-nav-list-item"><a href="https://chaosdynamix.github.io/Andromeda/storage/foundation/">Foundation</a></li>
    <li class="breadcrumb-nav-list-item"><a href="https://chaosdynamix.github.io/Andromeda/storage/foundation/multiple-devices/">Multiple devices</a></li>
    <li class="breadcrumb-nav-list-item"><span>Luks on Lvm</span></li>
</ol>

# [Multiple devices](/Andromeda/storage/foundation/multiple-devices/) / Luks on Lvm
{: .mt-0 .no_toc}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

## Partition the devices

### UEFI / GPT
{: .no_toc .pt-2}

| Device | Partition | Partition type       | Size     |
| :----- | :-------- | :------------------- | :------- |
| 1      | /dev/sda1 | EFI system partition | 260M     |
| 1      | /dev/sda2 | Linux LVM            | 100%FREE |
| 2      | /dev/sdb1 | Linux LVM            | 100%FREE |

#### SGDISK SCRIPT
{: .no_toc}

```bash
$ sgdisk -o -n=1:0:+260M -n=2:0:0 -t=1:ef00 -t=2:8e00 /dev/sda
$ sgdisk -o -n=1:0:0 -t=1:8e00 /dev/sdb
```

### BIOS / GPT
{: .no_toc .pt-4}

| Device | Partition | Partition type       | Size     |
| :----- | :-------- | :------------------- | :------- |
| 1      | /dev/sda1 | BIOS boot partition  | 1M       |
| 1      | /dev/sda2 | Linux LVM            | 100%FREE |
| 2      | /dev/sdb1 | Linux LVM            | 100%FREE |

#### SGDISK SCRIPT
{: .no_toc}

```bash
$ sgdisk -o -n=1:0:+1M -n=2:0:0 -t=1:ef02 -t=2:8e00 /dev/sda
$ sgdisk -o -n=1:0:0 -t=1:8e00 /dev/sdb
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
