---
layout: default
title: Uefi with encryption
permalink: /storage/preparation/uefi-with-encryption/
nav_exclude: true
---

# Storage preparation for Uefi with encryption
{: .no_toc}

---

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

## Dm-crypt-Luks

```
+------------------------+---------------------------------------------------+
| EFI system partition   | LUKS1 encrypted partition                         |
| /efi                   | /dev/mapper/container                             |
|                        +---------------------------------------------------+
| /dev/sda1              | /dev/sda2                                         |
+------------------------+---------------------------------------------------+
```

### Partition the drive
{: .no_toc .pt-2}

| Partition | Partition type       | Size     |
| :-------- | :------------------- | :------- |
| /dev/sda1 | EFI system partition | 512M     |
| /dev/sda2 | Linux LUKS partition | 100%FREE |

#### SGDISK SCRIPT
{: .no_toc .pt-2}

```bash
# Edit the sizes accordingly
$ sgdisk -o -n=1:0:+512M -n=2:0:0 -t=1:ef00 -t=2:8309 /dev/sda
```

### Encrypt the partition
{: .no_toc .pt-4}

```bash
# Create the container
$ cryptsetup --type luks1 luksFormat /dev/sda2

# Open the container
$ cryptsetup open /dev/sdXY lvm
```

---

## Dm-crypt-Luks on Raid1

```
Drive 1                                 Drive 2
+------------+-----------------------+  +------------+-----------------------+
| EFI system | LUKS1 encrypted       |  | EFI system | LUKS1 encrypted       |
| partition  | volume                |  | partition  | volume                |
| /efi1      | /dev/mapper/container |  | /efi2      | /dev/mapper/container |
|            +-----------------------+  |            +-----------------------+
|            | RAID1 array (part 1)  |  |            | RAID1 array (part 2)  |
|            | /dev/md/array         |  |            | /dev/md/array         |
|            +-----------------------+  |            +-----------------------+
| /dev/sda1  | /dev/sda2             |  | /dev/sdb1  | /dev/sdb2             |
+------------+-----------------------+  +------------+-----------------------+
```

### Partition the drives
{: .no_toc .pt-2}

| Device | Partition | Partition type       | Size            |
| :----- | :-------- | :------------------- | :-------------- |
| 1      | /dev/sda1 | EFI system partition | 512M            |
| 1      | /dev/sda2 | Linux RAID partition | 100%FREE - 100M |
| 2      | /dev/sdb1 | EFI system partition | 512M            |
| 2      | /dev/sdb2 | Linux RAID partition | 100%FREE - 100M |

#### SGDISK SCRIPT
{: .no_toc .pt-2}

```bash
# Create a new partition table, the partitions and clone the setup to the second drive
$ sgdisk -o -n=1:0:+512M -n=2:0:-100M -t=1:ef00 -t=2:fd00 -R=/dev/sdb /dev/sda

# Create a new partition table for the second drive
$ sgdisk -G /dev/sdb
```

### Create the RAID array
{: .no_toc .pt-4}

```bash
# Create a RAID1 array
$ mdadm --create --level=1 --metadata=1.2 --raid-devices=2 /dev/md/array /dev/sda2 /dev/sdb2

# Check the synchronization of the array
$ watch /proc/mdstat
```

### Encrypt the RAID array
{: .no_toc .pt-4}

```bash
# Create the container
$ cryptsetup --type luks1 luksFormat /dev/md/array

# Open the container
$ cryptsetup open /dev/md/array container
```

---

## Dm-crypt-Plain
