---
layout: default
title: Lvm with raid12
nav_exclude: true
permalink: /boot-setup/btrfs-with-raid12/
---

# Boot setup for LVM with RAID1 2
{: .no_toc}

---

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

## Create a keys for the containers

This section cover the creation of a specially named keyfile that will be embedded in the initramfs and picked up by the encrypt hook to unlock the root filesystem (cryptdevice) automatically. This step avoid us to enter two passphrases during boot.

### Create the keyfiles
{: .no_toc .pt-2}

```bash
# Create the keys directory with read/write/execution permissions for root
$ mkdir -m 700 /etc/luks-keys

# Create the key
$ dd bs=512 count=4 if=/dev/random of=/etc/luks-keys/lvm1 iflag=fullblock
$ dd bs=512 count=4 if=/dev/random of=/etc/luks-keys/lvm2 iflag=fullblock
```

### Change permissions
{: .no_toc .pt-4}

```bash
$ chmod 600 /etc/luks-keys/lvm1
$ chmod 600 /etc/luks-keys/lvm2
$ chmod 600 /boot/initramfs-linux*
```

### Add the keyfiles to cryptsetup
{: .no_toc .pt-4}

```bash
$ cryptsetup luksAddKey /dev/sda2 /etc/luks-keys/lvm1
$ cryptsetup luksAddKey /dev/sdb2 /etc/luks-keys/lvm2
```

### References
{: .no_toc .text-delta .pt-4}

1. [ArchWiki - Device encryption - Unlocking the root partition at boot](https://wiki.archlinux.org/index.php/Dm-crypt/Device_encryption#Unlocking_the_root_partition_at_boot)
1. [Man page - mkdir](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/coreutils/mkdir.1.en)
1. [Man page - dd](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/coreutils/dd.1.en)
1. [Man page - chmod](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/coreutils/chmod.1.en)
1. [Man page - cryptsetup](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/cryptsetup/cryptsetup.8.en)

---

## Modifying the encrypt hook

```bash
$ cp /usr/lib/initcpio/install/encrypt /etc/initcpio/install/encrypt2
$ cp /usr/lib/initcpio/hooks/encrypt  /etc/initcpio/hooks/encrypt2
$ sed -i "s/cryptdevice/cryptdevice2/" /etc/initcpio/hooks/encrypt2
$ sed -i "s/cryptkey/cryptkey2/" /etc/initcpio/hooks/encrypt2
```

### References
{: .no_toc .text-delta .pt-4}

1. [ArchWiki - Dm-crypt - Specialties - Modifying the encrypt hook for multiple partitions](https://wiki.archlinux.org/index.php/Dm-crypt/Specialties#Modifying_the_encrypt_hook_for_multiple_partitions)

---

## Initial RAM filesystem

### Edit the configuration
{: .no_toc .pt-2}

/etc/mkinitcpio.conf
{: .fs-3 .pt-2 .mb-0}

```bash
FILES=(/etc/luks-keys/lvm1 /etc/luks-keys/lvm2)
HOOKS=(base udev autodetect modconf block encrypt encrypt2 lvm2 filesystems keyboard keymap fsck)
```

### Generate the images
{: .no_toc .pt-4}

```bash
$ mkinitcpio -p linux
```

### References
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
{: .no_toc .pt-4 .mt-0 .d-inline-block}

Warning
{: .label .label-red .mx-2}

Before enabling TRIM on a drive, make sure the device fully supports TRIM commands, or data loss can occur.
{: .text-red-200}

/etc/default/grub
{: .fs-3 .pt-2}

#### NO TRIM
{: .no_toc .pt-2}

```bash
GRUB_CMDLINE_LINUX_DEFAULT="cryptdevice=UUID=(device-UUID):lvm1 cryptkey=rootfs:/etc/luks-keys/lvm1 cryptdevice2=UUID=(device-UUID):lvm2 cryptkey2=rootfs:/etc/luks-keys/lvm2 loglevel=3 quiet"
GRUB_ENABLE_CRYPTODISK=y
```

#### TRIM
{: .no_toc .pt-2}

```bash
GRUB_CMDLINE_LINUX_DEFAULT="cryptdevice=UUID=(device-UUID):lvm1:allow-discards cryptkey=rootfs:/etc/luks-keys/lvm1 cryptdevice2=UUID=(device-UUID):lvm2:allow-discards cryptkey2=rootfs:/etc/luks-keys/lvm2 loglevel=3 quiet"
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

### References
{: .no_toc .text-delta .pt-4}

1. [ArchWiki - Dm-crypt - Encrypting an entire system - Btrfs subvolumes with Swap](https://wiki.archlinux.org/index.php/Dm-crypt/Encrypting_an_entire_system#Btrfs_subvolumes_with_swap)
1. [ArchWiki - Dm-crypt - Specialties - Discad/TRIM support for SSD](https://wiki.archlinux.org/index.php/Dm-crypt/Specialties#Discard/TRIM_support_for_solid_state_drives_(SSD))
1. [ArchWiki - GRUB - UEFI systems](https://wiki.archlinux.org/index.php/GRUB#UEFI_systems)
1. [ArchWiki - GRUB - Configuration](https://wiki.archlinux.org/index.php/GRUB#Configuration)
1. [ArchWiki - GRUB - Encrypted boot](https://wiki.archlinux.org/index.php/GRUB#Encrypted_/boot)
1. [Man pages - pacman](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/pacman/pacman.8.en)
1. [Man pages - grub-install](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/grub/grub-install.8.en)
1. [Man pages - grub-mkconfig](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/grub/grub-mkconfig.8.en)

---

## EFI configuration

TODO

---

## Reboot

```bash
$ exit
$ umount -R /mnt
$ reboot
```

### References
{: .no_toc .text-delta .pt-4}

1. [ArchWiki - Installation guide - Reboot](https://wiki.archlinux.org/index.php/Installation_guide#Reboot)
