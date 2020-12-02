## USB flash device boot

Now that your USB flash device is prepared, we need to make sure that your computer is ready and properly configured to boot on the USB flash device.

### Unplug the unnecessary devices and peripherals

To decrease the amount of troubleshooting steps if something goes wrong, all the unnecessary devices and peripherals should be unplugged from the computer by following the steps below. This is even more important for the users who have multiple storages devices as this could lead to the loss of sensitive data. To avoid this specific issue, unplug all the storage devices that are not involved in the installation.

1. Safely shutdown your computer
1. Switch off your power supply and unplug the power cable
1. If you have one, wear an antistatic device to prevent ESD
1. Unplug every devices and peripherals not needed for the installation
1. Disable every motherboard components not needed for the installation

When Arch Linux will be successfully installed, you will be able to reactivate/reconnect all the devices and peripherals one by one. This will allow you to know if a device causes issues on your system.

### Modify the configuration of your firmware setup utility

Without modifications, your firmware setup utility is likely to be configured to firstly boot on your storage device or on your CDROM device (if you have one). This configuration prevents you to boot on the Arch Linux installation medium. To solve this problem, you will need to change the configuration of the boot order by moving your USB flash device at the first position.

1. Plug the power cable and switch on your power supply
1. Turn on your computer

During the boot of the computer, some users can actually bypass the following steps and temporarily select a device to boot on by pressing a specific key combination (the key combination depends entirely on the computer/motherboard/firmware).

1. When asked, press the key to enter your firmware setup utility
1. Change the boot order and put your USB device at the first position
1. Save changes and reboot

### Boot the computer on the USB flash device

If everything goes well, you should see the boot manager of the Arch Linux installation medium.

1. Select `Arch Linux archiso X86_64 UEFI CD` and hit enter

### References
{: .text-delta .pt-4}

1. [Wikipedia - Electrostatic discharge](https://en.wikipedia.org/wiki/Electrostatic_discharge)
1. [Wikipedia - Antistatic device](https://en.wikipedia.org/wiki/Antistatic_device)
1. [Wikipedia - Firmware](https://en.wikipedia.org/wiki/Firmware)
1. [Wikipedia - BIOS](https://en.wikipedia.org/wiki/BIOS)
1. [Wikipedia - UEFI](https://en.wikipedia.org/wiki/Unified_Extensible_Firmware_Interface)
1. [ArchWiki - Installation guide](https://wiki.archlinux.org/index.php/Installation_guide#Boot_the_live_environment)
{: .fs-3}
