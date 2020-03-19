---
layout: default
title: Initial ramdisk
permalink: /configuration/initial-ramdisk/
parent: Configuration
nav_order: 4
has_toc: false
---

# Configuration of the initial ramdisk
{: .no_toc}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

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

### Replace Busybox with Systemd
{: .no_toc .pt-4}

/etc/mkinitcpio.conf
{: .fs-3 .pt-2 .mb-0}

```bash
FILES=(/etc/luks-keys/cryptvolume1 /etc/luks-keys/cryptvolume2)
HOOKS=(base systemd autodetect modconf block sd-encrypt sd-lvm2 filesystems keyboard fsck)
```

### Create crypttab.initramfs

/etc/crypttab.initramfs
{: .fs-3 .pt-2}

```bash
# Mount /dev/sda2 as /dev/mapper/cryptvolume1 using LUKS with a keyfile
cryptvolume1    /dev/sda2     /etc/luks-keys/cryptvolume1

# Mount /dev/sda2 as /dev/mapper/cryptvolume1 using LUKS with a keyfile
cryptvolume2    /dev/sdb1     /etc/luks-keys/cryptvolume2
```

### Generate images

mkinitcpio need to create /etc/crypttab from the /etc/crypttab.initramfs we just created

```bash
mkinitcpio -p linux
```
