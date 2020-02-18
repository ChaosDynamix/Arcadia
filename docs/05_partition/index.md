---
layout: default
title: 05 Partition
nav_order: 6
has_children: true
has_toc: false
permalink: /partition/
---

# Partition
{: .d-inline-block}

PAR
{: .label .mx-2}

This section cover the configuration of the storage space.
{: .fs-5}

## Steps
{: .text-delta}

1. [Table](/Andromeda/partition/table/)
1. [Layout](/Andromeda/partition/layout/)
1. [Creation](/Andromeda/partition/creation/)
1. [Setup](/Andromeda/partition/setup/)
  - [LVM on LUKS](/Andromeda/partition/setup/lvm/)
  - [BTRFS on LUKS](/Andromeda/partition/setup/btrfs/)

---

## Requirement

This part is not strictly required but is very recommended for encryption.

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
{: .no_toc .text-delta .pt-5}

- [ArchWiki dm-crypt/Drive preparation - Secure erasure of the hard disk drive](https://wiki.archlinux.org/index.php/Dm-crypt/Drive_preparation#Secure_erasure_of_the_hard_disk_drive)
