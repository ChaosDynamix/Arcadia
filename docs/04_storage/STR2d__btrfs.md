---
layout: default
title: Btrfs
permalink: /storage/configuration/btrfs/
nav_exclude: true
---

[Return to Storage configuration](/Andromeda/storage/configuration/){: .btn .btn-purple }

# Storage configuration for Btrfs
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
