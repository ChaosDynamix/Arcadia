---
layout: default
title: Ext4
nav_order: 1
parent: 06 Boot
permalink: /boot/ext4/
---

# Boot configuration for EXT4
{: .no_toc}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

## Boot loader

### Install GRUB package
{: .no_toc .pt-2}

```bash
$ pacman -S grub efibootmgr
```

### Install GRUB
{: .no_toc .pt-4}

```bash
$ grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB --recheck
```

### Generate the configuration
{: .no_toc .pt-4}

```bash
$ grub-mkconfig -o /boot/grub/grub.cfg
```

#### References
{: .no_toc .text-delta .pt-4}

1. [ArchWiki - GRUB - UEFI systems](https://wiki.archlinux.org/index.php/GRUB#UEFI_systems)
1. [ArchWiki - GRUB - Configuration](https://wiki.archlinux.org/index.php/GRUB#Configuration)
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
