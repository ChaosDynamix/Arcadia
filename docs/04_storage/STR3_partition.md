---
layout: default
title: STR3 Partition
nav_order: 3
parent: 04 Storage
permalink: /storage/partition/
has_toc: false
---

# Storage partition
{: .no_toc}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

## Linux Partition types

### Master Boot Record (MBR)
{: .no_toc}

| Partition id | Description                        |
| :----------- | :--------------------------------- |
| 82h          | Linux Swap partition               |
| 83h          | Linux file system                  |
| 8Eh          | Linux Logical Volume Manager (LVM) |
| E8h          | Linux Unified Key Setup (LUKS)     |
| FDh          | Linux RAID                         |

### Guid Partition Table (GPT)
{: .no_toc}

| Partition guid                       | Description                        |
| :----------------------------------- | :--------------------------------- |
| C12A7328-F81F-11D2-BA4B-00A0C93EC93B | EFI System partition               |
| 21686148-6449-6E6F-744E-656564454649 | BIOS boot partition                |
| 0FC63DAF-8483-4772-8E79-3D69D8477DE4 | Linux Filesystem                   |
| 4F68BCE3-E8CD-4DB1-96E7-FBCAF984B709 | Linux Root partition (x86-64)      |
| BC13C2FF-59E6-4262-A352-B275FD6F7172 | Linux Boot partition               |
| 0657FD6D-A4AB-43C4-84E5-0933C84B4F4F | Linux Swap partition               |
| E6D6D379-F507-44C2-A23C-238F2A3DF928 | Linux Logical Volume Manager (LVM) |
| 933AC7E1-2EB4-4F13-B844-0E14E2AEF915 | Linux Home partition               |
| CA7D7CCB-63ED-4C53-861C-1742536059CC | Linux Unified Key Setup (LUKS)     |
| 7FFEC5C9-2D00-49B7-8941-3EA10A5586B7 | Linux Plain dm-crypt partition     |
| A19D880F-05FC-4D3B-A006-743F0F84911E | Linux RAID partition               |

### References
{: .no_toc .text-delta .pt-4}

- [Wikipedia - Partition type](https://en.wikipedia.org/wiki/Partition_type)
- [Wikipedia - GUID partition table](https://en.wikipedia.org/wiki/GUID_Partition_Table)

---

## With fdisk

fdisk is a dialog-driven program for creation and manipulation of partition tables. It understands GPT, MBR, Sun, SGI and BSD partition tables.

### Open fdisk
{: .no_toc}

```bash
$ fdisk /dev/sdX
```

### Create a partition table
{: .no_toc .pt-2}

| Command | Action                                 |
| :------ | :------------------------------------- |
| g       | Create a new empty GPT partition table |
| o       | Create a new empty MBR partition table |

### Create a partition
{: .no_toc .pt-2}

| Command | Action              |
| :------ | :------------------ |
| n       | Add a new partition |
| d       | Delete a partition  |

### Change the partition type
{: .no_toc .pt-2}

| Command        | Action                                            |
| :------------- | :------------------------------------------------ |
| l              | List the partition types for your partition table |
| t              | Change a partition type                           |

### Save & exit
{: .no_toc .pt-2}

| Command        | Action                       |
| :------------- | :--------------------------- |
| w              | Write table to disk and exit |
| q              | Quit without saving changes  |

### References
{: .no_toc .text-delta .pt-4}

- [ArchWiki - fdisk](https://wiki.archlinux.org/index.php/Fdisk)
