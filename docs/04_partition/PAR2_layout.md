---
layout: default
title: PAR2 Layout
nav_order: 2
parent: 04 Partition
permalink: /partition/layout/
has_toc: false
has_children: true
---

# Partition layout
{: .no_toc}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

## Select a recommended SWAP size

A swap partition is not strictly required, but recommended for systems with low RAM. If you want to use hibernation, you will need a swap partition. The following table has recommendations for swap partition size.

| System RAM | Recommended swap space | Swap space if using hibernation |
| :--------- | :--------------------- | :------------------------------ |
| < 2GB      | 2x the amount of RAM   | 3x the amount of RAM            |
| 2 - 8G     | Equal to amount of RAM | 2x the amount of RAM            |
| 8 - 64G    | At least 4GB           | 1.5x the amount of RAM          |
| 64G        | At least 4GB           | Hibernation not recommended     |

### References
{: .no_toc .text-delta .pt-5}

- [VOID Linux Partitions Notes - SWAP partitions](https://docs.voidlinux.org/installation/live-images/partitions.html#swap-partitions)

---

## Select a partition layout

#### UEFI/GPT
{: .no_toc .pt-4}

| Partition | Mounting point | Partition type                | Size     |
| :-------- | :------------- | :---------------------------- | :------- |
| /dev/sda1 | /boot          | EFI system partition          | 260M     |
| /dev/sda2 | /              | Linux Root partition (x86-64) | 23 - 32G |
| /dev/sda3 | [SWAP]         | Linux Swap partition          | > 512M   |
| /dev/sda4 | /home          | Linux Home partition          | 100%FREE |

#### BIOS/GPT
{: .no_toc .pt-4}

A BIOS boot partition is only required when using GRUB for BIOS booting from a GPT disk. The partition has nothing to do with /boot, and it must not be formatted with a file system or mounted.
{: .fs-2 }

| Partition | Mounting point | Partition type                | Size     |
| :-------- | :------------- | :---------------------------- | :------- |
| /dev/sda1 |                | BIOS boot partition           | 1M       |
| /dev/sda2 | /              | Linux Root partition (x86-64) | 23 - 32G |
| /dev/sda3 | [SWAP]         | Linux Swap partition          | > 512M   |
| /dev/sda4 | /home          | Linux Home partition          | 100%FREE |

#### BIOS/MBR
{: .no_toc .pt-4}

| Partition | Mounting point | Partition type            | Size     | Boot flag |
| :-------- | :------------- | :------------------------ | :------- | :-------- |
| /dev/sda1 | /              | Linux Filesystem          | 23 - 32G | yes       |
| /dev/sda2 | [SWAP]         | Linux Swap partition      | > 512M   | No        |
| /dev/sda3 | /home          | Linux Filesystem          | 100%FREE | No        |

### References
{: .no_toc .text-delta .pt-4}

- [ArchWiki Partitioning - Example layouts](https://wiki.archlinux.org/index.php/Partitioning#Example_layouts)
