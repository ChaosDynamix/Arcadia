---
layout: default
title: STR6 LVM
nav_order: 6
parent: 04 Storage
permalink: /storage/lvm/
has_toc: false
---

# Storage logical volume manager
{: .no_toc}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

## Create the physical volume

```bash
$ pvcreate /dev/sda2
```

#### Encryption
{: .no_toc .pt-4}

```bash
$ pvcreate /dev/mapper/lvm
```

#### References
{: .no_toc .text-delta .pt-4}

- [ArchWiki - LVM on LUKS - Preparing the logical volumes](https://wiki.archlinux.org/index.php/Dm-crypt/Encrypting_an_entire_system#Preparing_the_logical_volumes)

---

## Create the volume group

```bash
$ vgcreate grp /dev/sda2
```

#### Encryption
{: .no_toc .pt-4}

```bash
$ vgcreate grp /dev/mapper/lvm
```

#### References
{: .no_toc .text-delta .pt-4}

- [ArchWiki - LVM on LUKS - Preparing the logical volumes](https://wiki.archlinux.org/index.php/Dm-crypt/Encrypting_an_entire_system#Preparing_the_logical_volumes)

---

## Create the logical volumes

```bash
$ lvcreate -L 8G grp -n swap
$ lvcreate -L 32G grp -n root
$ lvcreate -l 100%FREE grp -n home
```

#### References
{: .no_toc .text-delta .pt-4}

- [ArchWiki - LVM on LUKS - Preparing the logical volumes](https://wiki.archlinux.org/index.php/Dm-crypt/Encrypting_an_entire_system#Preparing_the_logical_volumes)
