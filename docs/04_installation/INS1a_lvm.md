---
layout: default
title: LVM
nav_order: 1
parent: 04 Installation
permalink: /installation/lvm/
has_toc: false
---

UEFI
{: .label .label-purple .ml-0}

LUKS1
{: .label .label-purple}

EXT4
{: .label .label-purple}

# Installation guide for LVM
{: .no_toc .mt-2}

| Partition | Mounting point  | Partition type                     | Size     |
| :-------- | :-------------  | :--------------------------------- | :------- |
| /dev/sda1 | /efi            | EFI system partition               | 512M     |
| /dev/sda2 |                 | Linux Logical Volume Manager (LVM) | 100%FREE |

```
+----------------------+---------------------------------+
| EFI system partition | LUKS1 encrypted partition       |
| /efi                 | /dev/mapper/lvm                 |
|                      +---------------------------------+
|                      |                                 |
| /dev/sda1            | /dev/sda2                       |
+----------------------+---------------------------------+
```

```
+--------------------------------------------------------+
|                     Physical volume                    |
|                     /dev/mapper/lvm                    |
+--------------------------------------------------------+
|                      Group volume                      |
|                        /dev/grp/                       |
+------------------+------------------+------------------+
| Logical volume 1 | Logical volume 2 | Logical volume 3 |
| [SWAP]           | /                | /home            |
| /dev/grp/swap    | /dev/grp/root    | /dev/grp/home    |
+------------------+------------------+------------------+
```

---

## Table of contents
{: .no_toc .text-delta .pt-4}

1. TOC
{:toc}

---

## Secure erase
{: .d-inline-block}

IRREVERSIBLE DATA ERASE
{: .label .label-red .mx-2}

Before setting up disk encryption on a (part of a) disk, consider securely wiping it first. This consists of overwriting the entire drive or partition with a stream of zero bytes or random bytes, and is done for one or both of the following reasons

- Prevent recovery of previously stored data
- Prevent disclosure of usage patterns on the encrypted drive

```bash
# Open the container
$ cryptsetup open --type plain -d /dev/urandom /dev/sdX to_be_wiped

# Secure erase the drive
$ dd if=/dev/zero of=/dev/mapper/to_be_wiped status=progress

# Close the container
$ cryptsetup close to_be_wiped
```

### References
{: .no_toc .text-delta .pt-4}

