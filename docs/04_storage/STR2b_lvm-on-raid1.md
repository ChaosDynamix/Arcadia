---
layout: default
title: STR2 LVM on RAID1
grand_parent: 04 Storage
parent: STR2 Scenarios
nav_order: 2
permalink: /storage/scenarios/lvm-on-raid1/
has_toc: false
---

# Storage scenario for LVM on RAID1
{: .no_toc}

```
+----------------------+------------------------+ +----------------------+------------------------+
| EFI system partition | LUKS1 encrypted volume | | EFI system partition | LUKS1 encrypted volume |
|                      | /dev/mapper/lvm        | |                      | /dev/mapper/lvm        |
|                      +------------------------+ |                      +------------------------+
|                      | RAID1 array (part 1)   | |                      | RAID1 array (part 2)   |
|                      | /dev/md/lvm            | |                      | /dev/md/lvm            |
|                      +------------------------+ |                      +------------------------+
|                      |                        | |                      |                        |
| /dev/sda1            | /dev/sda2              | | /dev/sdb1            | /dev/sdb2              |
+----------------------+------------------------+ +--------------------- +------------------------+
```

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
