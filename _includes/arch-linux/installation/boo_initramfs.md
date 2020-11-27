## Setup the initial ramdisk images

The initial ramdisk is in essence a very small environment (early userspace) which loads various kernel modules and sets up necessary things before handing over control to init.

This makes it possible to have, for example, encrypted root file systems and root file systems on a software RAID array. mkinitcpio allows for easy extension with custom hooks, has autodetection at runtime, and many other features.

### Copy the UUID of the root partition in `/etc/crypttab.initramfs`
```
blkid /dev/nvme0n1p2 > /etc/crypttab.initramfs
```

### Edit the configuration in `/etc/crypttab.initramfs`
```
cryptroot       UUID=device_UUID
```

### Edit the configuration in `/etc/mkinitcpio.conf`
```
HOOKS=(base systemd autodetect modconf block sd-vconsole sd-encrypt filesystems keyboard fsck)
```

### Generate the images
```
mkinitcpio -p linux-lts
```

#### References
{: .text-delta .pt-4}

1. [ArchWiki - Mkinitcpio](https://wiki.archlinux.org/index.php/Mkinitcpio)
1. [ArchWiki - Dm-crypt / System configuration](https://wiki.archlinux.org/index.php/Dm-crypt/System_configuration#Using_sd-encrypt_hook)
1. [ManPage - Mkinitcpio](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/mkinitcpio/mkinitcpio.8.en)
1. [ManPage - Blkid](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/util-linux/blkid.8.en)
{: .fs-3}
