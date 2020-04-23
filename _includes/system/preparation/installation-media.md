## Prepare the USB flash device

### List your devices

```
$ fdisk -l
```

### Flash the USB flash device

Edit path/to/archlinux.iso and sdX accordingly

```
$ dd bs=4M if=path/to/archlinux.iso of=/dev/sdX status=progress oflag=sync
```

### Boot the USB flash device

In order to boot on the USB device, we need to modify the firmware configuration with the firmware setup utility.

If asked during the boot (by pressing a key), you can temporarily select and boot on a device. Don't follow this procedure if you are in this scenario.

1. Turn on your computer
1. When asked, press the key to enter your firmware setup utility
1. Change the boot order and put your USB device in the first position
1. Save changes and reboot
1. Select `boot Arch Linux (X86_64)` or `Arch Linux archiso X86_64 UEFI CD`
