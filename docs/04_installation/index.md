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

## [Ext4](/Andromeda/installation/ext4/)
{: .d-inline-block}

UEFI
{: .label .label-purple .ml-2}

```
+------------------+------------------+------------------+-----------------+
| EFI system       | Root             | Swap             | Home            |
| partition        | partition        | partition        | partition       |
|                  |                  |                  |                 |
| /boot            | /                | [SWAP]           | /home           |
| /dev/sda1        | /dev/sda2        | /dev/sda3        | /dev/sda4       |
+------------------+------------------+------------------+-----------------+
```

---

## [Luks / Lvm](/Andromeda/installation/luks-lvm/)
{: .d-inline-block}

UEFI
{: .label .label-purple .ml-2}

```
+------------------------+-------------------------------------------------+
| EFI system partition   | LUKS1 encrypted partition                       |
| /efi                   | /dev/mapper/lvm                                 |
|                        +-------------------------------------------------+
| /dev/sda1              | /dev/sda2                                       |
+------------------------+-------------------------------------------------+
```

---

## [Luks / Btrfs](/Andromeda/installation/luks-btrfs/)
{: .d-inline-block}

UEFI
{: .label .label-purple .ml-2}

```
+------------------------+-------------------------------------------------+
| EFI system partition   | LUKS1 encrypted partition                       |
| /efi                   | /dev/mapper/btrfs                               |
|                        +-------------------------------------------------+
| /dev/sda1              | /dev/sda2                                       |
+------------------------+-------------------------------------------------+
```

---

## [Raid1 / Luks / Lvm](/Andromeda/installation/raid1-luks-lvm/)
{: .d-inline-block}

UEFI
{: .label .label-purple .ml-2}

WORK IN PROGRESS
{: .label .label-yellow}

```
Drive 1                                Drive 2
+------------+----------------------+  +------------+----------------------+
| EFI system | LUKS1 encrypted      |  | EFI system | LUKS1 encrypted      |
| partition  | volume               |  | partition  | volume               |
| /efi1      | /dev/mapper/lvm      |  | /efi2      | /dev/mapper/lvm      |
|            +----------------------+  |            +----------------------+
|            | RAID1 array (part 1) |  |            | RAID1 array (part 2) |
|            | /dev/md/cryptlvm     |  |            | /dev/md/cryptlvm     |
|            +----------------------+  |            +----------------------+
| /dev/sda1  | /dev/sda2            |  | /dev/sdb1  | /dev/sdb2            |
+------------+----------------------+  +------------+----------------------+
```

---

## [Raid1 / Luks / Btrfs](/Andromeda/installation/raid1-luks-btrfs/)
{: .d-inline-block}

UEFI
{: .label .label-purple .ml-2}

WORK IN PROGRESS
{: .label .label-yellow}

```
Drive 1                                Drive 2
+------------+----------------------+  +------------+----------------------+
| EFI system | LUKS1 encrypted      |  | EFI system | LUKS1 encrypted      |
| partition  | volume               |  | partition  | volume               |
| /efi1      | /dev/mapper/btrfs    |  | /efi2      | /dev/mapper/btrfs    |
|            +----------------------+  |            +----------------------+
|            | RAID1 array (part 1) |  |            | RAID1 array (part 2) |
|            | /dev/md/cryptbtrfs   |  |            | /dev/md/cryptbtrfs   |
|            +----------------------+  |            +----------------------+
| /dev/sda1  | /dev/sda2            |  | /dev/sdb1  | /dev/sdb2            |
+------------+----------------------+  +------------+----------------------+
```
