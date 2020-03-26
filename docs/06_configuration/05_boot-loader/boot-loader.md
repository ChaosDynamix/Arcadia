---
layout: default
title: Boot loader
permalink: /configuration/boot-loader/
parent: Configuration
nav_order: 5
---

# Configuration / Boot loader
{: .no_toc}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

## Microcode

### Install the microcode of your processor brand

Processors may have faulty behaviour, which the kernel can correct by updating the microcode on startup.

#### AMD
{: .no_toc}

```bash
$ pacman -S amd-ucode
```

#### INTEL
{: .no_toc}

```bash
$ pacman -S intel-ucode
```

---

## Grub

### Install Grub package
{: .pt-2}

#### BIOS
{: .no_toc .pt-2}

```bash
$ pacman -S grub
```

#### UEFI
{: .no_toc .pt-2}

```bash
$ pacman -S grub efibootmgr
```

### Edit grub configuration
{: .pt-4 .mt-0 .d-inline-block}

Warning
{: .label .label-red .mx-2}

Before enabling TRIM on a drive, make sure the device fully supports TRIM commands, or data loss can occur.
{: .text-red-200}

/etc/default/grub
{: .fs-3 .pt-2}

#### NO TRIM
{: .no_toc .pt-2}

```bash
# cryptdevice=/dev/sda2
GRUB_CMDLINE_LINUX_DEFAULT="cryptdevice=UUID=(device-UUID):lvm cryptkey=rootfs:/etc/luks-keys/lvm root=/dev/grp/root loglevel=3 quiet"
GRUB_ENABLE_CRYPTODISK=y
```

#### TRIM
{: .no_toc .pt-2}

```bash
# cryptdevice=/dev/sda2
GRUB_CMDLINE_LINUX_DEFAULT="cryptdevice=UUID=(device-UUID):lvm:allow-discards cryptkey=rootfs:/etc/luks-keys/lvm root=/dev/grp/root loglevel=3 quiet"
GRUB_ENABLE_CRYPTODISK=y
```

### Install GRUB
{: .pt-4}

#### BIOS
{: .no_toc .pt-2}

```bash
$ grub-install --target=i386-pc --recheck /dev/sda
```

#### UEFI
{: .no_toc .pt-2}

```bash
$ grub-install --target=x86_64-efi --efi-directory=/efi --bootloader-id=GRUB --recheck
```

### Generate the configuration
{: .pt-4}

```bash
$ grub-mkconfig -o /boot/grub/grub.cfg
```

---

## Reboot

```bash
$ exit
$ umount -R /mnt
$ reboot
```

---

## References
{: .no_toc}
