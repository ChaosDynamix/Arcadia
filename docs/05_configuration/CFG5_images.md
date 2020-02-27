---
layout: default
title: 05 Images
nav_order: 5
parent: 05 Configuration
permalink: /configuration/images/
has_toc: false
---

# Configuration of the images
{: .no_toc}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

## Edit the configuration

Open `/etc/mkinitcpio.conf`

#### LVM
{: .no_toc .pt-4}

```bash
FILES=(/etc/luks-keys/root)
HOOKS=(base udev autodetect modconf block encrypt lvm2 filesystems keyboard keymap fsck)
```

#### BTRFS
{: .no_toc .pt-4}

```bash
BINARIES=(/usr/bin/btrfs)
FILES=(/etc/luks-keys/root)
HOOKS=(base udev autodetect modconf block encrypt filesystems keyboard keymap fsck)
```

---

## Generate the images

```bash
$ mkinitcpio -p linux
```

#### References
{: .no_toc .text-delta .pt-4}

- [ArchWiki - Dm-crypt/Encrypting an entire system - LVM on LUKS](https://wiki.archlinux.org/index.php/Dm-crypt/Encrypting_an_entire_system#LVM_on_LUKS)
- [ArchWiki - Mkinitcpio - Image creation and activation](https://wiki.archlinux.org/index.php/Mkinitcpio#Image_creation_and_activation)
- [ArchWiki - Dm-crypt/Device encryption - Unlocking the root partition at boot](https://wiki.archlinux.org/index.php/Dm-crypt/Device_encryption#Unlocking_the_root_partition_at_boot)
- [ArchWiki - Dm-crypt/Encrypting an entire system - Btrfs subvolumes with swap](https://wiki.archlinux.org/index.php/Dm-crypt/Encrypting_an_entire_system#Btrfs_subvolumes_with_swap)
