---
layout: default
title: Btrfs
permalink: /storage/controller/btrfs/
grand_parent: Storage
parent: Controller
nav_order: 2
---

# Storage Controller with Btrfs

---

## Btrfs for encrypted foundation

### [Btrfs on Luks](/Andromeda/storage/controller/btrfs/btrfs-luks/)
{: .pt-2}

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
