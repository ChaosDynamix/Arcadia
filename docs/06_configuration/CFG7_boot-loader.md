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

## Install grub

#### BIOS
{: .no_toc .pt-4}

```bash
$ pacman -S grub
```

#### UEFi
{: .no_toc .pt-4}

```bash
$ pacman -S grub efibootmgr
```

---

## Install grub on the boot partition

#### BIOS
{: .no_toc .pt-4}

```bash
$ grub-install --target=i386-pc --bootloader-id=GRUB --recheck /dev/sda
```

#### UEFi
{: .no_toc .pt-4}

```bash
$ grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB --recheck
```

---

## LVM on LUKS

### generate the configuration
{: .no_toc .pt-4}

```bash
$ grub-mkconfig -o /boot/grub/grub.cfg
```

### Install grub and efibootmgr
{: .no_toc .pt-4}

```bash
pacman -S grub efibootmgr
```

### Edit grub configuration
{: .no_toc .pt-4}

#### grub
{: .no_toc .pt-4}

```bash
GRUB_CMDLINE_LINUX_DEFAULT="cryptdevice=UUID=(device-UUID):lvm root=/dev/grp/root loglevel=3 quiet"
```

### Install grub on the boot partition
{: .no_toc .pt-4}

```bash
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB --recheck
```

### generate the configuration
{: .no_toc .pt-4}

```bash
grub-mkconfig -o /boot/grub/grub.cfg
```

---

## BTRFS on LUKS

### Mounting the boot partition
{: .no_toc .pt-4}

```bash
mkdir /efi
mount /dev/sda1 /efi
```

### Install grub and efibootmgr
{: .no_toc .pt-4}

```bash
pacman -S grub efibootmgr
```

### Edit grub configuration
{: .no_toc .pt-4}

#### grub
{: .no_toc .pt-4}

```bash
GRUB_CMDLINE_LINUX_DEFAULT="cryptdevice=UUID=(device-UUID):btrfs loglevel=3 quiet"
GRUB_ENABLE_CRYPTODISK=y
```

### Install grub on the boot partition
{: .no_toc .pt-4}

```bash
grub-install --target=x86_64-efi --efi-directory=/efi --bootloader-id=GRUB --recheck
```

### generate the configuration
{: .no_toc .pt-4}

```bash
grub-mkconfig -o /boot/grub/grub.cfg
```

---

## Reboot

```bash
$ exit
$ umount -R /mnt
$ reboot
```
