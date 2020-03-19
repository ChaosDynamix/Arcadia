---
layout: default
title: Lvm
permalink: /storage/controller/lvm/
grand_parent: Storage
parent: Controller
nav_order: 1
---

# Storage Controller with Lvm
{: .no_toc}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

### [Lvm on Luks](/Andromeda/storage/controller/lvm/lvm-luks/)
{: .no_toc .pt-2}

```
+-----------------------------------------------------------+
|                      Physical volume                      |
+-----------------------------------------------------------+
|                       Group volume                        |
+-------------------+-------------------+-------------------+
| Logical volume 1  | Logical volume 2  | Logical volume 3  |
| SWAP              | ROOT              | HOME              |
+-------------------+-------------------+-------------------+
```

### [Luks on Lvm](/Andromeda/storage/controller/lvm/luks-lvm/)
{: .no_toc .pt-4}

```
+-----------------------------------------------------------+
|                      Physical volume                      |
+-----------------------------------------------------------+
|                        Group volume                       |
+-------------------+-------------------+-------------------+
| Logical volume 1  | Logical volume 2  | Logical volume 3  |
+-------------------+-------------------+-------------------+
| Plain Encrypted   | LUKS1 encrypted   | LUKS1 encrypted   |
| SWAP              | ROOT              | HOME              |
+-------------------+-------------------+-------------------+
```
