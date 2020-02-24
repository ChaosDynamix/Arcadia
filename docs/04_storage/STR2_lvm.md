---
layout: default
title: STR2 LVM
nav_order: 2
parent: 04 Storage
permalink: /storage/lvm/
has_toc: false
---

# LVM based storage scenarios
{: .no_toc}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

## 1 device

#### [LUKS](/Andromeda/iso-image/)
{: .no_toc .pt-2 .fs-3}

| Partition | Mounting point  | Partition type                     | Size     |
| :-------- | :-------------  | :--------------------------------- | :------- |
| /dev/sda1 | /efi            | EFI system partition               | 512M     |
| /dev/sda2 |                 | Linux Logical Volume Manager (LVM) | 100%FREE |
