---
title     : !!str Preparation
parent    : !!str Arch Linux
nav_order : !!int 1
permalink : !!str /arch-linux/preparation
---

# {{ page.title }}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

## Download and verify the Arch Linux ISO image

Replace every occurence of `year.month.day` in the filenames with the current Arch Linux current release name found in the official download page.
{: .text-red-200}

| Required files                            | Description |
| :---------------------------------------- | :---------- |
| archlinux-year.month.day-x86_64.iso       | ISO image   |
| archlinux-year.month.day-x86_64.iso.txt   | Checksum    |
| archlinux-year.month.day-x86_64.iso.sig   | Signature   |

### Identify the best mirrors for your location
1. Open your browser and go to the [Arch Linux pacman mirrorlist generator](https://www.archlinux.org/mirrorlist/)
1. Filter the mirrors according to **your country** (or a country close to yours) and **HTTPS** protocol
1. Generate the list

### Download the ISO image
1. Open your browser and go to the [Arch Linux download page](https://www.archlinux.org/download/)
1. Under the HTTP Direct Downloads section, select a **HTTPS** mirror site of your generated list
1. Download the Arch Linux ISO image `archlinux-year.day.month-x86_64.iso`

### Download the checksum and signature
1. Open your browser and go to the [Arch Linux download page](https://www.archlinux.org/download/)
1. Under the HTTP Direct Downloads section, copy the **SHA-1** checksum in your clipboard
1. Under the HTTP Direct Downloads section, download the **PGP** signature.

### Verify the integrity of the ISO image

The creation of the checksum file must be made in the same folder containing the ISO image and the Signature file.

```
echo "<CHECKSUM> archlinux-year.month.day-x86_64.iso" > archlinux-year.month.day-x86_64.iso.txt
sha1sum -c archlinux-year.month.day-x86_64.iso.txt
```

**Note**: Replace `<CHECKSUM>` with the SHA-1 checksum copied in the Arch Linux download page.
{: .fs-3}

### Verify the authenticity of the ISO image
```
gpg --keyserver-options auto-key-retrieve \
    --keyserver pool.sks-keyservers.net \
    --verify archlinux-year.month.day-x86_64.iso.sig
```

**Note**: Arch Linux users can run the following command instead : `pacman-key -v archlinux-year.month.day-x86_64.iso.sig`
{: .fs-3}


### References
{: .text-delta .pt-4}

1. [Wikipedia - Mirror site](https://en.wikipedia.org/wiki/Mirror_site)
1. [Wikipedia - Cheksum](https://en.wikipedia.org/wiki/Checksum)
1. [Wikipedia - Digital signature](https://en.wikipedia.org/wiki/Digital_signature)
1. [ArchWiki - Installation guide](https://wiki.archlinux.org/index.php/Installation_guide#Verify_signature)
1. [ArchWiki - GnuPG](https://wiki.archlinux.org/index.php/GnuPG#Use_a_keyserver)
1. [ManPage - Md5sum](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/coreutils/md5sum.1.en)
1. [ManPage - Sha1sum](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/coreutils/sha1sum.1.en)
1. [ManPage - Gpg](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/gnupg/gpg.1.en)
1. [SKS keyservers](https://sks-keyservers.net/)
{: .fs-3}

---

## Flash the USB flash device

### Identify the correct USB flash device
```
fdisk -l
```

### Copy the Arch Linux ISO image on the USB flash device
```
cp path/to/archlinux-year.month.day-x86_64.iso /dev/sdx
sync
```

**Note**: Replace `path/to/archlinux-year.month.day-x86_64.iso` and `/dev/sdx` accordingly.
{: .fs-3}

### References
{: .text-delta .pt-4}

1. [Wikipedia - USB flash drive](https://en.wikipedia.org/wiki/USB_flash_drive)
1. [ArchWiki - USB flash installation media](https://wiki.archlinux.org/index.php/USB_flash_installation_media)
1. [ArchWiki - Core utilities](https://wiki.archlinux.org/index.php/Core_utilities)
1. [ManPage - Cp](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/coreutils/cp.1.en)
1. [ManPage - Sync](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/coreutils/sync.1.en)
{: .fs-3}

---

## Boot the USB flash device

In order to boot on the USB device, you need to modify the firmware configuration with the firmware setup utility.

1. Turn on your computer
1. When asked, press the key to enter your firmware setup utility
1. Change the boot order and put your USB device in the first position
1. Save changes and reboot
1. Select `boot Arch Linux (X86_64)` or `Arch Linux archiso X86_64 UEFI CD`

**Note**: If asked during the boot sequence (by pressing a key), you can temporarily select and boot on a device. Don't follow this procedure if you are in this scenario.
{: .fs-3}

### References
{: .text-delta .pt-4}

1. [Wikipedia - Firmware](https://en.wikipedia.org/wiki/Firmware)
1. [Wikipedia - BIOS](https://en.wikipedia.org/wiki/BIOS)
1. [Wikipedia - UEFI](https://en.wikipedia.org/wiki/Unified_Extensible_Firmware_Interface)
{: .fs-3}

---

## Verify the keyboard layout

The default console keymap is US. **Skip this step if your keyboard layout match the default one**.

![Representation of the US default keyboard layout for Arch Linux](https://upload.wikimedia.org/wikipedia/commons/5/51/KB_United_States-NoAltGr.svg)

### Load the correct keyboard layout
```
loadkeys fr-latin9
```

**Note**: The command above load the French keyboard layout. If you need an other keyboard layout, list all the available keyboard layouts with the command `ls /usr/share/kbd/keymaps/**/*.map.gz | less` and replace `fr-latin9` in the above command.
{: .fs-3}

### References
{: .text-delta .pt-4}

1. [Wikipedia - Keyboard layout](https://en.wikipedia.org/wiki/Keyboard_layout)
1. [ArchWiki - Keyboard configuration](https://wiki.archlinux.org/index.php/Linux_console/Keyboard_configuration)
1. [ManPage - Ls](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/coreutils/ls.1.en)
1. [ManPage - Less](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/less/less.1.en)
1. [ManPage - Grep](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/grep/grep.1.en)
1. [ManPage - Loadkeys](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/kbd/loadkeys.1.en)
{: .fs-3}

---

## Verify the boot mode of the live environment

UEFI firmware is required to follow this guide. This guide don't cover BIOS and UEFI-CSM modes. Make sure that EFI variables are available with the following command.

```
ls /sys/firmware/efi/efivars
```

| Firmware / mode    | Result            |
| :----------------- | :---------------- |
| UEFI               | List of variables |
| UEFI with CSM mode | No directory      |
| BIOS               | No directory      |

### References
{: .text-delta .pt-4}

1. [Wikipedia - Firmware](https://en.wikipedia.org/wiki/Firmware)
1. [Wikipedia - BIOS](https://en.wikipedia.org/wiki/BIOS)
1. [Wikipedia - UEFI](https://en.wikipedia.org/wiki/Unified_Extensible_Firmware_Interface)
1. [ArchWiki - UEFI](https://wiki.archlinux.org/index.php/Unified_Extensible_Firmware_Interface)
1. [ManPage - Ls](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/coreutils/ls.1.en)
{: .fs-3}

---

## Setup the live environment network

### Ensure your network interface is listed and enabled
```
ip link
```

**Note**: The UP in `<BROADCAST,MULTICAST,UP,LOWER_UP>` is what indicates the interface is up, not the later `state DOWN`.
{: .fs-3}

### Check connectivity
```
ping -c 3 archlinux.org
```

### Update the system clock
```
timedatectl set-ntp true
```

### References
{: .text-delta .pt-4}

1. [Wikipedia - Computer network](https://en.wikipedia.org/wiki/Computer_network)
1. [ArchWiki - Network configuration](https://wiki.archlinux.org/index.php/Network_configuration)
1. [ArchWiki - System time](https://wiki.archlinux.org/index.php/System_time)
1. [ManPage - Ip](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/man-pages/ip.7.en)
1. [ManPage - Ping](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/iputils/ping.8.en)
1. [ManPage - Timedatectl](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/systemd/timedatectl.1.en)
{: .fs-3}

---

## Enable the SSH connection
{: .d-inline-block .mt-0}

OPTIONAL
{: .label .label-blue}

Secure Shell (SSH) is a cryptographic network protocol for operating network services securely over an unsecured network. Typical applications include remote command-line login and remote command execution, but any network service can be secured with SSH.

In this context, SSH daemon can be started to allow other systems to connect into the current live environment. It can be useful if you want to display this website and copy and paste commands.

### Get the ip address of your network interface
```
ip address show dev eno1
```

**Caution**: Replace `eno1` if your network interface name is different.
{: .fs-3 .text-red-200}

### Set the root password
```
passwd
```

### Start the SSH daemon
```
systemctl start sshd.service
```

### Connect another system into the current live environment
```
ssh root@192.168.1.10
```

**Caution**: Replace `192.168.1.10` if your ip address is different.
{: .fs-3 .text-red-200}

### References
{: .text-delta .pt-4}

1. [Wikipedia - Computer network](https://en.wikipedia.org/wiki/Computer_network)
1. [ArchWiki - Network configuration](https://wiki.archlinux.org/index.php/Network_configuration#IP_addresses)
1. [ArchWiki - Secure shell](https://wiki.archlinux.org/index.php/Secure_Shell)
1. [ArchWiki - OpenSSH](https://wiki.archlinux.org/index.php/OpenSSH#Server_usage)
1. [ManPage - Ip-address](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/iproute2/ip-address.8.en)
{: .fs-3}

---

## Update the Arch Linux keyring

The arch linux keyring holds all the signatures related to the packages. During the installation, a package is verified against this keyring to ensure that the downloaded file is properly signed. This keyring need to be updated in order to delete revoked keys and add new trusted keys.

### Update the keys

```
pacman -Sy archlinux-keyring
```

**Note**: Running `pacman -Sy` instead of `pacman -Syu` is not recommended as this could lead to dependency issues. However we are not able to update the live environment due to it's immutable state.
{: .fs-3}

### References
{: .text-delta .pt-4}

1. [Wikipedia - Keyring](https://en.wikipedia.org/wiki/Keyring_(cryptography))
1. [ArchWiki - Keyring package](https://wiki.archlinux.org/index.php/DeveloperWiki:Keyring_Package)
1. [ArchWiki - Pacman](https://wiki.archlinux.org/index.php/Pacman)
{: .fs-3}

---

## Generate the mirrorlist

### Install the reflector package

Reflector is a script which can retrieve the latest mirror list from the MirrorStatus page, filter the most up-to-date mirrors, sort them by speed and overwrite the file `/etc/pacman.d/mirrorlist`.

```
pacman -S reflector
```

### Launch the reflector script with your arguments

```
reflector --country France \
          --age 15 \
          --protocol https \
          --sort rate \
          --save /etc/pacman.d/mirrorlist
```

**Note**: Check the man page of the reflector package for more informations about the arguments.
{: .fs-3}

### Check the result of the script
```
cat /etc/pacman.d/mirrorlist
```

**Note**: If the script worked as intended, the header of the file should be : **Arch Linux mirrorlist generated by Reflector**.
{: .fs-3}

### References
{: .text-delta .pt-4}

1. [ArchWiki - Mirrors](https://wiki.archlinux.org/index.php/Mirrors)
1. [ArchWiki - Reflector](https://wiki.archlinux.org/index.php/Reflector)
1. [ArchWiki - Pacman](https://wiki.archlinux.org/index.php/Pacman)
1. [ManPage - Reflector](https://jlk.fjfi.cvut.cz/arch/manpages/man/community/reflector/reflector.1.en) 
1. [ManPage - Cat](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/coreutils/cat.1.en)
{: .fs-3}
