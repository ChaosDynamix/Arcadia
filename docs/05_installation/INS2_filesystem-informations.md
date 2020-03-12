---
layout: default
title: Filesystem informations
permalink: /installation/filesystem-informations/
parent: Installation
nav_order: 2
has_toc: false
---

# Installation of the filesystem informations
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
