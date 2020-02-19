---
layout: default
title: PAR3 Creation
nav_order: 3
parent: 04 Partition
permalink: /partition/creation/
has_toc: false
---

# Partition creation
{: .no_toc}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

## With Fdisk

fdisk is a dialog-driven program for creation and manipulation of partition tables. It understands GPT, MBR, Sun, SGI and BSD partition tables.

### Open fdisk
{: .no_toc .pt-4}

```bash
# Rename /dev/sdX
$ fdisk /dev/sdX
```

---

### Create a partition table
{: .no_toc}

| Shortcut       | Description                                   |
| :------------- | :-------------------------------------------- |
| g              | Create a new empty GPT partition table        |
| o              | Create a new empty DOS/MBR partition table    |

#### Example
{: .no_toc}

```
Command (m for help): g
Created a new GPT disklabel (GUID: 00000000-0000-0000-0000-000000000000).
```

---

### Create a partition
{: .no_toc}

| Shortcut       | Description                                  |
| :------------- | :------------------------------------------- |
| d              | Delete a partition                           |
| n              | Add a new partition                          |

#### Example
{: .no_toc}

```
Command (m for help): n
Partition number (1-128, default 1): ~>
First sector (2048-SIZE, default 2048): ~>
Last sector, +/-sectors or +/-size{K,M,G,T,P} {2048-SIZE, default SIZE}: +512M

Created a new partition 1 of type 'Linux' filesystem' and of size 512 MiB
```

---

### Change the partition type
{: .no_toc}

| Shortcut       | Description                                  |
| :------------- | :------------------------------------------- |
| l              | List known partition types                   |
| t              | Change a partition type                      |

#### Example
{: .no_toc}

```
Command (m for help): t
Partition number (1,2,3,4, default 4): 1
Partition type (type L to list all types): 1

Changed type of partition 'Linux filesystem' to 'EFI system'
```

---

### Save & exit
{: .no_toc}

| Shortcut       | Description                                  |
| :------------- | :------------------------------------------- |
| w              | Write table to disk and exit                 |
| q              | Quit without saving changes                  |
