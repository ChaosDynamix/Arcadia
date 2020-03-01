---
layout: default
title: 04 Installation
nav_order: 5
has_children: true
permalink: /installation/
has_toc: false
---

# Installation
{: .d-inline-block .mb-0}

INS
{: .label .mx-2}

---

## [EXT4](/Andromeda/installation/ext4/)
{: .d-inline-block}

UEFI
{: .label .label-purple .ml-2}

```
+------------------+------------------+------------------+------------------+
| EFI system       | Root             | Swap             | Home             |
| partition        | partition        | partition        | partition        |
|                  |                  |                  |                  |
| /boot            | /                | [SWAP]           | /home            |
| /dev/sda1        | /dev/sda2        | /dev/sda3        | /dev/sda4        |
+------------------+------------------+------------------+------------------+
```

---

## [LVM](/Andromeda/installation/lvm/)
{: .d-inline-block}

UEFI
{: .label .label-purple .ml-2}

LUKS
{: .label .label-purple}

EXT4
{: .label .label-purple}

```
+------------------------+--------------------------------------------------+
| EFI system partition   | LUKS1 encrypted partition                        |
| /efi                   | /dev/mapper/lvm                                  |
|                        +--------------------------------------------------+
|                        |                                                  |
| /dev/sda1              | /dev/sda2                                        |
+------------------------+--------------------------------------------------+
```

---

## [LVM with RAID1](/Andromeda/installation/lvm-with-raid1/)
{: .d-inline-block}

UEFI
{: .label .label-purple .ml-2}

LUKS
{: .label .label-purple}

EXT4
{: .label .label-purple}

WORK IN PROGRESS
{: .label .label-yellow}

```
Drive 1                                 Drive 2
+------------+----------------------+   +------------+----------------------+
| EFI system | Logical Volume       |   | EFI system | Logical Volume       |
| partition  | Manager              |   | partition  | Manager              |
|            |                      |   |            |                      |
| /dev/sda1  | /dev/sda2            |   | /dev/sdb1  | /dev/sdb2            |
+------------+----------------------+   +------------+----------------------+
```

---

## [BTRFS](/Andromeda/installation/btrfs/)
{: .d-inline-block}

UEFI
{: .label .label-purple .ml-2}

LUKS
{: .label .label-purple}

WORK IN PROGRESS
{: .label .label-yellow}

```
+------------------------+--------------------------------------------------+
| EFI system partition   | LUKS1 encrypted partition                        |
| /efi                   | /dev/mapper/btrfs                                |
|                        +--------------------------------------------------+
|                        |                                                  |
| /dev/sda1              | /dev/sda2                                        |
+------------------------+--------------------------------------------------+
```

---

## BTRFS with RAID1
{: .d-inline-block}

UEFI
{: .label .label-purple .ml-2}

LUKS
{: .label .label-purple}

WORK IN PROGRESS
{: .label .label-yellow}

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
