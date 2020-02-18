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

```bash
pacstrap /mnt {base} {kernel} {firmware} {utilities} {editor} {documentation}
```

## Enter the system

```bash
arch-chroot /mnt
```

### References
{: .no_toc .text-delta .pt-4}

- [ArchWiki - Installation guide - Chroot](https://wiki.archlinux.org/index.php/Installation_guide#Chroot)
