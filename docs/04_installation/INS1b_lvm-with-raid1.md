---
layout: default
title: LVM with RAID1
nav_order: 2
parent: 04 Installation
permalink: /installation/lvm-with-raid1/
---

UEFI
{: .label .label-purple .ml-0}

LUKS1
{: .label .label-purple}

LUKS2
{: .label .label-purple}

EXT4
{: .label .label-purple}

# Installation guide for LVM with RAID1
{: .no_toc .mt-2}

| Device | Partition | Partition type                     | Size            |
| :----- | :-------- | :--------------------------------- | :-------------- |
| 1      | /dev/sda1 | EFI system partition               | 512M            |
| 1      | /dev/sda2 | Linux Logical Volume Manager (LVM) | 100%FREE - 100M |
| 2      | /dev/sdb1 | EFI system partition               | 512M            |
| 2      | /dev/sdb2 | Linux Logical Volume Manager (LVM) | 100%FREE - 100M |

```
+----------------------+------------------------+ +----------------------+------------------------+
| EFI system partition | Logical Volume Manager | | EFI system partition | Logical Volume Manager |
| /efi                 |                        | | /efi2                |                        |
|                      |                        | |                      |                        |
|                      |                        | |                      |                        |
| /dev/sda1            | /dev/sda2              | | /dev/sdb1            | /dev/sdb2              |
+----------------------+------------------------+ +--------------------- +------------------------+
```

```
+-------------------------------------------------------------------------------------------------+
|                                        Physical volume                                          |
|                                      /dev/sda2 /dev/sdb2                                        |
+-------------------------------------------------------------------------------------------------+
|                                         Group volume                                            |
|                                           /dev/grp/                                             |
+-------------------------------+-------------------------------+---------------------------------+
| Logical volume 1              | Logical volume 2              | Logical volume 3                |
| /dev/grp/swap                 | /dev/grp/root                 | /dev/grp/home                   |
+-------------------------------+-------------------------------+---------------------------------+
| Encrypted volume              | LUKS1 encrypted volume        | LUKS2 encrypted volume          |
| [SWAP]                        | /                             | /home                           |
| /dev/mapper/swap              | /dev/mapper/root              | /dev/mapper/home                |
+-------------------------------+-------------------------------+---------------------------------+
```

## Table of contents
{: .no_toc .text-delta}

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

