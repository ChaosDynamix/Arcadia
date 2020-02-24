---
layout: default
title: STR3 BTRFS
nav_order: 3
parent: 04 Storage
permalink: /storage/btrfs/
has_toc: false
---

# BTRFS based storage scenarios
{: .no_toc}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

## 1 device

#### [LUKS](/Andromeda/iso-image/)
{: .no_toc .pt-2 .fs-3}

| Partition | Mounting point  | Partition type       | Size     |
| :-------- | :-------------  | :------------------- | :------- |
| /dev/sda1 | /efi            | EFI system partition | 512M     |
| /dev/sda2 |                 | Linux Filesystem     | 100%FREE |
