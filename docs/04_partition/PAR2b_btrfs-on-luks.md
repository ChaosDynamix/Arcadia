---
layout: default
title: PAR2b BTRFS on LUKS
grand_parent: 04 Partition
parent: PAR2 Layout
nav_order: 2
permalink: /partition/layout/btrfs/
has_toc: false
---

# Partition layout for BTRFS on LUKS
{: .no_toc}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

#### UEFI/GPT
{: .no_toc .pt-2}

| Partition | Mounting point | Partition type       | Size     |
| :-------- | :------------- | :------------------- | :------- |
| /dev/sda1 |                | EFI system partition | 512M     |
| /dev/sda2 |                | Linux Filesystem     | 100%FREE |

### References
{: .no_toc .text-delta .pt-4}

- [ArchWiki - Dm-crypt/Encrypting an entire system - Btrfs subvolumes with swap](https://wiki.archlinux.org/index.php/Dm-crypt/Encrypting_an_entire_system#Btrfs_subvolumes_with_swap)
