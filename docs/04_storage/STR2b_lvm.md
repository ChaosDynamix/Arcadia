---
layout: default
title: Lvm
permalink: /storage/file-system/lvm/
parent: File system
grand_parent: Storage
nav_order: 2
---

# Storage Lvm file system
{: .no_toc}

---

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

## Default

```
+--------------------------------------------------------------------------+
|                             Physical volume                              |
|                             /dev/mapper/lvm                              |
+--------------------------------------------------------------------------+
|                              Group volume                                |
|                                /dev/grp/                                 |
+------------------------+------------------------+------------------------+
| Logical volume 1       | Logical volume 2       | Logical volume 3       |
| [SWAP]                 | /                      | /home                  |
| /dev/grp/swap          | /dev/grp/root          | /dev/grp/home          |
+------------------------+------------------------+------------------------+
```

---

## Dm-crypt on Lvm

```
+--------------------------------------------------------------------------+
|                             Physical volume                              |
|                           /dev/sda2 /dev/sdb2                            |
+--------------------------------------------------------------------------+
|                               Group volume                               |
|                                 /dev/grp/                                |
+------------------------+----------------------- +------------------------+
| Logical volume 1       | Logical volume 2       | Logical volume 3       |
| /dev/grp/cryptswap     | /dev/grp/cryptroot     | /dev/grp/crypthome     |
+------------------------+----------------------- +------------------------+
| Encrypted volume       | LUKS1 encrypted volume | LUKS1 encrypted volume |
| [SWAP]                 | /                      | /home                  |
| /dev/mapper/swap       | /dev/mapper/root       | /dev/mapper/home       |
+------------------------+----------------------- +------------------------+
```
