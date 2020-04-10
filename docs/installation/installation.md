---
layout: default
title: Installation
permalink: /installation/
nav_order: 3
has_children: true
has_toc: false
---

# Installation
{: .mb-4}

This part cover the installation of Arch Linux with a Storage volume manager and/or filesystem.
{: .fs-5}

---

## [Logical Volume Manager](/Andromeda/installation/lvm/)

LVM (Logical Volume Manager) allows administrators to create meta devices that provide an abstraction layer between a file system and the physical storage that is used underneath. The meta devices (on which file systems are placed) are logical volumes, which use storage from storage pools called volume groups. A volume group is provisioned with one or more physical volumes which are the true devices on which the data is stored.

---

## [B-tree filesystem](/Andromeda/installation/btrfs/)

Btrfs is a copy-on-write (CoW) filesystem for Linux aimed at implementing advanced features while focusing on fault tolerance, repair, and easy administration. Jointly developed at Oracle, Red Hat, Fujitsu, Intel, SUSE, STRATO, and many others, btrfs is licensed under the GPL and open for contribution from anyone.

---

## [Zfs](/Andromeda/installation/zfs/)

ZFS is a next generation filesystem created by Matthew Ahrens and Jeff Bonwick. It was designed around a few key ideas:

- Administration of storage should be simple.
- Redundancy should be handled by the filesystem.
- File-systems should never be taken offline for repair.
- Automated simulations of worst case scenarios before shipping code is important.
- Data integrity is paramount.

---

## References
