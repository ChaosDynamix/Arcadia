---
layout: default
title: PKG2 Installation
nav_order: 2
parent: 05 Package
permalink: /package/installation/
has_toc: false
---

# Package installation
{: .no_toc}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

## Installation

### Examples
{: .no_toc}

#### Ext4
{: .no_toc .pt-4}

```bash
pacstrap /mnt base base-devel linux linux-firmware vim man-db man-pages
```

#### Lvm
{: .no_toc .pt-4}

```bash
pacstrap /mnt base base-devel linux linux-firmware lvm2 vim man-db man-pages
```

#### Btrfs
{: .no_toc .pt-4}

```bash
pacstrap /mnt base base-devel linux linux-firmware btrfs-progs vim man-db man-pages
```

### References
{: .no_toc .text-delta .pt-4}

- [ArchWiki - Installation guide - Install essential packages](https://wiki.archlinux.org/index.php/Installation_guide#Install_essential_packages)

---

## Enter the system

```bash
arch-chroot /mnt
```

### References
{: .no_toc .text-delta .pt-4}

- [ArchWiki - Installation guide - Chroot](https://wiki.archlinux.org/index.php/Installation_guide#Chroot)
