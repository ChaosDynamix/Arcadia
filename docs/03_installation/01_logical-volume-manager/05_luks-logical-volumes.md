---
layout: default
title: Luks on logical volumes
permalink: /installation/lvm/luks-logical-volumes/
grand_parent: Installation
parent: Logical Volume Manager
nav_order: 5

has_multiple-devices: true
has_multiple_containers: false
has_detached_header: false
has_raid: false
has_swapfile: false
init-system: busybox
---

# LVM / Luks on logical volumes
{: .no_toc}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

{% include secure-erase.md %}
{% include partitioning.md %}

## Setup the Logical volume Manager

| Volume | Size recommendation                                                                                               |
| :----- | :---------------------------------------------------------------------------------------------------------------- |
| ROOT   | 23–32 GiB                                                                                                         |
| SWAP   | [VOID Linux recommendations](https://docs.voidlinux.org/installation/live-images/partitions.html#swap-partitions) |
| HOME   | 100%FREE                                                                                                          |

### Create the Physical Volume
{: .no_toc}

```bash
$ pvcreate /dev/sda2 /dev/sdb1
```

### Create the Volume Group
{: .no_toc .mt-6}

```bash
$ vgcreate grp /dev/sda2 /dev/sdb1
```

### Create the Logical volumes
{: .no_toc .mt-6}

```bash
$ lvcreate -L SIZE grp -n cryptswap
$ lvcreate -L SIZE grp -n cryptroot
$ lvcreate -l 100%FREE grp -n crypthome
```

---

## Setup the Root container

### Create the Root container
{: .no_toc}

```bash
$ cryptsetup --type luks1 luksFormat /dev/grp/cryptroot
$ cryptsetup open /dev/grp/cryptroot root
```

### Format and mount the Root container
{: .no_toc .mt-6}

```bash
$ mkfs.ext4 -L ROOT /dev/mapper/root
$ mount /dev/mapper/root /mnt
```

---

{% include efi-partition.md %}
{% include mirrorlist.md %}
{% include essential-packages.md %}
{% include filesystem-table.md %}
{% include keyfile.md %}

## Setup the Home container

### Create the container
{: .no_toc}

```bash
$ cryptsetup --type luks1 luksFormat /dev/grp/crypthome /etc/luks-keys/home
$ cryptsetup -d /etc/luks-keys/home open /dev/grp/crypthome home
```

### Setup the container
{: .no_toc .mt-6}

```bash
$ mkfs.ext4 -L HOME /dev/mapper/home
$ mount /dev/mapper/home /home
```

---

## Add entries to Fstab and Crypttab

### /etc/fstab
{: .fs-3 .mb-0}

```bash
/dev/mapper/swap      none        swap        sw              0 0
/dev/mapper/home      /home       ext4        defaults        0 2
```

### /etc/crypttab
{: .fs-3 .mb-0}

```bash
swap    /dev/grp/cryptswap    /dev/urandom	         swap,cipher=aes-xts-plain64,size=256
home    /dev/grp/crypthome    /etc/luks-keys/home
```

---

{% include initial-ramdisk.md %}
{% include microcode.md %}
{% include boot-loader.md %}
