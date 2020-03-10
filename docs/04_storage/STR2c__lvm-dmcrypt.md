---
layout: default
title: Lvm-Dmcrypt
permalink: /storage/configuration/lvm-dmcrypt/
nav_exclude: true
---

[Return to Storage configuration](/Andromeda/storage/configuration/){: .btn .btn-purple }

# Storage configuration for Lvm-Dmcrypt
{: .no_toc}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

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
