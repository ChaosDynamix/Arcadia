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

# Multiple devices / Luks on logical volumes
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

### Create the container
{: .no_toc}

```bash
$ cryptsetup --type luks1 luksFormat /dev/grp/cryptroot
$ cryptsetup open /dev/grp/cryptroot root
```

### Setup the container
{: .no_toc .mt-6}

```bash
$ mkfs.ext4 -L ROOT /dev/mapper/root
$ mount /dev/mapper/root /mnt
```

---

{% include efi-partition.md %}
{% include mirrorlist.md %}
{% include essential-packages.md %}

## Keyfile

### Create the keys directory
{: .no_toc .mt-4}

```bash
$ mkdir -m 700 /etc/luks-keys
```

### Generate the keys
{: .no_toc .mt-6}

```bash
$ dd bs=512 count=4 if=/dev/random of=/etc/luks-keys/root iflag=fullblock
$ dd bs=512 count=4 if=/dev/random of=/etc/luks-keys/home iflag=fullblock
```

### Change the permissions
{: .no_toc .mt-6}

```bash
$ chmod 600 /etc/luks-keys/root
$ chmod 600 /etc/luks-keys/home
$ chmod 600 /boot/initramfs-linux*
```

### Add the key in the container
{: .no_toc .mt-6}

```bash
$ cryptsetup luksAddKey /dev/grp/root /etc/luks-keys/root
```

---

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
$ mount /dev/mapper/home /mnt/home
```

---

## Filesystem table

### Generate fstab
{: .no_toc .mt-4}

```bash
$ genfstab -U /mnt >> /mnt/etc/fstab
```

### Edit the configuration
{: .no_toc .mt-6}

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

## Enter the system

```bash
$ arch-chroot /mnt
```

---

{% include initial-ramdisk.md %}
{% include microcode.md %}
{% include boot-loader.md %}
