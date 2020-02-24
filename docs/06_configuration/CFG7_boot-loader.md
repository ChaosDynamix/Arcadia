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

#### UEFI
{: .no_toc .pt-4}

```bash
$ pacman -S grub efibootmgr
```

#### BIOS
{: .no_toc .pt-4}

```bash
$ pacman -S grub
```

---

## Install GRUB on the boot location

#### UEFI
{: .no_toc .pt-4}

```bash
$ grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB --recheck /dev/sda
```

#### UEFI / RAID
{: .no_toc .pt-4}

```bash
$ grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB --recheck /dev/mdX
```

#### UEFI / Encryption
{: .no_toc .pt-4}

```bash
$ grub-install --target=x86_64-efi --efi-directory=/efi --bootloader-id=GRUB --recheck
```

#### BIOS
{: .no_toc .pt-4}

```bash
$ grub-install --target=i386-pc --bootloader-id=GRUB --recheck /dev/sda
```

---

## Edit grub configuration

#### LVM / Encryption
{: .no_toc .pt-4}

```bash
GRUB_CMDLINE_LINUX_DEFAULT="cryptdevice=UUID=(device-UUID):lvm root=/dev/grp/root loglevel=3 quiet"
GRUB_ENABLE_CRYPTODISK=y
```

#### BTRFS / Encryption
{: .no_toc .pt-4}

```bash
GRUB_CMDLINE_LINUX_DEFAULT="cryptdevice=UUID=(device-UUID):btrfs loglevel=3 quiet"
GRUB_ENABLE_CRYPTODISK=y
```

---

## Generate the configuration

```bash
grub-mkconfig -o /boot/grub/grub.cfg
```
