---
layout: default
title: Initial ramdisk
permalink: /configuration/initial-ramdisk/
parent: Configuration
nav_order: 4
has_children: true
has_toc: false
---

# Configuration / Initial ramdisk
{: .no_toc}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

## Setup the keyfile(s)

### Create the keys directory
{: .no_toc .pt-2}

```bash
$ mkdir -m 700 /etc/luks-keys
```

### Generate the key(s)
{: .no_toc .pt-2}

#### SINGLE CONTAINER
{: .no_toc .mt-5}

```bash
$ dd bs=512 count=4 if=/dev/random of=/etc/luks-keys/container iflag=fullblock
```

#### MULTIPLE CONTAINERS
{: .no_toc .mt-5}

```bash
$ dd bs=512 count=4 if=/dev/random of=/etc/luks-keys/container1 iflag=fullblock
$ dd bs=512 count=4 if=/dev/random of=/etc/luks-keys/container2 iflag=fullblock
```

### Change permissions
{: .no_toc .pt-4}

#### SINGLE CONTAINER
{: .no_toc .mt-5}

```bash
$ chmod 600 /etc/luks-keys/container
$ chmod 600 /boot/initramfs-linux*
```

#### MULTIPLE CONTAINERS
{: .no_toc .mt-5}

```bash
$ chmod 600 /etc/luks-keys/container1
$ chmod 600 /etc/luks-keys/container2
$ chmod 600 /boot/initramfs-linux*
```

### Add the keyfiles in the corresponding containers
{: .no_toc .pt-4}

#### SINGLE CONTAINER
{: .no_toc .mt-5}

```bash
$ cryptsetup luksAddKey /dev/sda2 /etc/luks-keys/container
```

#### RAID1
{: .no_toc .mt-5}

```bash
$ cryptsetup luksAddKey /dev/md/array /etc/luks-keys/container
```

#### MULTIPLE CONTAINERS
{: .no_toc .mt-5}

```bash
$ cryptsetup luksAddKey /dev/sda2 /etc/luks-keys/container1
$ cryptsetup luksAddKey /dev/sdb2 /etc/luks-keys/container2
```

---

## Edit the configuration

#### LVM
{: .no_toc .mt-5}

/etc/mkinitcpio.conf
{: .fs-3 .mb-0}

```bash
FILES=(/etc/luks-keys/container)
HOOKS=(base udev autodetect modconf block encrypt lvm2 filesystems keyboard keymap fsck)
```

---

## Generate images

```bash
mkinitcpio -p linux
```

---

## References
{: .no_toc}
