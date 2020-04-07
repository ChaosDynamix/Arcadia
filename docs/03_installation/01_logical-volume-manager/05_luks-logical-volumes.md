---
layout: default
title: Luks on logical volumes
permalink: /installation/lvm/luks-logical-volumes/
grand_parent: Installation
parent: Logical Volume Manager
nav_order: 5
---

# LVM / Luks on logical volumes
{: .no_toc}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

{%- assign scenario = site.data.lvm.luks-logical-volumes %}
{%- assign rootcontainer = scenario.storage.containers | where: "name", "root" | first %}
{%- assign homecontainer = scenario.storage.containers | where: "name", "home" | first %}

{% include installation_secure-erase.md data=scenario %}
{% include installation_partitioning.md data=scenario %}
{% include installation_lvm.md data=scenario %}

## Setup the Root volume

### Create the container
{: .no_toc}

```bash
$ cryptsetup --type luks1 luksFormat {{ rootcontainer.node }}
$ cryptsetup open {{ rootcontainer.node }} {{ rootcontainer.name }}
```

### Setup the container
{: .no_toc .mt-6}

```bash
$ mkfs.ext4 -L ROOT {{ rootcontainer.mapper }}
$ mount {{ rootcontainer.mapper }} /mnt
```

---

{% include installation_efi.md data=scenario %}
{% include installation_essential-packages.md data=scenario %}
{% include installation_filesystem-table.md data=scenario %}
{% include installation_keyfile.md data=scenario %}

## Setup the Home volume

### Create the container
{: .no_toc}

```bash
$ cryptsetup --type luks1 luksFormat {{ homecontainer.node }} /etc/luks-keys/{{ homecontainer.keyfile }}
$ cryptsetup -d /etc/luks-keys/{{ homecontainer.keyfile }} open {{ homecontainer.node }} {{ homecontainer.name }}
```

### Setup the container
{: .no_toc .mt-6}

```bash
$ mkfs.ext4 -L HOME {{ homecontainer.mapper }}
$ mount {{ homecontainer.mapper }} /home
```

---

## Add entries to Fstab and Crypttab

### /etc/fstab
{: .no_toc .fs-3 .mb-0}

```bash
/dev/mapper/swap      none        swap        sw              0 0
{{ homecontainer.mapper }}      /home       ext4        defaults        0 2
```

### /etc/crypttab
{: .no_toc .fs-3 .mb-0}

```bash
swap    /dev/grp/cryptswap    /dev/urandom	         swap,cipher=aes-xts-plain64,size=256
{{ homecontainer.name }}    {{ homecontainer.node }}    /etc/luks-keys/{{ homecontainer.keyfile }}
```

---

{% include installation_initial-ramdisk.md data=scenario %}
{% include installation_microcode.md %}
{% include installation_boot-loader.md data=scenario %}
