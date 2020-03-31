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

## Configuring fstab and crypttab

/etc/crypttab
{: .fs-3 .mb-0}

```bash
swap      /dev/grp/cryptswap      /dev/urandom	             swap,cipher=aes-xts-plain64,size=256
home      /dev/grp/crypthome      /etc/luks-keys/home
```

/etc/fstab
{: .fs-3 .pt-2 .mb-0}

```bash
/dev/mapper/swap      none        swap        sw              0 0
/dev/mapper/home      /home       ext4        defaults        0 2
```

---

## Add the Swap file to the fstab
{: .d-inline-block}

BTRFS
{: .label .ml-2}

/etc/fstab
{: .fs-3 .mb-0}

```bash
/.swap/swapfile     none      swap      defaults      0 0
```

---

## Enter the system

```bash
$ arch-chroot /mnt
```

---
