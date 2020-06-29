## Prepare the USB flash device

### List your devices

Identify your USB flash device node.

```
$ fdisk -l
```

### Flash the USB flash device

Edit `path/to/archlinux.iso` and `sdX` accordingly

```
$ dd bs=4M if=path/to/archlinux.iso of=/dev/sdX status=progress oflag=sync
```

### Boot the USB flash device

In order to boot on the USB device, you need to modify the firmware configuration with the firmware setup utility.

If asked during the boot (by pressing a key), you can temporarily select and boot on a device. Don't follow this procedure if you are in this scenario.

1. Turn on your computer
1. When asked, press the key to enter your firmware setup utility
1. Change the boot order and put your USB device in the first position
1. Save changes and reboot
1. Select `boot Arch Linux (X86_64)` or `Arch Linux archiso X86_64 UEFI CD`

### References

1. [Wikipedia - USB flash drive](https://en.wikipedia.org/wiki/USB_flash_drive)
1. [Wikipedia - Dd](https://en.wikipedia.org/wiki/Dd_(Unix))
1. [Wikipedia - Firmware](https://en.wikipedia.org/wiki/Firmware)
1. [Wikipedia - BIOS](https://en.wikipedia.org/wiki/BIOS)
1. [Wikipedia - UEFI](https://en.wikipedia.org/wiki/Unified_Extensible_Firmware_Interface)
1. [ArchWiki - USB flash installation media](https://wiki.archlinux.org/index.php/USB_flash_installation_media)
1. [ArchWiki - Dd](https://wiki.archlinux.org/index.php/Dd)
1. [ManPage - Dd](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/coreutils/dd.1.en)
{: .fs-3}
