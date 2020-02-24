---
layout: default
title: STR4 Raid
nav_exclude: true
permalink: /storage/raid/
has_toc: false
---

# Storage Raid
{: .no_toc}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

## Build the arrays

#### UEFI / Raid1
{: .no_toc .pt-2}

```bash
# EFI array
$ mdadm --create --verbose --level=1 --metadata=1.0 --raid-devices=2 /dev/md/efi /dev/sda1 /dev/sdb1

# ROOT array
$ mdadm --create --verbose --level=1 --metadata=1.2 --raid-devices=2 /dev/md/root /dev/sda2 /dev/sdb2
```

#### References
{: .no_toc .text-delta .pt-4}

- [ArchWiki - RAID - Build the array](https://wiki.archlinux.org/index.php/RAID#Build_the_array)

---

## Check the arrays
{: .no_toc}

```bash
$ cat /proc/mdstat
```

#### References
{: .no_toc .text-delta .pt-4}

- [ArchWiki - RAID - Build the array](https://wiki.archlinux.org/index.php/RAID#Build_the_array)

---

## Update configuration file

```bash
$ mdadm --detail --scan >> /etc/mdadm.conf
```

#### References
{: .no_toc .text-delta .pt-4}

- [ArchWiki - RAID - Update the configuration file](https://wiki.archlinux.org/index.php/RAID#Update_configuration_file)
