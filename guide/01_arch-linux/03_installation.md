---
title     : !!str Installation
parent    : !!str Arch Linux
nav_order : !!int 3
permalink : !!str /arch-linux/installation
---

# {{ page.title }}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

## Install the essential packages

### Select the packages 

1. Select a [Linux kernel](https://wiki.archlinux.org/index.php/Kernel)
1. Select a [Text editor](https://wiki.archlinux.org/index.php/List_of_applications#Text_editors)
1. Select a [Privilege elevation program](https://wiki.archlinux.org/index.php/List_of_applications#Privilege_elevation)

### Install the packages with pacstrap

Pacstrap is designed to create a new system installation from scratch. The specified packages will be installed into a given directory after setting up some basic mountpoints. By default, the host system’s pacman signing keys and mirrorlist will be used to seed the chroot.

```
pacstrap /mnt base linux-lts linux-firmware opendoas neovim man-db man-pages
```

**Note**: `base` package is mandatory. `linux-firmware` package is recommended. The other packages are based on my personal choices.
{: .fs-3}

### References
{: .text-delta .pt-4}

1. [ArchWiki - Kernel](https://wiki.archlinux.org/index.php/Kernel)
1. [ArchWiki - Installation guide](https://wiki.archlinux.org/index.php/Installation_guide)
1. [ManPage - Pacstrap](https://jlk.fjfi.cvut.cz/arch/manpages/man/extra/arch-install-scripts/pacstrap.8.en)
{: .fs-3}

---

## Generate the filesystem table

genfstab helps fill in an fstab file by autodetecting all the current mounts below a given mountpoint and printing them in fstab-compatible format to standard output.

It can be used to persist a manually mounted filesystem hierarchy and is often used during the initial install and configuration of an OS.

```
genfstab -U /mnt >> /mnt/etc/fstab
```

### References
{: .text-delta .pt-4}

1. [Wikipedia - Fstab](https://en.wikipedia.org/wiki/Fstab)
1. [ArchWiki - Fstab](https://wiki.archlinux.org/index.php/Fstab)
1. [ArchWiki - Installation guide](https://wiki.archlinux.org/index.php/Installation_guide)
1. [ManPage - Genfstab](https://jlk.fjfi.cvut.cz/arch/manpages/man/extra/arch-install-scripts/genfstab.8.en)
{: .fs-3}

---

## Enter the system

arch-chroot wraps the chroot command while ensuring that important functionality is available, e.g. mounting `/dev/`, `/proc` and other API filesystems, or exposing resolv.conf to the chroot. chroot is made for running command or interactive shell with special root directory. 

```
arch-chroot /mnt
```

### References
{: .text-delta .pt-4}

1. [ArchWiki - Chroot](https://wiki.archlinux.org/index.php/Chroot)
1. [ManPage - Arch-chroot](https://jlk.fjfi.cvut.cz/arch/manpages/man/extra/arch-install-scripts/arch-chroot.8.en)
{: .fs-3}

---

## Setup the swapfile
{: .d-inline-block .mt-0}

Optional
{: .label .label-blue .mx-2}

A swap partition/file is not strictly required, but recommended for systems with low RAM. If you want to use hibernation, you will need a swap partition/file. The following table has recommendations for swap partition size.

| System RAM | Recommended swap size  | Swap size if using hibernation |
| :--------- | :--------------------- | :----------------------------- |
| <2GB       | 2x the amount of RAM   | 3x the amount of RAM           |
| 2-8GB      | Equal to amount of RAM | 2x the amount of RAM           |
| 8-64GB     | At least 4GB           | 1.5x the amount of RAM         |
| 64GB       | At least 4GB           | Hibernation not recommended    |

### Create the swapfile
```
dd if=/dev/zero of=/swapfile bs=1M count=4000 status=progress
```

**Note**: This command create a 4GB "swapfile", Replace `count=4000` if you need less or more swap size.
{: .fs-3}

### Set the right permission
```
chmod 600 /swapfile
```

### Format and activate the swapfile
```
mkswap /swapfile
swapon /swapfile
```

### Edit the fstab configuration in `/etc/fstab`
```
/swapfile    none    swap    defaults    0 0
```

### References
{: .text-delta .pt-4}

1. [ArchWiki - Swap](https://wiki.archlinux.org/index.php/Swap#Swap_file)
1. [Void Linux - Swap partition](https://docs.voidlinux.org/installation/live-images/partitions.html)
1. [ManPage - Dd](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/coreutils/dd.1.en)
1. [ManPage - Chmod](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/coreutils/chmod.1.en)
1. [ManPage - Mkswap](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/util-linux/mkswap.8.en)
1. [ManPage - Swapon](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/man-pages/swapon.2.en)
{: .fs-3}

---

## Setup the timezone

This following command create an `/etc/localtime` symlink that points to a zoneinfo file under `/usr/share/zoneinfo/`.

```
ln -sf /usr/share/zoneinfo/Europe/Paris /etc/localtime
```

**Note**: This command set the Paris timezone, if you are living in a different area, run `ls /usr/share/zoneinfo/` to select your location and replace `Europe/Paris` in the above command.
{: .fs-3}

#### References
{: .text-delta .pt-4}

1. [Wikipedia - Timezone](https://en.wikipedia.org/wiki/Time_zone)
1. [ArchWiki - Installation guide](https://wiki.archlinux.org/index.php/Installation_guide)
1. [ManPage - Ln](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/coreutils/ln.1.en)
1. [ManPage - Ls](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/coreutils/ls.1.en)
{: .fs-3}

---

## Set the hardware clock from your system clock

The following sets the hardware clock from the system clock. Additionally it updates `/etc/adjtime` or creates it if not present.

```
$ hwclock --systohc --utc
```

#### References
{: .text-delta .pt-4}

1. [Wikipedia - System time](https://en.wikipedia.org/wiki/System_time)
1. [ArchWiki - Installation guide](https://wiki.archlinux.org/index.php/Installation_guide#Time_zone)
1. [ArchWiki - System time](https://wiki.archlinux.org/index.php/System_time#Hardware_clock_and_system_clock)
1. [ManPage - Hwclock](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/util-linux/hwclock.8.en)
{: .fs-3}

---

## Setup the localization

### Select the needed locales in `/etc/locale.gen`

Uncomment the needed locales

```
fr_FR.UTF-8 UTF-8
```

**Note**: This command select the French locale, if this is not your language, dont uncomment this line and uncomment yours.
{: .fs-3}

### Generate the locales

```
locale-gen
```

### Set the system locale in `/etc/locale.conf`

```
LANG=fr_FR.UTF-8
LC_COLLATE=C
```

**Note**: Setting `LC_COLLATE` variable to `C` make the ls command sort dotfiles first, followed by uppercase and lowercase filenames. To get around potential issues, Arch used to set `LC_COLLATE=C `in `/etc/profile`, but this method is now deprecated.
{: .fs-3}

### Set the console locale

A persistent keymap can be set in `/etc/vconsole.conf`, which is read by systemd on start-up. The `KEYMAP` variable is used for specifying the keymap. If the variable is empty or not set, the us keymap is used as default value.

```
echo KEYMAP=fr-latin9 > /etc/vconsole.conf
```

**Note**: This command set the French keyboard layout, if this is not your keyboard layout, replace `fr-latin9` with yours.
{: .fs-3}

#### References
{: .text-delta .pt-4}

1. [ArchWiki - Installation guide](https://wiki.archlinux.org/index.php/Installation_guide#Localization)
1. [ArchWiki - Locale](https://wiki.archlinux.org/index.php/Locale)
1. [ArchWiki - Linux console / Keyboard configuration](https://wiki.archlinux.org/index.php/Linux_console/Keyboard_configuration)
1. [ManPage - Echo](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/coreutils/echo.1.en)
{: .fs-3}

---

## Setup the network

### Set the hostname in `/etc/hostname`

```
myhostname
```

### Set the hosts in `/etc/hosts`

```
127.0.0.1    localhost
::1          localhost
127.0.1.1    myhostname.localdomain    myhostname
```

### Install and activate the network manager

This guide use a network manager called `networkmanager`, you can use a different one if you want to. Check [this page](https://wiki.archlinux.org/index.php/Network_configuration#Network_managers) for more infos.

```
pacman -S networkmanager
systemctl enable NetworkManager
```

#### References
{: .text-delta .pt-4}

1. [ArchWiki - Installation guide](https://wiki.archlinux.org/index.php/Installation_guide#Network_configuration)
1. [ArchWiki - Network configuration](https://wiki.archlinux.org/index.php/Network_configuration)
1. [ManPage - Pacman](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/pacman/pacman.8.en)
1. [ManPage - Systemctl](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/systemd/systemctl.1.en)
{: .fs-3}

---

## Enable periodic TRIM
{: .d-inline-block .mt-0}

SOLID STATE DRIVE
{: .label .label-blue}

### Check if your Solid State Drive has TRIM support
{: .mt-2}

DISC-GRAN (discard granularity) and DISC-MAX (discard max bytes) columns must show non-zero values.

```
lsblk --discard
```

### Activate weekly fstrim service
```
systemctl enable fstrim.timer
```

#### References
{: .text-delta .pt-4}

1. [ArchWiki - Solid state drive / TRIM](https://wiki.archlinux.org/index.php/Solid_state_drive#TRIM)
1. [ManPage - Lsblk](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/util-linux/lsblk.8.en)
1. [ManPage - Systemctl](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/systemd/systemctl.1.en)
{: .fs-3}

---

## Setup the users

Passwords must be complex enough to not be easily guessed from e.g. personal information, or cracked using methods like social engineering or brute-force attacks. The tenets of strong passwords are based on length and randomness.

### Add a root password

```
passwd
```

### Create a user

```
useradd -m -G wheel -s /bin/bash username
passwd username
```

#### References
{: .text-delta .pt-4}

1. [ArchWiki - Installation guide](https://wiki.archlinux.org/index.php/Installation_guide#Root_password)
1. [ArchWiki - Users and group](https://wiki.archlinux.org/index.php/Users_and_groups#User_management)
1. [ManPage - Passwd](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/shadow/passwd.1.en)
1. [ManPage - Useradd](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/shadow/useradd.8.en)
{: .fs-3}

---

## Setup the keyfile

### Create the keys directory
```
mkdir -m 700 /etc/luks-keys
```

### Generate the key
```
dd bs=512 count=4 if=/dev/random of=/etc/luks-keys/cryptroot.keyfile iflag=fullblock
```

### Change the permissions
```
chmod 600 /etc/luks-keys/cryptroot.keyfile
chmod 600 /boot/initramfs-linux-lts*
```

**Caution**: If you are running a different kernel, replace `/boot/initramfs-linux-lts*` in the above command. 
{: .fs-3 .text-red-200}

### Add the keyfile in the container
```
cryptsetup luksAddKey /dev/nvme0n1p2 /etc/luks-keys/cryptroot.keyfile
```

**Caution**: Replace `/dev/nvme0n1p2` if you dont have a NVMe device or if the namespace is not the same.
{: .fs-3 .text-red-200}

### Add the keyfile in `/etc/crypttab.initramfs`
```
cryptroot    UUID=device_UUID    /etc/luks-keys/cryptroot.keyfile
```

**Note**: Replace `device_UUID` with the UUID of your device. UUID can be found with `lsblk -f`
{: .fs-3 }

#### References
{: .text-delta .pt-4}

1. [ArchWiki - Dm-crypt / Device encryption](https://wiki.archlinux.org/index.php/Dm-crypt/Device_encryption)
1. [ArchWiki - Dm-crypt / System configuration](https://wiki.archlinux.org/index.php/Dm-crypt/System_configuration#crypttab)
1. [ManPage - Mkdir](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/coreutils/mkdir.1.en)
1. [ManPage - Dd](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/coreutils/dd.1.en)
1. [ManPage - Chmod](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/coreutils/chmod.1.en)
1. [ManPage - cryptsetup](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/cryptsetup/cryptsetup.8.en)
{: .fs-3}

---

## Setup the initial ramdisk images

### Edit the configuration in `/etc/mkinitcpio.conf`
```
FILES=(/etc/luks-keys/cryptroot.keyfile)
HOOKS=(base systemd autodetect modconf block sd-vconsole sd-encrypt filesystems keyboard fsck)
```

### Generate the images
```
mkinitcpio -p linux-lts
```

#### References
{: .text-delta .pt-4}

1. [ArchWiki - Mkinitcpio](https://wiki.archlinux.org/index.php/Mkinitcpio)
1. [ManPage - Mkinitcpio](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/mkinitcpio/mkinitcpio.8.en)
{: .fs-3}

---

## Install the Microcode of your CPU

Processors may have faulty behaviour, which the kernel can correct by updating the microcode on startup.

#### AMD
```
pacman -S amd-ucode
```

#### INTEL
```
pacman -S intel-ucode
```

#### References
{: .text-delta .pt-4}

1. [ArchWiki - Microcode](https://wiki.archlinux.org/index.php/Microcode)
1. [ManPage - Pacman](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/pacman/pacman.8.en)
{: .fs-3}

---

## Setup the boot loader

This guide only cover the **GRUB** boot loader and the **UEFI** mode.

### Install Grub package
```
pacman -S grub efibootmgr
```

**Note**: Efibootmgr is a userspace application used to modify the UEFI Boot Manager. This application can create and destroy boot entries, change the boot order, change the next running boot option, and more.
{: .fs-3}

### Edit the configuration in `/etc/default/grub`
```
GRUB_CMDLINE_LINUX_DEFAULT="rd.luks.options=discard loglevel=3 quiet"
GRUB_ENABLE_CRYPTODISK=y
```

**Caution**:  If your storage device is a NOT a Solid State Drive, remove `rd.luks.options=discard` in the command above. 
{: .fs-3 .text-red-200}

### Install Grub
```
grub-install --target=x86_64-efi --efi-directory=/efi --bootloader-id="Arch Linux"
```

### Generate the Grub configuration
```
grub-mkconfig -o /boot/grub/grub.cfg
```

#### References
{: .text-delta .pt-4}

1. [ArchWiki - Grub](https://wiki.archlinux.org/index.php/GRUB)
{: .fs-3}

---

## Reboot the computer

```
exit
umount -R /mnt
reboot
```
