---
layout: default
title: Filesystem table
permalink: /installation/filesystem-table/
parent: Installation
nav_order: 3
has_toc: false
---

# Installation / Filesystem table
{: .no_toc}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

## Generate static information about the filesystems

```bash
$ genfstab -U /mnt >> /mnt/etc/fstab
```

---

## Edit the configuration

### /etc/fstab
{: .no_toc}

#### LVM-ENCRYPTED-VOLUMES
{: .no_toc .mt-4}

```bash
/dev/mapper/swap      none        swap        sw              0 0
/dev/mapper/home      /home       ext4        defaults        0 2
```

#### BTRFS-SNAPSHOTS
{: .no_toc .mt-6}

```bash
/.swap/swapfile       none        swap        defaults        0 0
```

### /etc/crypttab
{: .no_toc .mt-6}

```bash
swap    /dev/grp/cryptswap    /dev/urandom	         swap,cipher=aes-xts-plain64,size=256
home    /dev/grp/crypthome    /etc/luks-keys/home
```

### /etc/crypttab.initramfs
{: .no_toc .mt-6}

```bash
container1    /dev/sda2     /etc/luks-keys/container1
container2    /dev/sdb1     /etc/luks-keys/container2
```

---

## Enter the system

```bash
$ arch-chroot /mnt
```

---
