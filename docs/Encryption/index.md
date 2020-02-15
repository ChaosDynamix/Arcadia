---
layout: default
title: Encryption
nav_order: 6
permalink: /encryption/
has_children: true
has_toc: false
---

# Encryption

This section cover the encryption setup for LVM or BTRFS.
{: .fs-5}

## Container

### LVM
{: .no_toc}

```bash
cryptsetup luksFormat /dev/sdXY
cryptsetup open /dev/sdXY lvm
```

[Encryption for LVM](/Andromeda/encryption/lvm/){: .btn .btn-purple .d-inline-block .mt-4}

### BTRFS
{: .no_toc}

```bash
cryptsetup --type luks1 luksFormat /dev/sdXY
cryptsetup open /dev/sdXY btrfs
```

[Encryption for BTRFS](/Andromeda/encryption/btrfs/){: .btn .btn-purple .d-inline-block .mt-4}

### References
{: .no_toc .text-delta .pt-5}

- [ArchWiki dm-crypt/Drive preparation - Secure erasure of the hard disk drive](https://wiki.archlinux.org/index.php/Dm-crypt/Drive_preparation#Secure_erasure_of_the_hard_disk_drive)
- [ArchWiki dm-crypt/Encrypting an entire system - LVM on LUKS](https://wiki.archlinux.org/index.php/Dm-crypt/Encrypting_an_entire_system#LVM_on_LUKS)
- [ArchWiki dm-crypt/Encrypting an entire system - Btrfs subvolumes with swap](https://wiki.archlinux.org/index.php/Dm-crypt/Encrypting_an_entire_system#Btrfs_subvolumes_with_swap)
