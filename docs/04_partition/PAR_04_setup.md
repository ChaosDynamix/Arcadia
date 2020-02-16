---
layout: default
title: PAR_Setup
nav_order: 4
parent: Partition
permalink: /partition/setup/
has_toc: false
has_children: true
---

# Partition setup
{: .no_toc}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

## Select a scenario

### Basic
{: .no_toc}

#### UEFI/GPT
{: .no_toc}

```
+----------------------+----------------------+------------+------------+
| EFI system partition | Linux root (x86-64)  | Linux swap | Linux home |
|                      |                      |            |            |
| /efi                 | /                    |            | /home      |
| /dev/sda1            | /dev/sda2            | /dev/sda3  | /dev/sda4  |
|----------------------+----------------------+------------+------------+
```

[Basic scenario](/Andromeda/encryption/lvm/){: .btn .btn-purple .d-inline-block .mt-4}

---

### LVM on LUKS
{: .no_toc}

#### UEFI/GPT
{: .no_toc}
```
+-----------------------------------------------------------------------+ +----------------+
| Logical volume 1      | Logical volume 2      | Logical volume 3      | | Boot partition |
|                       |                       |                       | |                |
| [SWAP]                | /                     | /home                 | | /boot          |
|                       |                       |                       | |                |
| /dev/MyVolGroup/swap  | /dev/MyVolGroup/root  | /dev/MyVolGroup/home  | |                |
|_ _ _ _ _ _ _ _ _ _ _ _|_ _ _ _ _ _ _ _ _ _ _ _|_ _ _ _ _ _ _ _ _ _ _ _| | (may be on     |
|                                                                       | | other device)  |
|                         LUKS2 encrypted partition                     | |                |
|                           /dev/sda1                                   | | /dev/sdb1      |
+-----------------------------------------------------------------------+ +----------------+
```

[LVM on LUKS](/Andromeda/encryption/lvm/){: .btn .btn-purple .d-inline-block .mt-4}

---

### BTRFS on LUKS
{: .no_toc}

#### UEFI/GPT
{: .no_toc}
```
+----------------------+----------------------+
| EFI system partition | System partition     |
| unencrypted          | LUKS1-encrypted      |
|                      |                      |
| /efi                 | /                    |
| /dev/sda1            | /dev/sda2            |
|----------------------+----------------------+
```

[BTRFS on LUKS](/Andromeda/encryption/btrfs/){: .btn .btn-purple .d-inline-block .mt-4}
