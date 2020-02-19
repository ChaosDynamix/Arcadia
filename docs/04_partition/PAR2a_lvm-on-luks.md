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

#### UEFI/GPT
{: .no_toc .pt-2}

| Partition | Mounting point | Partition type            | Size     |
| :-------- | :------------- | :------------------------ | :------- |
| /dev/sda1 | /boot          | 01 - EFI system partition | 512M     |
| /dev/sda2 | -              | 31 - Linux LVM            | 100%FREE |

### References
{: .no_toc .text-delta .pt-4}

- [ArchWiki - Dm-crypt/Encrypting an entire system - LVM on LUKS](https://wiki.archlinux.org/index.php/Dm-crypt/Encrypting_an_entire_system#LVM_on_LUKS)
