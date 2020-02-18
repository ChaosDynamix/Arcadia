---
layout: default
title: CON1 Filesystem table
nav_order: 1
parent: 07 Configuration
permalink: /configuration/filesystem-table/
has_children: true
has_toc: false
---

# Configuration of the filesystem table
{: .no_toc}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

## Generate Fstab

```bash
genfstab -U /mnt >> /mnt/etc/fstab
```

### References
{: .no_toc .text-delta .pt-4}

- [ArchWiki - Installation guide - Fstab](https://wiki.archlinux.org/index.php/Installation_guide#Fstab)
- [ArchWiki - Fstab](https://wiki.archlinux.org/index.php/Fstab)
