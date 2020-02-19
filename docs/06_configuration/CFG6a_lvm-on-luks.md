---
layout: default
title: CFG6a LVM on LUKS
grand_parent: 06 Configuration
parent: CFG6 Images
nav_order: 1
permalink: /configuration/images/lvm/
---

# Configuration of the images for LVM on LUKS
{: .no_toc}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

## Edit mkinitcpio.conf

#### mkinitcpio.conf
{: .no_toc .pt-4}

```bash
HOOKS=(base udev autodetect modconf block encrypt lvm2 filesystems keyboard keymap fsck)
```

### References
{: .no_toc .text-delta .pt-4}

- [ArchWiki - Dm-crypt/Encrypting an entire system - LVM on LUKS](https://wiki.archlinux.org/index.php/Dm-crypt/Encrypting_an_entire_system#LVM_on_LUKS)

---

## Generate images

```bash
$ mkinitcpio -p linux
```

#### References
{: .no_toc .text-delta .pt-4}

- [ArchWiki - Dm-crypt/Encrypting an entire system - LVM on LUKS](https://wiki.archlinux.org/index.php/Dm-crypt/Encrypting_an_entire_system#LVM_on_LUKS)
- [ArchWiki - Mkinitcpio - Image creation and activation](https://wiki.archlinux.org/index.php/Mkinitcpio#Image_creation_and_activation)
