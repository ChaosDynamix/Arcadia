---
layout: default
title: Uefi-Raid1-Luks
permalink: /storage/base/uefi-raid1-luks/
nav_exclude: true
---

[Return to Storage preparation](/Andromeda/storage/base/){: .btn .btn-purple }

# Storage base for Uefi-Raid1-Luks
{: .no_toc}

---

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

```
Drive 1                           Drive 2
+------------+-----------------+  +------------+-----------------+
| EFI system | LUKS1 encrypted |  | EFI system | LUKS1 encrypted |
| partition  | volume          |  | partition  | volume          |
|            +-----------------+  |            +-----------------+
|            | RAID1 array     |  |            | RAID1 array     |
|            +-----------------+  |            +-----------------+
| /dev/sda1  | /dev/sda2       |  | /dev/sdb1  | /dev/sdb2       |
+------------+-----------------+  +------------+-----------------+
```

---

## Secure erase the drives
{: .d-inline-block}

IRREVERSIBLE DATA ERASE
{: .label .label-red .mx-2}

Before setting up disk encryption on a (part of a) disk, consider securely wiping it first. This consists of overwriting the entire drive or partition with a stream of zero bytes or random bytes, and is done for one or both of the following reasons

- Prevent recovery of previously stored data
- Prevent disclosure of usage patterns on the encrypted drive

```bash
# Open the containers
$ cryptsetup open --type plain -d /dev/urandom /dev/sda erase_drive1
$ cryptsetup open --type plain -d /dev/urandom /dev/sdb erase_drive2

# Secure erase the drives
$ dd if=/dev/zero of=/dev/mapper/erase_drive1 status=progress
$ dd if=/dev/zero of=/dev/mapper/erase_drive2 status=progress

# Close the containers
$ cryptsetup close erase_drive1
$ cryptsetup close erase_drive2
```

---

## Partition the drives

| Device | Partition | Partition type       | Size            |
| :----- | :-------- | :------------------- | :-------------- |
| 1      | /dev/sda1 | EFI system partition | 512M            |
| 1      | /dev/sda2 | Linux RAID partition | 100%FREE - 100M |
| 2      | /dev/sdb1 | EFI system partition | 512M            |
| 2      | /dev/sdb2 | Linux RAID partition | 100%FREE - 100M |

### With sgdisk
{: .no_toc .pt-4}

```bash
# Create a new partition table, the partitions and clone the setup to the second drive
$ sgdisk -o -n=1:0:+512M -n=2:0:-100M -t=1:ef00 -t=2:fd00 -R=/dev/sdb /dev/sda

# Create a new partition GUID(s) for the second drive
$ sgdisk -G /dev/sdb
```

---

## Create the RAID array

```bash
# Create a RAID1 array
$ mdadm --create --level=1 --metadata=1.2 --raid-devices=2 /dev/md/array /dev/sda2 /dev/sdb2

# Check the synchronization of the array
$ watch /proc/mdstat
```

---

## Encrypt the RAID array

```bash
# Create the container
$ cryptsetup --type luks1 luksFormat /dev/md/array

# Open the container
$ cryptsetup open /dev/md/array container
```

---
