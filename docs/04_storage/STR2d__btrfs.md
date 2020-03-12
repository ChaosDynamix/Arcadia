---
layout: default
title: Btrfs
permalink: /storage/controller/btrfs/
nav_exclude: true
---

[Return to Storage configuration](/Andromeda/storage/controller/){: .btn .btn-purple }

# Storage controller with Btrfs
{: .no_toc}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

```
subvolid=5 (/dev/mapper/btrfs)
   |
   ├── @ (mounted as /)
   |       |
   |       ├── /home                  (mounted @home subvolume)
   |       ├── /.snapshots            (mounted @snapshots subvolume)
   |       ├── /.swap                 (mounted @swap subvolume)
   |       |
   |       ├── /var/cache/pacman/pkg  (nested subvolume)
   |       ├── /var/abs               (nested subvolume)
   |       ├── /var/tmp               (nested subvolume)
   |       ├── /srv                   (nested subvolume)
   |       |
   ├── @home (mounted as /home)
   ├── @snapshots (mounted as /.snapshots)
   └── @swap (mounted as /.swap)
```

---

## Create the Swap file
{: .d-inline-block}

BTRFS
{: .label .ml-2}

```bash
$ truncate -s 0 /.swap/swapfile
$ chattr +C /.swap/swapfile
$ btrfs property set /.swap/swapfile compression none

$ fallocate -l 2G /.swap/swapfile
$ chmod 600 /.swap/swapfile
```

### Format the Swap file
{: .no_toc .pt-4}

```bash
$ mkswap /.swap/swapfile
```

### Activate the Swap file
{: .no_toc .pt-4}

```bash
$ swapon /.swap/swapfile
```
