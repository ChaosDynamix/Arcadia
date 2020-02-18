---
layout: default
title: CON7 Boot loader
nav_order: 7
parent: 06 Configuration
permalink: /configuration/boot-loader/
has_children: true
has_toc: false
---

# Configuration of the boot loader
{: .no_toc}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

## Default

#### BIOS

```bash
pacman -S grub

grub-install --target=i386-pc --bootloader-id=GRUB --recheck /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg
```

## Lvm

#### Install grub and efibootmgr
```bash
pacman -S grub efibootmgr
```

#### Edit grub configuration
```bash
vim /etc/default/grub
---------------------------------------------------------------------------------------------------
GRUB_CMDLINE_LINUX_DEFAULT="cryptdevice=UUID=(device-UUID):lvm root=/dev/grp/root loglevel=3 quiet"
```

#### Install grub on the boot partition and generate the configuration
```bash
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB --recheck
grub-mkconfig -o /boot/grub/grub.cfg
```

## Btrfs

#### Mounting the boot partition
```bash
mkdir /efi
mount /dev/sda1 /efi
```

#### Install grub and efibootmgr
```bash
pacman -S grub efibootmgr
```

#### Edit grub configuration
```bash
vim /etc/default/grub
----------------------------------------------------------------------------------
GRUB_CMDLINE_LINUX_DEFAULT="cryptdevice=UUID=(device-UUID):btrfs loglevel=3 quiet"
GRUB_ENABLE_CRYPTODISK=y
```

#### Install grub on the boot partition and generate the configuration
```bash
grub-install --target=x86_64-efi --efi-directory=/efi --bootloader-id=GRUB --recheck
grub-mkconfig -o /boot/grub/grub.cfg
```

## Reboot

```bash
exit
umount -R /mnt
reboot
```
