---
layout: default
title: PAR2a LVM on LUKS
grand_parent: 04 Partition
parent: PAR2 Layout
nav_order: 1
permalink: /partition/layout/lvm/
has_toc: false
---

# Partition layout for LVM on LUKS
{: .no_toc}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

## Layout

#### UEFI/GPT
{: .no_toc .pt-2}

| Partition | Mounting point | Partition type                     | Size     |
| :-------- | :------------- | :--------------------------------- | :------- |
| /dev/sda1 |                | Linux Logical Volume Manager (LVM) | 100%FREE |
| /dev/sda2 | /boot          | EFI system partition               | 512M     |


### References
{: .no_toc .text-delta .pt-4}

- [ArchWiki - Dm-crypt/Encrypting an entire system - LVM on LUKS](https://wiki.archlinux.org/index.php/Dm-crypt/Encrypting_an_entire_system#LVM_on_LUKS)

---

## Logical volumes

```
+-----------------------------------------------------------------------+ +----------------+
| Logical volume 1      | Logical volume 2      | Logical volume 3      | | Boot partition |
|                       |                       |                       | |                |
| [SWAP]                | /                     | /home                 | | /boot          |
| /dev/MyVolGroup/swap  | /dev/MyVolGroup/root  | /dev/MyVolGroup/home  | |                |
|_ _ _ _ _ _ _ _ _ _ _ _|_ _ _ _ _ _ _ _ _ _ _ _|_ _ _ _ _ _ _ _ _ _ _ _| |                |
|                       LUKS2 encrypted partition                       | |                |
|                              /dev/sda1                                | |   /dev/sda2    |
+-----------------------------------------------------------------------+ +----------------+
```
