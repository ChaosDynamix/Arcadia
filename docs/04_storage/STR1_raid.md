---
layout: default
title: STR1 RAID
nav_order: 1
parent: 04 Storage
permalink: /storage/raid/
has_toc: false
---

# RAID based storage scenarios
{: .no_toc}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

## 2 devices

#### [RAID1](/Andromeda/iso-image/)
{: .no_toc .pt-2 .fs-3}

| Device | Partition | Partition type       | Size            |
| :----- | :-------- | :------------------- | :-------------- |
| 1      | /dev/sda1 | EFI system partition | 512M            |
| 1      | /dev/sda2 | Linux RAID partition | 100%FREE - 100M |
| 2      | /dev/sdb1 | EFI system partition | 512M            |
| 2      | /dev/sdb2 | Linux RAID partition | 100%FREE - 100M |
