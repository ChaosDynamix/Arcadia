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

## Basic partition setup

### Format the partitions
{: .no_toc}

#### Ext4 filesystem
{: .no_toc}

```bash
mkfs.ext4 -L ROOT /dev/sdXY
mkfs.ext4 -L HOME /dev/sdXY
```

#### EFI filesystem
{: .no_toc}

```bash
mkfs.fat -F32 -n EFI /dev/sdXY
```

### References
{: .no_toc .text-delta .pt-4}

- [ArchWiki - Installation guide - Format the partitions](https://wiki.archlinux.org/index.php/Installation_guide#Format_the_partitions)
- [ArchWiki - EFI system partition](https://wiki.archlinux.org/index.php/EFI_system_partition)

---

### Setup the swap partition
{: .no_toc}

```bash
mkswap -L SWAP /dev/sdXY
swapon /dev/sdXY
```

### References
{: .no_toc .text-delta .pt-4}

- [ArchWiki - Installation guide - Format the partitions](https://wiki.archlinux.org/index.php/Installation_guide#Format_the_partitions)

---

### Mount the file systems
{: .no_toc}

#### Root partition
{: .no_toc}

```bash
mount /dev/sdXY /mnt
```

#### Home partition
{: .no_toc}

```bash
mkdir /mnt/home
mount /dev/sdXY /mnt/home
```

#### EFI partition
{: .no_toc}

```bash
mkdir /mnt/boot
mount /dev/sdXY /mnt/boot
```

### References
{: .no_toc .text-delta .pt-4}

- [ArchWiki - Installation guide - Mount the file systems](https://wiki.archlinux.org/index.php/Installation_guide#Mount_the_file_systems)
- [ArchWiki - EFI system partition](https://wiki.archlinux.org/index.php/EFI_system_partition)

---

## LVM on LUKS

[LVM on LUKS](/Andromeda/partition/setup/lvm/){: .btn .btn-purple .d-inline-block .mt-4}

---

## BTRFS on LUKS

[BTRFS on LUKS](/Andromeda/partition/setup/btrfs/){: .btn .btn-purple .d-inline-block .mt-4}
