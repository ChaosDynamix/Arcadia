---
layout: default
title: PAR4a LVM on LUKS
grand_parent: 04 Partition
parent: PAR4 Setup
nav_order: 1
permalink: /partition/setup/lvm/
has_toc: false
---

# Partition setup for LVM on LUKS
{: .no_toc}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

## Create the container
```bash
cryptsetup luksFormat /dev/sdXY
cryptsetup open /dev/sdXY lvm
```

## Create the physical volume
```bash
pvcreate /dev/mapper/lvm
```

## Create the volume group
```bash
vgcreate grp /dev/mapper/lvm
```

## Create the logical volumes
```bash
lvcreate -L 8G grp -n swap
lvcreate -L 32G grp -n root
lvcreate -l 100%FREE grp -n home
```

## Formating logical volumes
```bash
mkfs.ext4 /dev/grp/root
mkfs.ext4 /dev/grp/home
```

## Setup Swap

```bash
mkswap /dev/grp/swap
swapon /dev/grp/swap
```

## Mounting logical volumes
```bash
mount /dev/grp/root /mnt
mkdir /mnt/home
mount /dev/grp/home /mnt/home
```

## Setup the boot partition
```bash
mkfs.fat -F32 /dev/sda1
mkdir /mnt/boot
mount /dev/sda1 /mnt/boot
```
