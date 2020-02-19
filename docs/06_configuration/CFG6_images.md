---
layout: default
title: CFG6 Images
nav_order: 6
parent: 06 Configuration
permalink: /configuration/images/
has_children: true
has_toc: false
---

# Configuration of the images
{: .no_toc}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

## Lvm

#### Edit mkinitcpio.conf

```bash
vim /etc/mkinitcpio.conf
----------------------------------------------------------------------------------------
HOOKS=(base udev autodetect modconf block encrypt lvm2 filesystems keyboard keymap fsck)
```

#### Generate images

```bash
mkinitcpio -p linux
```

##### Sources
- [ArchWiki - Dm-crypt/Encrypting an entire system - LVM on LUKS](https://wiki.archlinux.org/index.php/Dm-crypt/Encrypting_an_entire_system#LVM_on_LUKS)
- [ArchWiki - Mkinitcpio - Image creation and activation](https://wiki.archlinux.org/index.php/Mkinitcpio#Image_creation_and_activation)

## Btrfs

#### Create keyfile

```bash
dd bs=512 count=4 if=/dev/random of=/crypto_keyfile.bin iflag=fullblock
```

#### Change permissions

```bash
chmod 600 /crypto_keyfile.bin
chmod 600 /boot/initramfs-linux*
```

#### Add keyfile do cryptsetup

```bash
cryptsetup luksAddKey /dev/sda2 /crypto_keyfile.bin
```

#### Edit mkinitcpio.conf

```bash
vim /etc/mkinitcpio.conf
-----------------------------------------------------------------------------------
BINARIES=(/usr/bin/btrfs)
FILES=(/crypto_keyfile.bin)
HOOKS=(base udev autodetect modconf block encrypt filesystems keyboard keymap fsck)
```

#### Generate images

```bash
mkinitcpio -p linux
```

##### Sources
- [ArchWiki - Dm-crypt/Device encryption - Unlocking the root partition at boot](https://wiki.archlinux.org/index.php/Dm-crypt/Device_encryption#Unlocking_the_root_partition_at_boot)
- [ArchWiki - Dm-crypt/Encrypting an entire system - Btrfs subvolumes with swap](https://wiki.archlinux.org/index.php/Dm-crypt/Encrypting_an_entire_system#Btrfs_subvolumes_with_swap)
- [ArchWiki - Mkinitcpio - Image creation and activation](https://wiki.archlinux.org/index.php/Mkinitcpio#Image_creation_and_activation)
