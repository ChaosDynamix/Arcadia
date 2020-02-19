---
layout: default
title: CFG7a LVM on LUKS
grand_parent: 06 Configuration
parent: CFG7 Boot loader
nav_order: 1
permalink: /configuration/boot-loader/lvm/
---

# Configuration of the boot loader for LVM on LUKS
{: .no_toc}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

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
GRUB_CMDLINE_LINUX_DEFAULT="cryptdevice=UUID=(device-UUID):lvm root=/dev/grp/root loglevel=3 quiet"
```

---

## Install grub on the boot partition

```bash
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB --recheck
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
