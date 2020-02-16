---
layout: default
title: PAR4b BTRFS on LUKS
nav_exclude: true
permalink: /partition/setup/btrfs/
has_toc: false
---

# Partition setup for BTRFS on LUKS
{: .no_toc}

[Return to Partition setup](/Andromeda/partition/setup/){: .btn .btn-purple .d-inline-block .mt-4}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

## Create the container
```bash
cryptsetup --type luks1 luksFormat /dev/sdXY
cryptsetup open /dev/sdXY btrfs
```

## Setup mapped device
```bash
mkfs.btrfs -L btrfs /dev/mapper/btrfs
mount -o compress=zstd /dev/mapper/btrfs /mnt
```

## Create top-level subvolumes
```bash
btrfs subvolume create /mnt/@
btrfs subvolume create /mnt/@home
btrfs subvolume create /mnt/@snapshots
btrfs subvolume create /mnt/@swap
```

## Mount top-level subvolumes
```bash
mkdir /mnt/{home,.snapshots,.swap}
umount /dev/mapper/btrfs /mnt

mount -o compress=zstd,subvol=@ /dev/mapper/btrfs /mnt
mount -o compress=zstd,subvol=@home /dev/mapper/btrfs /mnt/home
mount -o compress=zstd,subvol=@snapshots /dev/mapper/btrfs /mnt/.snapshots
mount -o compress=zstd,subvol=@swap /dev/mapper/btrfs /mnt/.swap
```

## Create nested subvolumes
```bash
mkdir -p /mnt/var/cache/pacman

btrfs subvolume create /mnt/var/cache/pacman/pkg
btrfs subvolume create /mnt/var/abs
btrfs subvolume create /mnt/var/tmp
btrfs subvolume create /mnt/srv
```

## Formating the boot partition
```bash
mkfs.fat -F32 /dev/sda1
```
