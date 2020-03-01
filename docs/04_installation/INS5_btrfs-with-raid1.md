---
layout: default
title: Btrfs with Raid1
nav_order: 5
parent: 04 Installation
permalink: /installation/btrfs-with-raid1/
has_toc: false
---

# Installation for BTRFS with RAID1
{: .no_toc}

---

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

```
Drive 1                                 Drive 2
+------------+----------------------+   +------------+----------------------+
| EFI system | LUKS1 encrypted      |   | EFI system | LUKS1 encrypted      |
| partition  | partition            |   | partition  | partition            |
|            | /dev/mapper/btrfs1   |   |            | /dev/mapper/btrfs2   |
|            +----------------------+   |            +----------------------+
| /dev/sda1  | /dev/sda2            |   | /dev/sdb1  | /dev/sdb2            |
+------------+----------------------+   +------------+----------------------+
```
