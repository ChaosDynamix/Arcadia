## Flash the USB flash device

This version of the project only shows the USB flash device flashing using `dd`. If you can't use `dd`, simply download and install `etcher` for your operating system and flash your USB device.
{: .fs-3}

### List the devices of the system

Identify your USB flash device node.

```
$ fdisk -l
```

### Copy the image of Arch Linux on the USB flash device

Edit `path/to/archlinux.iso` and `sdX` accordingly

```
$ dd bs=4M if=path/to/archlinux.iso of=/dev/sdX status=progress oflag=sync
```

### References
{: .text-delta .pt-4}

1. [Wikipedia - USB flash drive](https://en.wikipedia.org/wiki/USB_flash_drive)
1. [Wikipedia - Dd](https://en.wikipedia.org/wiki/Dd_(Unix))
1. [ArchWiki - USB flash installation media](https://wiki.archlinux.org/index.php/USB_flash_installation_media)
1. [ArchWiki - Dd](https://wiki.archlinux.org/index.php/Dd)
1. [ManPage - Dd](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/coreutils/dd.1.en)
{: .fs-3}
