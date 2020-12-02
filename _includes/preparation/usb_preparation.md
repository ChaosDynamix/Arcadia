## USB flash device preparation

To avoid data corruption, The USB flash device used as the installation medium have to work properly and should be fairly recent. Before starting this section, make sure your USB flash device is plugged into a working USB port on your computer. 

### Identify your USB flash device

Identify the correct device file is really important as the copy of the Arch Linux ISO image will completely wipe the content of your USB flash device. A backup of any existing content should be made to avoid any data loss.

In Unix-like operating systems, a device file or special file is an interface to a device driver that appears in a file system as if it were an ordinary file.

```
sudo fdisk -l
```

With the informations given by fdisk, you can now safely identify the device file of your USB flash device (e.g. /dev/sda).

### Copy the Arch Linux ISO image on your USB flash device

Make sure to replace the path of the Arch Linux ISO image `path/to/archlinux-year.month.day-x86_64.iso` and the **very important device file** `/dev/sdx`.

```
cp path/to/archlinux-year.month.day-x86_64.iso /dev/sdx
sync
```

### References
{: .text-delta .pt-4}

1. [Wikipedia - Device file](https://en.wikipedia.org/wiki/Device_file)
1. [Wikipedia - USB flash drive](https://en.wikipedia.org/wiki/USB_flash_drive)
1. [ArchWiki - Device file](https://wiki.archlinux.org/index.php/Device_file)
1. [ArchWiki - USB flash installation media](https://wiki.archlinux.org/index.php/USB_flash_installation_media)
1. [ArchWiki - Core utilities](https://wiki.archlinux.org/index.php/Core_utilities)
1. [ManPage - Cp](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/coreutils/cp.1.en)
1. [ManPage - Sync](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/coreutils/sync.1.en)
{: .fs-3}
