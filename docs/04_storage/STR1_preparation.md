---
layout: default
title: STR1 Preparation
nav_order: 1
parent: 04 Storage
permalink: /storage/preparation/
has_toc: false
---

# Storage preparation
{: .no_toc}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

## Secure erase

This part is not strictly required but it is very recommended for encryption scenarios.

**Warning : Make appropriate backups of valuable data prior to starting !**

```bash
# Open a container
$ cryptsetup open --type plain -d /dev/urandom /dev/sdX to_be_wiped

# Secure erase the disk
$ dd if=/dev/zero of=/dev/mapper/to_be_wiped status=progress

# Close the container
$ cryptsetup close to_be_wiped
```

### References
{: .no_toc .text-delta .pt-4}

- [ArchWiki dm-crypt/Drive preparation - Secure erasure of the hard disk drive](https://wiki.archlinux.org/index.php/Dm-crypt/Drive_preparation#Secure_erasure_of_the_hard_disk_drive)

---

## Raid

### Erase any old RAID configuration information
{: .no_toc}

```bash
# For a drive
$ mdadm --misc --zero-superblock /dev/<drive>

# For a partition
$ mdadm --misc --zero-superblock /dev/<partition>
```
