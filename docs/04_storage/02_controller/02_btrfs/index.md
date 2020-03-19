---
layout: default
title: Btrfs
permalink: /storage/controller/btrfs/
grand_parent: Storage
parent: Controller
nav_order: 2
---

# Storage Controller with Btrfs
{: .no_toc}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

### [Btrfs on Luks](/Andromeda/storage/controller/btrfs/btrfs-luks/)
{: .no_toc .pt-2}

```
subvolid=5
   ├── @ (mounted as /)
   |       ├── /home                  (mounted @home subvolume)
   |       ├── /.snapshots            (mounted @snapshots subvolume)
   |       ├── /.swap                 (mounted @swap subvolume)
   |       |
   |       ├── /var/cache/pacman/pkg  (nested subvolume)
   |       ├── /var/abs               (nested subvolume)
   |       ├── /var/tmp               (nested subvolume)
   |       ├── /srv                   (nested subvolume)
   ├── @home (mounted as /home)
   ├── @snapshots (mounted as /.snapshots)
   └── @swap (mounted as /.swap)
```
