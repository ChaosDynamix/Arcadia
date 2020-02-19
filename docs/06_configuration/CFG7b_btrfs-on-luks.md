---
layout: default
title: CFG7b BTRFS on LUKS
grand_parent: 06 Configuration
parent: CFG7 Boot loader
nav_order: 2
permalink: /configuration/boot-loader/btrfs/
---

# Configuration of the boot loader for BTRFS on LUKS
{: .no_toc}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

## Mounting the boot partition
```bash
mkdir /efi
mount /dev/sda1 /efi
```

---

## Install grub and efibootmgr
```bash
pacman -S grub efibootmgr
```

---

## Edit grub configuration

#### grub
{: .no_toc .pt-4}

```bash
GRUB_CMDLINE_LINUX_DEFAULT="cryptdevice=UUID=(device-UUID):btrfs loglevel=3 quiet"
GRUB_ENABLE_CRYPTODISK=y
```

---

## Install grub on the boot partition

```bash
grub-install --target=x86_64-efi --efi-directory=/efi --bootloader-id=GRUB --recheck
```

---

## generate the configuration

```bash
grub-mkconfig -o /boot/grub/grub.cfg
```

---

## Reboot

```bash
exit
umount -R /mnt
reboot
```
