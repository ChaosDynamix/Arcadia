---
layout: default
title: 05 Configuration
nav_order: 6
permalink: /configuration/
---

# Configuration
{: .no_toc .d-inline-block}

CFG
{: .label .mx-2}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

## Time zone

### Create symbolic link
{: .no_toc .pt-2}

```bash
$ ln -sf /usr/share/zoneinfo/Region/City /etc/localtime
```

### Synchronize the hardware clock with the system clock
{: .no_toc .pt-4}

```bash
$ hwclock --systohc --utc
```

### References
{: .no_toc .text-delta .pt-4}

1. [Wikipedia - Time zone](https://en.wikipedia.org/wiki/Time_zone)
1. [Wikipedia - System time](https://en.wikipedia.org/wiki/System_time)
1. [Wikipedia - Real time clock](https://en.wikipedia.org/wiki/Real-time_clock)
1. [ArchWiki - Installation guide - Time zone](https://wiki.archlinux.org/index.php/Installation_guide#Time_zone)
1. [ArchWiki - System time - Time zone](https://wiki.archlinux.org/index.php/System_time#Time_zone)
1. [ArchWiki - System time - Hardware clock](https://wiki.archlinux.org/index.php/System_time#Hardware_clock)
1. [Man pages - ln](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/coreutils/ln.1.en)
1. [Man pages - hwclock](https://jlk.fjfi.cvut.cz/arch/manpages/man/hwclock.8)

---

## Localization

### Select needed locales
{: .no_toc .pt-2}

/etc/locale.gen
{: .fs-3 .mb-0}

```bash
# Uncomment the needed locales
fr_FR.UTF-8 UTF-8
en_US.UTF-8 UTF-8
```

### Generate locales
{: .no_toc .pt-4}

```bash
$ locale-gen
```

### Set the system locale
{: .no_toc .pt-4}

/etc/locale.conf
{: .fs-3 .mb-0}

```bash
LANG=fr_FR.UTF-8
LC_COLLATE=C
```

### Set the console locale
{: .no_toc .pt-4}

/etc/vconsole.conf
{: .fs-3 .mb-0}

```bash
KEYMAP=fr-latin9
```

### References
{: .no_toc .text-delta .pt-4}

1. [ArchWiki - Installation guide - Localization](https://wiki.archlinux.org/index.php/Installation_guide#Localization)
1. [ArchWiki - Locale](https://wiki.archlinux.org/index.php/Locale)
1. [ArchWiki - Linux console - Keyboard configuration](https://wiki.archlinux.org/index.php/Linux_console/Keyboard_configuration)

---

## Network

### Set the hostname
{: .no_toc .pt-2}

/etc/hostname
{: .fs-3 .mb-0}

```bash
myhostname
```

### Set the hosts
{: .no_toc .pt-4}

/etc/hosts
{: .fs-3 .mb-0}

```bash
127.0.0.1   localhost
::1         localhost
127.0.1.1   myhostname.localdomain	myhostname
```

### Install a manager
{: .no_toc .pt-4}

```bash
$ pacman -S networkmanager
$ systemctl enable NetworkManager
```

### References
{: .no_toc .text-delta .pt-4}

1. [ArchWiki - Installation guide - Network configuration](https://wiki.archlinux.org/index.php/Installation_guide#Network_configuration)
1. [ArchWiki - Network configuration - Set the hostname](https://wiki.archlinux.org/index.php/Network_configuration#Set_the_hostname)
1. [ArchWiki - Network configuration - Network managers](https://wiki.archlinux.org/index.php/Network_configuration#Network_managers)
1. [ArchWiki - NetworkManager](https://wiki.archlinux.org/index.php/NetworkManager)
1. [ArchWiki - Systemctl - Basic systemctl usage](https://wiki.archlinux.org/index.php/Systemd#Basic_systemctl_usage)
1. [Man pages - systemctl](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/systemd/systemctl.1.en)

---

## Accounts

### Change the root password
{: .no_toc .pt-2}

```bash
$ passwd
```

### Create the user and his password
{: .no_toc .pt-4}

```bash
# Account
$ useradd -m -G wheel -s /bin/bash username

# Password
$ passwd username
```

### Allow the wheel group to use sudo
{: .no_toc .pt-4}

visudo
{: .fs-3 .mb-0}

```bash
# Uncomment the line below
%wheel ALL=(ALL) ALL
```

### References
{: .no_toc .text-delta .pt-4}

1. [ArchWiki - Installation guide - Root password](https://wiki.archlinux.org/index.php/Installation_guide#Root_password)
1. [ArchWiki - Users and groups - User management](https://wiki.archlinux.org/index.php/Users_and_groups#User_management)
1. [ArchWiki - Sudo](https://wiki.archlinux.org/index.php/Sudo)
1. [Man pages - useradd](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/shadow/useradd.8.en)
1. [Man pages - passwd](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/shadow/passwd.1.en)

---

## Initial RAM filesystem

### Edit the configuration
{: .no_toc .pt-2}

#### LVM
{: .no_toc .py-2}

/etc/mkinitcpio.conf
{: .fs-3 .mb-0}

```bash
FILES=(/etc/luks-keys/root)
HOOKS=(base udev autodetect modconf block encrypt lvm2 filesystems keyboard keymap fsck)
```

#### BTRFS
{: .no_toc .pt-4 .pb-2}

/etc/mkinitcpio.conf
{: .fs-3 .mb-0}

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
1. [ArchWiki - Dm-crypt - Encrypting an entire system - LVM on LUKS](https://wiki.archlinux.org/index.php/Dm-crypt/Encrypting_an_entire_system#LVM_on_LUKS)
1. [ArchWiki - Dm-crypt - Encrypting an entire system - Encrypted boot partition with GRUB](https://wiki.archlinux.org/index.php/Dm-crypt/Encrypting_an_entire_system#Encrypted_boot_partition_(GRUB))
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

#### LVM
{: .no_toc .py-2}

/etc/default/grub
{: .fs-3 .mb-0}

```bash
GRUB_CMDLINE_LINUX_DEFAULT="cryptdevice=UUID=(device-UUID):lvm root=/dev/grp/root loglevel=3 quiet"
GRUB_ENABLE_CRYPTODISK=y
```

#### BTRFS
{: .no_toc .pt-4 .pb-2}

/etc/default/grub
{: .fs-3 .mb-0}

```bash
GRUB_CMDLINE_LINUX_DEFAULT="cryptdevice=UUID=(device-UUID):btrfs loglevel=3 quiet"
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

1. [ArchWiki - Dm-crypt - Encrypting an entire system - LVM on LUKS](https://wiki.archlinux.org/index.php/Dm-crypt/Encrypting_an_entire_system#LVM_on_LUKS)
1. [ArchWiki - Dm-crypt - Encrypting an entire system - Btrfs subvolumes with Swap](https://wiki.archlinux.org/index.php/Dm-crypt/Encrypting_an_entire_system#Btrfs_subvolumes_with_swap)
1. [ArchWiki - GRUB - UEFI systems](https://wiki.archlinux.org/index.php/GRUB#UEFI_systems)
1. [ArchWiki - GRUB - Configuration](https://wiki.archlinux.org/index.php/GRUB#Configuration)
1. [ArchWiki - GRUB - Encrypted boot](https://wiki.archlinux.org/index.php/GRUB#Encrypted_/boot)
1. [Man pages - pacman](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/pacman/pacman.8.en)
1. [Man pages - grub-install](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/grub/grub-install.8.en)
1. [Man pages - grub-mkconfig](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/grub/grub-mkconfig.8.en)
