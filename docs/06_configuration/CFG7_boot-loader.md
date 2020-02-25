---
layout: default
title: CFG7 Boot loader
nav_order: 7
parent: 06 Configuration
permalink: /configuration/boot-loader/
has_toc: false
---

# Configuration of the boot loader
{: .no_toc}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

## Install GRUB package

```bash
$ pacman -S grub efibootmgr
```

---

## Edit grub configuration

Open `/etc/defaults/grub`

#### LVM
{: .no_toc .pt-4}

```bash
GRUB_CMDLINE_LINUX_DEFAULT="cryptdevice=UUID=(device-UUID):lvm root=/dev/grp/root loglevel=3 quiet"
GRUB_ENABLE_CRYPTODISK=y
```

#### BTRFS
{: .no_toc .pt-4}

```bash
GRUB_CMDLINE_LINUX_DEFAULT="cryptdevice=UUID=(device-UUID):btrfs loglevel=3 quiet"
GRUB_ENABLE_CRYPTODISK=y
```

---

## Install GRUB

```bash
$ grub-install --target=x86_64-efi --efi-directory=/efi --bootloader-id=GRUB --recheck
```

---

## Generate the configuration

```bash
grub-mkconfig -o /boot/grub/grub.cfg
```
