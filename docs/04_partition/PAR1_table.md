---
layout: default
title: PAR1 Table
nav_order: 1
parent: 04 Partition
permalink: /partition/table/
has_toc: false
---

# Partition table
{: .no_toc}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

## Master Boot Record (MBR)

### Partition types
{: .no_toc}

| Partition id | Description                        |
| :----------- | :--------------------------------- |
| 82h          | Linux Swap partition               |
| 83h          | Linux file system                  |
| 8Eh          | Linux Logical Volume Manager (LVM) |
| E8h          | Linux Unified Key Setup (LUKS)     |
| FDh          | Linux RAID                         |

The other linux partition types have been ommited because there are not used in this guide.
{: .fs-2}

### References
{: .no_toc .text-delta .pt-4}

- [Wikipedia - Partition type](https://en.wikipedia.org/wiki/Partition_type)

---

## Guid Partition Table (GPT)

### Partition types
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

The other linux partition types have been ommited because there are not used in this guide.
{: .fs-2}

### References
{: .no_toc .text-delta .pt-4}

- [Wikipedia - GUID partition table](https://en.wikipedia.org/wiki/GUID_Partition_Table)

---
