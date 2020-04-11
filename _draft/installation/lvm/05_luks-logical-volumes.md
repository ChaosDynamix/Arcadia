---
layout: default
title: Luks-logical-volumes
permalink: /installation/lvm/luks-logical-volumes/
nav_exclude: true
---

# LVM / Luks on logical volumes

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

{% assign luks-logical-volumes = site.data.docs.installation.lvm.template.luks-logical-volumes %}
{% assign luks-lvm = site.data.docs.installation.lvm.scenario.luks-lvm %}

{% include docs/installation/secure-erase.md template=luks-logical-volumes %}
{% include docs/installation/partitioning.md template=luks-logical-volumes %}

<!--

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

-->
