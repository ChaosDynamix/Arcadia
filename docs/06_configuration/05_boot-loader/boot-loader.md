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

## Install the microcode of your processor brand

Processors may have faulty behaviour, which the kernel can correct by updating the microcode on startup.

#### AMD
{: .no_toc .mt-4}

```bash
$ pacman -S amd-ucode
```

#### INTEL
{: .no_toc .mt-6}

```bash
$ pacman -S intel-ucode
```

---

## Install the boot loader

### Install the package(s)
{: .no_toc}

#### BIOS
{: .no_toc .mt-4}

```bash
$ pacman -S grub
```

#### UEFI
{: .no_toc .mt-6}

```bash
$ pacman -S grub efibootmgr
```

### Edit the configuration
{: .no_toc .mt-6 .d-inline-block}

Warning
{: .label .label-red .mx-2}

Before enabling TRIM on a drive, make sure the device fully supports TRIM commands, or data loss can occur.
{: .text-red-200}

/etc/default/grub
{: .fs-3 .pt-2}

#### NO TRIM
{: .no_toc .mt-4}

```bash
# cryptdevice=/dev/sda2
GRUB_CMDLINE_LINUX_DEFAULT="cryptdevice=UUID=(device-UUID):lvm cryptkey=rootfs:/etc/luks-keys/lvm root=/dev/grp/root loglevel=3 quiet"
GRUB_ENABLE_CRYPTODISK=y
```

#### TRIM
{: .no_toc .mt-6}

```bash
# cryptdevice=/dev/sda2
GRUB_CMDLINE_LINUX_DEFAULT="cryptdevice=UUID=(device-UUID):lvm:allow-discards cryptkey=rootfs:/etc/luks-keys/lvm root=/dev/grp/root loglevel=3 quiet"
GRUB_ENABLE_CRYPTODISK=y
```

### Install Grub
{: .no_toc .mt-6}

#### BIOS
{: .no_toc .mt-4}

```bash
$ grub-install --target=i386-pc --recheck /dev/sda
```

#### UEFI
{: .no_toc .mt-6}

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