1. [ArchWiki dm-crypt/Drive preparation - Secure erasure of the hard disk drive](https://wiki.archlinux.org/index.php/Dm-crypt/Drive_preparation#Secure_erasure_of_the_hard_disk_drive)
1. [Man page - cryptsetup](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/cryptsetup/cryptsetup.8.en)
1. [Man page - dd](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/coreutils/dd.1.en)

---

## Partitioning

1. Open the tool of your choice
1. Create a GPT partition table
1. Create a partition of 512MiB
1. Change the type of the partition to EFI system `C12A7328-F81F-11D2-BA4B-00A0C93EC93B`
1. Create a partition of all the remaining space of your drive
1. Change the type of the partition to Linux LVM `E6D6D379-F507-44C2-A23C-238F2A3DF928`

### References
{: .no_toc .text-delta .pt-4}

- [Wikipedia - GUID partition table](https://en.wikipedia.org/wiki/GUID_Partition_Table)
- [ArchWiki - Partitioning - Partitioning tools](https://wiki.archlinux.org/index.php/Partitioning#Partitioning_tools)
- [ArchWiki - EFI system partition - Create the partition](https://wiki.archlinux.org/index.php/EFI_system_partition#Create_the_partition)

---

## Encryption

```bash
# Create the container
$ cryptsetup --type luks1 luksFormat /dev/sda2

# Open the container
$ cryptsetup open /dev/sdXY lvm
```

### References
{: .no_toc .text-delta .pt-4}

1. [ArchWiki - Encrypting an entire system - LVM on LUKS](https://wiki.archlinux.org/index.php/Dm-crypt/Encrypting_an_entire_system#LVM_on_LUKS)
1. [ArchWiki - GRUB - Encrypted /boot](https://wiki.archlinux.org/index.php/GRUB#Encrypted_/boot)
1. [Man page - cryptsetup](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/cryptsetup/cryptsetup.8.en)

---

## Logical Volume Manager

See [3] and [4] references for size recommendations

```bash
# Physical volume
$ pvcreate /dev/mapper/lvm

# Volume group
$ vgcreate grp /dev/mapper/lvm

# Logical volumes
$ lvcreate -L 8G grp -n swap
$ lvcreate -L 20G grp -n root
$ lvcreate -l 100%FREE grp -n home
```

#### References
{: .no_toc .text-delta .pt-4}

1. [ArchWiki - LVM on LUKS - Preparing the logical volumes](https://wiki.archlinux.org/index.php/Dm-crypt/Encrypting_an_entire_system#Preparing_the_logical_volumes)
1. [ArchWiki - LVM - Volume operations](https://wiki.archlinux.org/index.php/LVM#Volume_operations)
1. [ArchWiki - Partitioning - Discrete partitions](https://wiki.archlinux.org/index.php/Partitioning#Discrete_partitions)
1. [VOID Linux Partitions Notes - SWAP partitions](https://docs.voidlinux.org/installation/live-images/partitions.html#swap-partitions)
1. [Man page - pvcreate](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/lvm2/pvcreate.8.en)
1. [Man page - vgcreate](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/lvm2/vgcreate.8.en)
1. [Man page - lvcreate](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/lvm2/lvcreate.8.en)

---

## Partitions setup

### Format the partitions
{: .no_toc .pt-2}

```bash
# Format the EXT4 filesystem partitions
$ mkfs.ext4 -L ROOT /dev/grp/root
$ mkfs.ext4 -L HOME /dev/grp/home

# Format the FAT32 filesystem partition
$ mkfs.fat -F32 -n EFI /dev/sda1
```

### Setup the Swap partition
{: .no_toc .pt-4}

```bash
# Format the Swap partition
$ mkswap -L SWAP /dev/grp/swap

# Activate the Swap partition
$ swapon /dev/grp/swap
```

### Mount the partitions
{: .no_toc .pt-4}

```bash
# Mount the root partition
$ mount /dev/grp/root /mnt

# Create directories
$ mkdir /mnt/{home,efi}

# Mount the home and efi partitions
$ mount /dev/grp/home /mnt/home
$ mount /dev/sda1 /mnt/efi
```

### References
{: .no_toc .text-delta .pt-4}

1. [ArchWiki - Installation guide - Format the partitions](https://wiki.archlinux.org/index.php/Installation_guide#Format_the_partitions)
1. [ArchWiki - Installation guide - Mount the file systems](https://wiki.archlinux.org/index.php/Installation_guide#Mount_the_file_systems)
1. [ArchWiki - EFI system partition](https://wiki.archlinux.org/index.php/EFI_system_partition)
1. [Man page - mkfs.ext4](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/e2fsprogs/mkfs.ext4.8.en)
1. [Man page - mkfs.fat](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/dosfstools/mkfs.fat.8.en)
1. [Man page - mkswap](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/util-linux/mkswap.8.en)
1. [Man page - swapon](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/man-pages/swapon.2.en)
1. [Man page - mkdir](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/coreutils/mkdir.1.en)
1. [Man page - mount](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/util-linux/mount.8.en)

---

## Arch Linux installation

install packages to the specified new root directory.

```bash
pacstrap /mnt base base-devel linux linux-firmware lvm2 vim man-db man-pages
```

### References
{: .no_toc .text-delta .pt-4}

- [ArchWiki - Installation guide - Install essential packages](https://wiki.archlinux.org/index.php/Installation_guide#Install_essential_packages)
- [Man page - pacstrap](https://jlk.fjfi.cvut.cz/arch/manpages/man/extra/arch-install-scripts/pacstrap.8.en)

---

## Generate static information about the filesystems

```bash
genfstab -U /mnt >> /mnt/etc/fstab
```

### References
{: .no_toc .text-delta .pt-4}

1. [ArchWiki - Installation guide - Fstab](https://wiki.archlinux.org/index.php/Installation_guide#Fstab)
1. [ArchWiki - Fstab](https://wiki.archlinux.org/index.php/Fstab)

---

## Enter the system

```bash
arch-chroot /mnt
```

### References
{: .no_toc .text-delta .pt-4}

1. [ArchWiki - Installation guide - Chroot](https://wiki.archlinux.org/index.php/Installation_guide#Chroot)

---

## Create a key for the root partition

This section cover the creation of a specially named keyfile that will be embedded in the initramfs and picked up by the encrypt hook to unlock the root filesystem (cryptdevice) automatically avoiding us to enter two passphrases during boot.

### Create the keyfile
{: .no_toc .pt-2}

```bash
# Create the keys directory with read/write/execution permissions for root
$ mkdir -m 700 /etc/luks-keys

# Create the key
$ dd bs=512 count=4 if=/dev/random of=/etc/luks-keys/root iflag=fullblock
```

### Change permissions
{: .no_toc .pt-4}

```bash
$ chmod 600 /etc/luks-keys/root
$ chmod 600 /boot/initramfs-linux*
```

### Add the keyfile to cryptsetup
{: .no_toc .pt-4}

```bash
$ cryptsetup luksAddKey /dev/sda2 /etc/luks-keys/root
```

### References
{: .no_toc .text-delta .pt-4}

1. [ArchWiki - Device encryption - Unlocking the root partition at boot](https://wiki.archlinux.org/index.php/Dm-crypt/Device_encryption#Unlocking_the_root_partition_at_boot)
1. [Man page - mkdir](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/coreutils/mkdir.1.en)
1. [Man page - dd](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/coreutils/dd.1.en)
1. [Man page - chmod](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/coreutils/chmod.1.en)
1. [Man page - cryptsetup](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/cryptsetup/cryptsetup.8.en)
