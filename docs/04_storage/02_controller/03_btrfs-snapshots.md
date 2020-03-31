---
layout: default
title: Btrfs-snapshots
permalink: /storage/controller/btrfs-snapshots/
grand_parent: Storage
parent: Controller
nav_order: 3
---

# Controller / Btrfs with snapshots
{: .no_toc}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

## Setup the EFI partition(s)
{: .d-inline-block}

UEFI
{: .label .label-blue .ml-2}

### Format the partition(s)
{: .no_toc .mt-0}

#### SINGLE PARTITION
{: .no_toc .mt-5}

```bash
$ mkfs.fat -F32 -n EFI /dev/sda1
```

#### MULTIPLE PARTITIONS
{: .no_toc .mt-6}

```bash
$ mkfs.fat -F32 -n EFI /dev/sda1
$ mkfs.fat -F32 -n EFI /dev/sdb1
```

### Mount the partition(s)
{: .no_toc .mt-6}

#### SINGLE PARTITION
{: .no_toc .mt-5}

```bash
$ mkdir /mnt/efi
$ mount /dev/sda1 /mnt/efi
```

#### MULTIPLE PARTITIONS
{: .no_toc .mt-6}

```bash
$ mkdir /mnt/{efi1,efi2}
$ mount /dev/sda1 /mnt/efi1
$ mount /dev/sdb1 /mnt/efi2
```
