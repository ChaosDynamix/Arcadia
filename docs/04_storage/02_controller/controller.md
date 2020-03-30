---
layout: default
title: Controller
permalink: /storage/controller/
parent: Storage
nav_order: 2
has_children: true
has_toc: false
---

# Storage / Controller
{: .no_toc}

## Scenarios
{: .no_toc .text-delta}

1. TOC
{:toc}

---

## Logical Volume Manager (LVM)

### [Lvm with snapshots](/Andromeda/storage/controller/lvm-snapshots/)

Lvm with snapshots allows you to take a snapshot of your system in a much more efficient way than a traditional backup. It does this efficiently by using a COW (copy-on-write) policy.

The initial snapshot you take simply contains hard-links to the inodes of your actual data. So long as your data remains unchanged, the snapshot merely contains its inode pointers and not the data itself.

Whenever you modify a file or directory that the snapshot points to, LVM automatically clones the data, the old copy referenced by the snapshot, and the new copy referenced by your active system.

```
Physical volume
    ├── Group volume (GRP)
    |     ├── Logical volume (ROOT)
    |     ├── Logical volume (SWAP)
    |     ├── Logical volume (VAR)
    |     ├── Logical volume (HOME)
    |     ├── Logical volume (SNAPSHOTS)
```

### [Lvm with encrypted volumes](/Andromeda/storage/controller/lvm-encrypted-volumes/)
{: .mt-6 .d-inline-block}

LVM ON MULTIPLE PARTITIONS
{: .label .label-blue .ml-2}

Lvm with encrypted volumes use dm-crypt on the volumes itself instead of the partitions. The Swap volume is encrypted with PLAIN mode and the ROOT/HOME volumes with LUKS1 mode.

```
Physical volume
    ├── Group volume (GRP)
    |     ├── Logical volume (CRYPTROOT)
    |     ├── Logical volume (CRYPTSWAP)      
    |     ├── Logical volume (CRYPTHOME)
```

---

## B-tree filesystem (BTRFS)

---

## References
{: .no_toc}