1. [ArchWiki - Dm-crypt - Drive preparation - Secure erasure of the hard disk drive](https://wiki.archlinux.org/index.php/Dm-crypt/Drive_preparation#Secure_erasure_of_the_hard_disk_drive)
1. [Man page - cryptsetup](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/cryptsetup/cryptsetup.8.en)
1. [Man page - dd](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/coreutils/dd.1.en)

---

## Partitioning

1. Open the tool of your choice on `/dev/sda`
1. Create a GPT partition table
1. Create a partition of 512MiB
1. Change the type of the partition to EFI system `C12A7328-F81F-11D2-BA4B-00A0C93EC93B`
1. Create a partition of all the remaining space of your drive minus 100 MiB [3]
1. Change the type of the partition to Linux LVM `E6D6D379-F507-44C2-A23C-238F2A3DF928`

### Clone the disk partitioning setup to `/dev/sdb`
{: .no_toc .pt-4}

```bash
# Dump the partitions of a device in a format that is usable as input to sfdisk
$ sfdisk -d /dev/sda > sda.dump

# Create the partitions with /dev/sda dump
$ sfdisk /dev/sdb < sda.dump
```

### References
{: .no_toc .text-delta .pt-4}

1. [Wikipedia - GUID partition table](https://en.wikipedia.org/wiki/GUID_Partition_Table)
1. [ArchWiki - Partitioning - Partitioning tools](https://wiki.archlinux.org/index.php/Partitioning#Partitioning_tools)
1. [ArchWiki - RAID - Partition the devices - Tip](https://wiki.archlinux.org/index.php/RAID#Partition_the_devices)
1. [ArchWiki - EFI system partition - Create the partition](https://wiki.archlinux.org/index.php/EFI_system_partition#Create_the_partition)
1. [Man pages - sfdisk](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/util-linux/sfdisk.8.en)

---

## Logical Volume Manager

See [3] and [4] references for size recommendations

```bash
# Physical volume
$ pvcreate /dev/sda2 /dev/sdb2

# Volume group
$ vgcreate grp /dev/sda2 /dev/sdb2

# Logical volumes
$ lvcreate --type raid1 --mirrors 1 -L 8G -n cryptswap grp /dev/sda2 /dev/sdb2
$ lvcreate --type raid1 --mirrors 1 -L 20G -n cryptroot grp /dev/sda2 /dev/sdb2
$ lvcreate --type raid1 --mirrors 1 -l 100%FREE -n crypthome grp /dev/sda2 /dev/sdb2
```

#### References
{: .no_toc .text-delta .pt-4}

1. [ArchWiki - Dm-crypt - Encrypting an entire system - LVM on LUKS - Preparing the logical volumes](https://wiki.archlinux.org/index.php/Dm-crypt/Encrypting_an_entire_system#Preparing_the_logical_volumes)
1. [ArchWiki - LVM - Volume operations](https://wiki.archlinux.org/index.php/LVM#Volume_operations)
1. [ArchWiki - Partitioning - Discrete partitions](https://wiki.archlinux.org/index.php/Partitioning#Discrete_partitions)
1. [VOID Linux Partitions Notes - SWAP partitions](https://docs.voidlinux.org/installation/live-images/partitions.html#swap-partitions)
1. [Man page - pvcreate](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/lvm2/pvcreate.8.en)
1. [Man page - vgcreate](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/lvm2/vgcreate.8.en)
1. [Man page - lvcreate](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/lvm2/lvcreate.8.en)

---

## Root encryption

```bash
# Create the container
$ cryptsetup --type luks1 luksFormat /dev/grp/cryptroot

# Open the container
$ cryptsetup open /dev/grp/cryptroot root
```

### References
{: .no_toc .text-delta .pt-4}

1. [ArchWiki - Dm-crypt - Encrypting an entire system - LVM on LUKS](https://wiki.archlinux.org/index.php/Dm-crypt/Encrypting_an_entire_system#LVM_on_LUKS)
1. [ArchWiki - GRUB - Encrypted /boot](https://wiki.archlinux.org/index.php/GRUB#Encrypted_/boot)
1. [Man page - cryptsetup](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/cryptsetup/cryptsetup.8.en)

---

## Partitions setup

### Format the partitions
{: .no_toc .pt-2}

```bash
# Format the EXT4 filesystem partition
$ mkfs.ext4 -L ROOT /dev/mapper/root

# Format the FAT32 filesystem partitions
$ mkfs.fat -F32 -n EFI /dev/sda1
$ mkfs.fat -F32 -n EFI /dev/sdb1
```

### Mount the partitions
{: .no_toc .pt-4}

```bash
# Mount the root partition
$ mount /dev/mapper/root /mnt

# Create directories
$ mkdir /mnt/{efi1,efi2}

# Mount the efi partitions
$ mount /dev/sda1 /mnt/efi1
$ mount /dev/sdb1 /mnt/efi2
```

### References
{: .no_toc .text-delta .pt-4}

1. [ArchWiki - Installation guide - Format the partitions](https://wiki.archlinux.org/index.php/Installation_guide#Format_the_partitions)
1. [ArchWiki - Installation guide - Mount the file systems](https://wiki.archlinux.org/index.php/Installation_guide#Mount_the_file_systems)
1. [ArchWiki - EFI system partition](https://wiki.archlinux.org/index.php/EFI_system_partition)
1. [Man page - mkfs.ext4](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/e2fsprogs/mkfs.ext4.8.en)
1. [Man page - mkfs.fat](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/dosfstools/mkfs.fat.8.en)
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

## Create the keys for root and home partitions

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
$ cryptsetup luksFormat -v /dev/MyVolGroup/crypthome /etc/luks-keys/home

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
