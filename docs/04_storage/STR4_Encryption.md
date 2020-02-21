---
layout: default
title: STR4 Encryption
nav_order: 4
parent: 04 Storage
permalink: /storage/encryption/
has_toc: false
---

# Storage encryption
{: .no_toc}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

## Partition encryption

#### LVM
{: .no_toc .pt-4}

```bash
$ cryptsetup luksFormat /dev/sdXY
$ cryptsetup open /dev/sdXY lvm
```

#### BTRFS
{: .no_toc .pt-4}

```bash
$ cryptsetup --type luks1 luksFormat /dev/sdXY
$ cryptsetup open /dev/sdXY btrfs
```

---

## Full disk encryption

#### LVM
{: .no_toc .pt-4}

```bash
$ cryptsetup --cipher=aes-xts-plain64 --offset=0 --key-file=/dev/sdc --key-size=512 open --type plain /dev/sda lvm
```

#### BTRFS
{: .no_toc .pt-4}

```bash
$ cryptsetup --cipher=aes-xts-plain64 --offset=0 --key-file=/dev/sdc --key-size=512 open --type plain /dev/sda btrfs
```
