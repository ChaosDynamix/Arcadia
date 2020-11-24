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

## Download the Arch Linux ISO image, checksum and signature

### Identify the closest mirrors for your location
1. Open your browser and go to the [Arch Linux pacman mirrorlist generator](https://www.archlinux.org/mirrorlist/)
1. Filter the mirrors according to **your country** (or a country close to yours) and **HTTPS** protocol
1. Generate the list

### Download the ISO image, checksum and signature
1. Open your browser and go to the [Arch Linux download page](https://www.archlinux.org/download/)
1. Under the HTTP Direct Downloads section :
    1. Copy the **SHA-1** checksum in your clipboard
    1. Download the **PGP** signature.
    1. Click on a **HTTPS** mirror site of your generated list
1. Download the Arch Linux ISO image `archlinux-year.day.month-x86_64.iso`

### References
{: .text-delta .pt-4}

1. [Wikipedia - Mirror site](https://en.wikipedia.org/wiki/Mirror_site)
1. [Wikipedia - Cheksum](https://en.wikipedia.org/wiki/Checksum)
1. [Wikipedia - Digital signature](https://en.wikipedia.org/wiki/Digital_signature)
{: .fs-3}

---

## Verify the Arch Linux ISO image

| Required files in the same folder         | Description |
| :---------------------------------------- | :---------- |
| `archlinux-year.month.day-x86_64.iso`     | ISO image   |
| `archlinux-year.month.day-x86_64.iso.sig` | Signature   |

### Create the checksum and verify the integrity of the ISO image

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

## Generate the mirrorlist with Reflector

Reflector is a script which can retrieve the latest mirror list from the MirrorStatus page, filter the most up-to-date mirrors, sort them by speed and overwrite the file `/etc/pacman.d/mirrorlist`.

### Run the reflector script
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

---

## Create the partition table and the partitions

### Identify the device file of your storage device

| Device type                           | Device file         | Partition file          |
| :------------------------------------ | :------------------ | :---------------------- |
| SCSI/PATA/SATA & USB/IEEE 1394 device | sda, sdb...         | sda1, sda2...           |
| IDE device                            | hda, hdb...         | hda1, hda2...           |
| NVMe device                           | nvme0, nvme1...     | nvme0n1p1, nvme0n1p2... |
| SD Cards, eMMC chips etc...           | mmcblk0, mmcblk1... | mmcblk0p1, mmcblk0p2... |

Fdisk is a dialog-driven program for creation and manipulation of partition tables. The `-l` argument ask fdisk to list the partition tables for the devices and then exit.

```
fdisk -l
```

### Launch the Sgdisk script

| Partition node | Partition type       | Partition size          |
| :------------- | :------------------- | :---------------------- |
| /dev/nvme0n1p1 | EFI system partition | 550 MiB                 |
| /dev/nvme0n1p2 | Linux LUKS partition | All the space remaining |

Sgdisk is the command-line version of gdisk program. GPT fdisk (aka gdisk) is a text-mode menu-driven program for creation and manipulation of partition tables.

```
sgdisk --clear \
       --new 1:0:+550M \
       --new 2:0:0 \
       --typecode 1:ef00 \
       --typecode 2:8309 \
       /dev/nvme0n1
```

### References
{: .text-delta .pt-4}

1. [Wikipedia - Device file](https://en.wikipedia.org/wiki/Device_file)
1. [Wikipedia - Disk partitioning](https://en.wikipedia.org/wiki/Disk_partitioning)
1. [Wikipedia - Partition table](https://en.wikipedia.org/wiki/Partition_table)
1. [Wikipedia - GUID partition table](https://en.wikipedia.org/wiki/GUID_Partition_Table)
1. [ArchWiki - GPT fdisk](https://wiki.archlinux.org/index.php/GPT_fdisk)
1. [ManPage - Fdisk](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/util-linux/fdisk.8.en)
1. [ManPage - Sgdisk](https://jlk.fjfi.cvut.cz/arch/manpages/man/extra/gptfdisk/sgdisk.8.en)
{: .fs-3}

---

## Encrypt the root partition

Replace every occurence of `/dev/nvme0n1p2` with your device name.

### Create the LUKS2 container
```
cryptsetup luksFormat /dev/nvme0n1p2
```

**Note**: Passwords must be complex enough to not be easily guessed from e.g. personal information, or cracked using methods like social engineering or brute-force attacks. The tenets of strong passwords are based on length and randomness.
{: .fs-3}

### Open the LUKS2 container
```
cryptsetup open /dev/nvme0n1p2 cryptroot
```

### References
{: .text-delta .pt-4}

1. [Wikipedia - Encryption](https://en.wikipedia.org/wiki/Encryption)
1. [Wikipedia - Dm-crypt](https://en.wikipedia.org/wiki/Dm-crypt)
1. [Wikipedia - LUKS](https://en.wikipedia.org/wiki/Linux_Unified_Key_Setup)
1. [ArchWiki - Dm-crypt/Device encryption](https://wiki.archlinux.org/index.php/Dm-crypt/Device_encryption)
1. [ArchWiki - Dm-crypt/Encrypting an entire system](https://wiki.archlinux.org/index.php/Dm-crypt/Encrypting_an_entire_system)
1. [ManPage - Cryptsetup](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/cryptsetup/cryptsetup.8.en)
{: .fs-3}

---

## Create the filesystems

| Partition node | Filesystem | Label |
| :------------- | :--------- | :---- |
| /dev/nvme0n1p1 | Fat32      | BOOT  |
| /dev/nvme0n1p2 | Ext4       | ROOT  |

```
mkfs.ext4 -L ROOT /dev/mapper/cryptroot
mkfs.fat -F32 -n BOOT /dev/nvme0n1p1
```

### References
{: .text-delta .pt-4}

1. [ArchWiki - Installation guide](https://wiki.archlinux.org/index.php/Installation_guide#Format_the_partitions)
1. [ArchWiki - Filesystems](https://wiki.archlinux.org/index.php/File_systems)
1. [ArchWiki - Dm-crypt/Encrypting an entire system](https://wiki.archlinux.org/index.php/Dm-crypt/Encrypting_an_entire_system)
1. [ArchWiki - EFI system partition](https://wiki.archlinux.org/index.php/EFI_system_partition)
1. [ManPage - Mkfs](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/util-linux/mkfs.8.en)
{: .fs-3}

---

## Mount the filesystems

| Partition node | Mountpoint | Create directory ? |
| :------------- | :--------- | :----------------- |
| /dev/nvme0n1p1 | /mnt/boot  | yes                |
| /dev/nvme0n1p2 | /mnt       | no                 |

```
mount /dev/mapper/cryptroot /mnt
mkdir /mnt/boot
mount /dev/nvme0n1p1 /mnt/boot
```

### References
{: .text-delta .pt-4}

1. [ArchWiki - Installation guide](https://wiki.archlinux.org/index.php/Installation_guide#Mount_the_file_systems)
1. [ManPage - Mount](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/man-pages/mount.2.en)
1. [ManPage - Mkdir](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/coreutils/mkdir.1.en)
{: .fs-3}
