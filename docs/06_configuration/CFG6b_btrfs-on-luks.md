---
layout: default
title: CFG6b BTRFS on LUKS
grand_parent: 06 Configuration
parent: CFG6 Images
nav_order: 2
permalink: /configuration/images/btrfs/
---

# Configuration of the images for BTRFS on LUKS
{: .no_toc}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

## Create keyfile

```bash
$ dd bs=512 count=4 if=/dev/random of=/crypto_keyfile.bin iflag=fullblock
```

---

## Change permissions

```bash
$ chmod 600 /crypto_keyfile.bin
$ chmod 600 /boot/initramfs-linux*
```

---

## Add keyfile to cryptsetup

```bash
$ cryptsetup luksAddKey /dev/sda2 /crypto_keyfile.bin
```

---

## Edit mkinitcpio.conf

#### mkinitcpio.conf
{: .no_toc .pt-4}

```bash
BINARIES=(/usr/bin/btrfs)
FILES=(/crypto_keyfile.bin)
HOOKS=(base udev autodetect modconf block encrypt filesystems keyboard keymap fsck)
```

---

## Generate images

```bash
mkinitcpio -p linux
```

### References
{: .no_toc .text-delta .pt-4}

- [ArchWiki - Dm-crypt/Device encryption - Unlocking the root partition at boot](https://wiki.archlinux.org/index.php/Dm-crypt/Device_encryption#Unlocking_the_root_partition_at_boot)
- [ArchWiki - Dm-crypt/Encrypting an entire system - Btrfs subvolumes with swap](https://wiki.archlinux.org/index.php/Dm-crypt/Encrypting_an_entire_system#Btrfs_subvolumes_with_swap)
- [ArchWiki - Mkinitcpio - Image creation and activation](https://wiki.archlinux.org/index.php/Mkinitcpio#Image_creation_and_activation)
