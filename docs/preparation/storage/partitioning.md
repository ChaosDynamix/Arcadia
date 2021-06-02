---
title: Partitioning
---

# Partitioning
This page describes how to create a partition table and the partitions needed to install Arch Linux on a NVMe storage device.

## Create the partition table and the partitions

### Identify the device file of your storage device
| Device type                           | Device file         | Partition file          |
| :------------------------------------ | :------------------ | :---------------------- |
| SCSI/PATA/SATA & USB/IEEE 1394 device | sda, sdb...         | sda1, sda2...           |
| IDE device                            | hda, hdb...         | hda1, hda2...           |
| NVMe device                           | nvme0, nvme1...     | nvme0n1p1, nvme0n1p2... |
| SD Cards, eMMC chips etc...           | mmcblk0, mmcblk1... | mmcblk0p1, mmcblk0p2... |

Fdisk is a dialog-driven program for creation and manipulation of partition tables. The `-l` argument ask fdisk to list the partition tables for the devices and then exit.

```
fdisk -l
```

### Launch the Sgdisk script
| Partition node | Partition type       | Partition size          |
| :------------- | :------------------- | :---------------------- |
| /dev/nvme0n1p1 | EFI system partition | 550 MiB                 |
| /dev/nvme0n1p2 | Linux LUKS partition | All the space remaining |

Sgdisk is the command-line version of gdisk program. GPT fdisk (aka gdisk) is a text-mode menu-driven program for creation and manipulation of partition tables.

```
sgdisk --clear \
       --new 1:0:+550M \
       --new 2:0:0 \
       --typecode 1:ef00 \
       --typecode 2:8309 \
       /dev/nvme0n1
```

### References
1. [Wikipedia - Device file](https://en.wikipedia.org/wiki/Device_file)
1. [Wikipedia - Disk partitioning](https://en.wikipedia.org/wiki/Disk_partitioning)
1. [Wikipedia - Partition table](https://en.wikipedia.org/wiki/Partition_table)
1. [Wikipedia - GUID partition table](https://en.wikipedia.org/wiki/GUID_Partition_Table)
1. [ArchWiki - GPT fdisk](https://wiki.archlinux.org/index.php/GPT_fdisk)
1. [ManPage - Fdisk](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/util-linux/fdisk.8.en)
1. [ManPage - Sgdisk](https://jlk.fjfi.cvut.cz/arch/manpages/man/extra/gptfdisk/sgdisk.8.en)
