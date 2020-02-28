---
layout: default
title: Btrfs
nav_order: 3
parent: 06 Boot
permalink: /boot/btrfs/
---

# Boot configuration for BTRFS
{: .no_toc}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

## Initial RAM filesystem

### Edit the configuration
{: .no_toc .pt-2}

/etc/mkinitcpio.conf
{: .fs-3 .pt-2 .mb-0}

```bash
BINARIES=(/usr/bin/btrfs)
FILES=(/etc/luks-keys/root)
HOOKS=(base udev autodetect modconf block encrypt filesystems keyboard keymap fsck)
```

### Generate the images
{: .no_toc .pt-4}

```bash
$ mkinitcpio -p linux
```

#### References
{: .no_toc .text-delta .pt-4}

1. [ArchWiki - Arch boot process - Initramfs](https://wiki.archlinux.org/index.php/Arch_boot_process#initramfs)
1. [ArchWiki - Mkinitcpio - Image creation and activation](https://wiki.archlinux.org/index.php/Mkinitcpio#Image_creation_and_activation)
1. [ArchWiki - Dm-crypt - Encrypting an entire system - Btrfs subvolumes with Swap](https://wiki.archlinux.org/index.php/Dm-crypt/Encrypting_an_entire_system#Btrfs_subvolumes_with_swap)
1. [ArchWiki - Dm-crypt/Device encryption - Unlocking the root partition at boot](https://wiki.archlinux.org/index.php/Dm-crypt/Device_encryption#Unlocking_the_root_partition_at_boot)

---

## Boot loader

### Install GRUB package
{: .no_toc .pt-2}

```bash
$ pacman -S grub efibootmgr
```

### Edit grub configuration
{: .no_toc .pt-4}

/etc/default/grub
{: .fs-3 .pt-2 .mb-0}

```bash
GRUB_CMDLINE_LINUX_DEFAULT="cryptdevice=UUID=(device-UUID):btrfs cryptkey=rootfs:/etc/luks-keys/root loglevel=3 quiet"
GRUB_ENABLE_CRYPTODISK=y
```

### Install GRUB
{: .no_toc .pt-4}

```bash
$ grub-install --target=x86_64-efi --efi-directory=/efi --bootloader-id=GRUB --recheck
```

### Generate the configuration
{: .no_toc .pt-4}

```bash
$ grub-mkconfig -o /boot/grub/grub.cfg
```

#### References
{: .no_toc .text-delta .pt-4}

1. [ArchWiki - Dm-crypt - Encrypting an entire system - Btrfs subvolumes with Swap](https://wiki.archlinux.org/index.php/Dm-crypt/Encrypting_an_entire_system#Btrfs_subvolumes_with_swap)
1. [ArchWiki - GRUB - UEFI systems](https://wiki.archlinux.org/index.php/GRUB#UEFI_systems)
1. [ArchWiki - GRUB - Configuration](https://wiki.archlinux.org/index.php/GRUB#Configuration)
1. [ArchWiki - GRUB - Encrypted boot](https://wiki.archlinux.org/index.php/GRUB#Encrypted_/boot)
1. [Man pages - pacman](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/pacman/pacman.8.en)
1. [Man pages - grub-install](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/grub/grub-install.8.en)
1. [Man pages - grub-mkconfig](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/grub/grub-mkconfig.8.en)

---

## Reboot

```bash
$ exit
$ umount -R /mnt
$ reboot
```

#### References
{: .no_toc .text-delta .pt-4}

1. [ArchWiki - Installation guide - Reboot](https://wiki.archlinux.org/index.php/Installation_guide#Reboot)
