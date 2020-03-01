---
layout: default
title: Lvm with raid1
nav_order: 3
parent: 06 Boot setup
permalink: /boot-setup/lvm-with-raid1/
---

# Boot setup for LVM with RAID1
{: .no_toc}

---

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

## Create the keys for root and home containers

### Create the keyfiles
{: .no_toc .pt-2}

```bash
# Create the keys directory with read/write/execution permissions
$ mkdir -m 700 /etc/luks-keys

# Create the keys
$ dd if=/dev/random of=/etc/luks-keys/root bs=512 count=4 iflag=fullblock
$ dd if=/dev/random of=/etc/luks-keys/home bs=512 count=4 iflag=fullblock
```

### Change permissions
{: .no_toc .pt-4}

```bash
$ chmod 600 /etc/luks-keys/root
$ chmod 600 /etc/luks-keys/home
$ chmod 600 /boot/initramfs-linux*
```

### Add the root keyfile to cryptsetup
{: .no_toc .pt-4}

```bash
$ cryptsetup luksAddKey /dev/mapper/root /etc/luks-keys/root
```

### References
{: .no_toc .text-delta .pt-4}

1. [ArchWiki - Dm-crypt - Device encryption - Unlocking the root partition at boot](https://wiki.archlinux.org/index.php/Dm-crypt/Device_encryption#Unlocking_the_root_partition_at_boot)
1. [Man page - mkdir](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/coreutils/mkdir.1.en)
1. [Man page - dd](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/coreutils/dd.1.en)
1. [Man page - chmod](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/coreutils/chmod.1.en)
1. [Man page - cryptsetup](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/cryptsetup/cryptsetup.8.en)

---

## Encrypting Home logical volume

```bash
# Create the container
$ cryptsetup luksFormat -v /dev/grp/crypthome /etc/luks-keys/home

# Open the container
$ cryptsetup -d /etc/luks-keys/home open /dev/MyVolGroup/crypthome home

# Format with Ext4 filesystem
$ mkfs.ext4 /dev/mapper/home

# Mount home
$ mount /dev/mapper/home /home
```

### References
{: .no_toc .text-delta .pt-4}

1. [ArchWiki - Dm-crypt - Encrypting an entire system - Encrypting home logical volume](https://wiki.archlinux.org/index.php/Dm-crypt/Encrypting_an_entire_system#Encrypting_logical_volume_/home)
1. [Man page - cryptsetup](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/cryptsetup/cryptsetup.8.en)
1. [Man page - mkfs.ext4](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/e2fsprogs/mkfs.ext4.8.en)
1. [Man page - mount](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/util-linux/mount.8.en)

---

## Configuring fstab and crypttab

/etc/crypttab
{: .fs-3 .mb-0}

```bash
swap      /dev/grp/cryptswap      /dev/urandom	             swap,cipher=aes-xts-plain64,size=256
home      /dev/grp/crypthome      /etc/luks-keys/home
```

/etc/fstab
{: .fs-3 .pt-2 .mb-0}

```bash
/dev/mapper/swap      none        swap        sw              0 0
/dev/mapper/home      /home       ext4        defaults        0 2
```

### References
{: .no_toc .text-delta .pt-4}

1. [ArchWiki - Dm-crypt - System configuration - crypttab](https://wiki.archlinux.org/index.php/Dm-crypt/System_configuration#crypttab)
1. [ArchWiki - Fstab](https://wiki.archlinux.org/index.php/Fstab)

---

## Initial RAM filesystem

### Edit the configuration
{: .no_toc .pt-2}

/etc/mkinitcpio.conf
{: .fs-3 .pt-2 .mb-0}

```bash
FILES=(/etc/luks-keys/root)
HOOKS=(base udev autodetect modconf block lvm2 encrypt filesystems keyboard keymap fsck)
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
1. [ArchWiki - Dm-crypt - Encrypting an entire system - LVM on LUKS](https://wiki.archlinux.org/index.php/Dm-crypt/Encrypting_an_entire_system#LVM_on_LUKS)
1. [ArchWiki - Dm-crypt - Encrypting an entire system - Encrypted boot partition with GRUB](https://wiki.archlinux.org/index.php/Dm-crypt/Encrypting_an_entire_system#Encrypted_boot_partition_(GRUB))
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
GRUB_CMDLINE_LINUX_DEFAULT="cryptdevice=UUID=(device-UUID):root cryptkey=rootfs:/etc/luks-keys/root root=/dev/mapper/root loglevel=3 quiet"
GRUB_ENABLE_CRYPTODISK=y
```

#### TRIM
{: .no_toc .pt-2}

```bash
GRUB_CMDLINE_LINUX_DEFAULT="cryptdevice=UUID=(device-UUID):root:allow-discards cryptkey=rootfs:/etc/luks-keys/root root=/dev/mapper/root loglevel=3 quiet"
GRUB_ENABLE_CRYPTODISK=y
```

### Install GRUB
{: .no_toc .pt-4}

```bash
$ grub-install --target=x86_64-efi --efi-directory=/efi1 --bootloader-id=GRUB --recheck
```

### Generate the configuration
{: .no_toc .pt-4}

```bash
$ grub-mkconfig -o /boot/grub/grub.cfg
```

#### References
{: .no_toc .text-delta .pt-4}

1. [ArchWiki - Dm-crypt - Encrypting an entire system - LVM on LUKS](https://wiki.archlinux.org/index.php/Dm-crypt/Encrypting_an_entire_system#LVM_on_LUKS)
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

#### References
{: .no_toc .text-delta .pt-4}

1. [ArchWiki - Installation guide - Reboot](https://wiki.archlinux.org/index.php/Installation_guide#Reboot)
