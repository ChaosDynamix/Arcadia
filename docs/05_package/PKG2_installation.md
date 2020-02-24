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

### Example
{: .no_toc .pt-2}

```bash
pacstrap /mnt base base-devel linux linux-firmware vim man-db man-pages
```

### Utilities for accessing the storage
{: .no_toc .pt-4}

| System | Package     |
| :----- | :---------- |
| RAID   | mdadm       |
| LVM    | lvm2        |
| BTRFS  | btrfs-progs |

### References
{: .no_toc .text-delta .pt-4}

- [ArchWiki - Installation guide - Install essential packages](https://wiki.archlinux.org/index.php/Installation_guide#Install_essential_packages)
