---
layout: default
title: Uefi-Btrfs
permalink: /storage/base/uefi-btrfs/
nav_exclude: true
---

[Return to Storage preparation](/Andromeda/storage/base/){: .btn .btn-purple }

# Storage base for Uefi-Btrfs
{: .no_toc}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

```
+------------------------+----------------------------------------------+
| EFI system partition   | Btrfs partition                              |
| /dev/sda1              | /dev/sda2                                    |
+------------------------+----------------------------------------------+
```

---

## Partition the drive

| Partition | Partition type       | Size     |
| :-------- | :------------------- | :------- |
| /dev/sda1 | EFI system partition | 260M     |
| /dev/sda2 | Linux Filesystem     | 100%FREE |

### With sgdisk
{: .no_toc .pt-4}

```bash
$ sgdisk -o -n=1:0:+260M -n=2:0:0 -t=1:ef00 -t=2:8300 /dev/sda
```
