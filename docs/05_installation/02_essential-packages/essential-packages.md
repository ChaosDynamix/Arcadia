---
layout: default
title: Essential packages
permalink: /installation/essential-packages/
parent: Installation
nav_order: 2
has_toc: false
---

# Installation / Essential packages
{: .no_toc}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

## Install Arch Linux essential packages

| Utilities | packages    |
| :-------- | :---------- |
| Lvm       | lvm2        |
| raid      | mdadm       |
| btrfs     | btrfs-progs |

### Example
{: .no_toc .pt-4}

```bash
$ pacstrap /mnt base linux linux-firmware vim man-db man-pages
```
