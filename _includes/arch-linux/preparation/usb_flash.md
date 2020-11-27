## Flash the USB flash device

### Identify the correct USB flash device
```
fdisk -l
```

### Copy the Arch Linux ISO image on the USB flash device
```
cp path/to/archlinux-year.month.day-x86_64.iso /dev/sdx
sync
```

**Note**: Replace `path/to/archlinux-year.month.day-x86_64.iso` and `/dev/sdx` accordingly.
{: .fs-3}

### References
{: .text-delta .pt-4}

1. [Wikipedia - USB flash drive](https://en.wikipedia.org/wiki/USB_flash_drive)
1. [ArchWiki - USB flash installation media](https://wiki.archlinux.org/index.php/USB_flash_installation_media)
1. [ArchWiki - Core utilities](https://wiki.archlinux.org/index.php/Core_utilities)
1. [ManPage - Cp](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/coreutils/cp.1.en)
1. [ManPage - Sync](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/coreutils/sync.1.en)
{: .fs-3}
