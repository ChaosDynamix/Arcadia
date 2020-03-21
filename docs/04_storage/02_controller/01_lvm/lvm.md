---
layout: default
title: Lvm
permalink: /storage/controller/lvm/
grand_parent: Storage
parent: Controller
nav_order: 1
---

# Storage Controller with Lvm

---

## Lvm for encrypted foundation

### [Lvm on Luks](/Andromeda/storage/controller/lvm/lvm-luks/)
{: .pt-2}
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

---

## Lvm for non-encrypted foundation

### [Luks on Lvm](/Andromeda/storage/controller/lvm/luks-lvm/)
{: .pt-2}
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
