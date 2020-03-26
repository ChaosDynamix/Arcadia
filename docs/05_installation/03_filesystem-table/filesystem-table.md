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
