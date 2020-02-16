---
layout: default
title: PAR_Basic
parent: PAR_Setup
grand_parent: Partition
nav_order: 1
permalink: /partition/setup/basic/
has_toc: false
---

# Partition basic setup
{: .no_toc}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

## Format the partitions

### Ext4 filesystem
{: .no_toc}

```bash
mkfs.ext4 -L ROOT /dev/sdXY
mkfs.ext4 -L HOME /dev/sdXY
```

### EFI filesystem
{: .no_toc}

```bash
mkfs.fat -F32 -n EFI /dev/sdXY
```

### References
{: .no_toc .text-delta .pt-4}

- [ArchWiki - Installation guide - Format the partitions](https://wiki.archlinux.org/index.php/Installation_guide#Format_the_partitions)
- [ArchWiki - EFI system partition](https://wiki.archlinux.org/index.php/EFI_system_partition)

---

## Setup the swap partition

```bash
mkswap -L SWAP /dev/sdXY
swapon /dev/sdXY
```

### References
{: .no_toc .text-delta .pt-4}

- [ArchWiki - Installation guide - Format the partitions](https://wiki.archlinux.org/index.php/Installation_guide#Format_the_partitions)

---

## Mount the file systems

### Root partition
{: .no_toc}

```bash
mount /dev/sdXY /mnt
```

### Home partition
{: .no_toc}

```bash
mkdir /mnt/home
mount /dev/sdXY /mnt/home
```

### EFI partition
{: .no_toc}

```bash
mkdir /mnt/boot
mount /dev/sdXY /mnt/boot
```

### References
{: .no_toc .text-delta .pt-4}

- [ArchWiki - Installation guide - Mount the file systems](https://wiki.archlinux.org/index.php/Installation_guide#Mount_the_file_systems)
- [ArchWiki - EFI system partition](https://wiki.archlinux.org/index.php/EFI_system_partition)
