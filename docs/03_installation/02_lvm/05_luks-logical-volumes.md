---
layout: default
title: Luks-logical-volumes
permalink: /installation/lvm/luks-logical-volumes/
grand_parent: Installation
parent: LVM
nav_order: 5
---

# LVM / Luks on logical volumes

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

{%- assign scenario = site.data.lvm.luks-logical-volumes %}
{%- assign rootcontainer = scenario.storage.containers | where: "name", "root" | first %}
{%- assign homecontainer = scenario.storage.containers | where: "name", "home" | first %}

{% include installation/secure-erase.md data=scenario %}
{% include installation/partitioning.md data=scenario %}
{% include installation/lvm.md data=scenario %}

## Setup the Root volume

### Create the container
```bash
$ cryptsetup --type luks1 luksFormat {{ rootcontainer.node }}
$ cryptsetup open {{ rootcontainer.node }} {{ rootcontainer.name }}
```

### Setup the container
```bash
$ mkfs.ext4 -L ROOT {{ rootcontainer.mapper }}
$ mount {{ rootcontainer.mapper }} /mnt
```

---

{% include installation/efi.md data=scenario %}
{% include installation/essential-packages.md data=scenario %}
{% include installation/filesystem-table.md data=scenario %}
{% include installation/keyfile.md data=scenario %}

## Setup the Home volume

### Create the container
```bash
$ cryptsetup --type luks1 luksFormat {{ homecontainer.node }} /etc/luks-keys/{{ homecontainer.keyfile }}
$ cryptsetup -d /etc/luks-keys/{{ homecontainer.keyfile }} open {{ homecontainer.node }} {{ homecontainer.name }}
```

### Setup the container
```bash
$ mkfs.ext4 -L HOME {{ homecontainer.mapper }}
$ mount {{ homecontainer.mapper }} /home
```

---

## Add entries to Fstab and Crypttab

##### /etc/fstab
```bash
/dev/mapper/swap      none        swap        sw              0 0
{{ homecontainer.mapper }}      /home       ext4        defaults        0 2
```

##### /etc/crypttab
```bash
swap    /dev/grp/cryptswap    /dev/urandom	         swap,cipher=aes-xts-plain64,size=256
{{ homecontainer.name }}    {{ homecontainer.node }}    /etc/luks-keys/{{ homecontainer.keyfile }}
```

---

{% include installation/initial-ramdisk.md data=scenario %}
{% include installation/microcode.md %}
{% include installation/boot-loader.md data=scenario %}
