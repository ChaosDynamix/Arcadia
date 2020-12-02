## Setup the Systemd boot manager

systemd-boot, previously called gummiboot, is a simple UEFI boot manager which executes configured EFI images. The default entry is selected by a configured pattern (glob) or an on-screen menu to be navigated via arrow-keys. It is included with systemd, which is installed on an Arch system by default.

### Install the EFI boot manager
```
bootctl install
```

### Edit the loader configuration in `/boot/loader/loader.conf`
```
default         arch.conf
timeout         5
console-mode    keep
editor          no
```

### Copy the UUID of the root filesystem in `/boot/loader/entries/arch.conf`
```
blkid /dev/mapper/cryptroot > /boot/loader/entries/arch.conf
```

### Edit the entry configuration in `/boot/loader/entries/arch.conf`
```
title       Arch Linux
linux       /vmlinuz-linux-lts
initrd      /intel-ucode.img
initrd      /initramfs-linux-lts.img
options     rd.luks.options=discard root="UUID=root_filesystem" quiet rw
```

#### References
{: .text-delta .pt-4}

1. [ArchWiki - Systemd-boot](https://wiki.archlinux.org/index.php/Systemd-boot)
1. [ArchWiki - Dm-crypt / System configuration](https://wiki.archlinux.org/index.php/Dm-crypt/System_configuration#Using_sd-encrypt_hook)
1. [ManPage - Bootctl](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/systemd/bootctl.1.en)
1. [ManPage - Blkid](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/util-linux/blkid.8.en)
{: .fs-3}
