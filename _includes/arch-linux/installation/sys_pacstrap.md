## Install the essential packages

### Select the packages 

1. Select a [Linux kernel](https://wiki.archlinux.org/index.php/Kernel)
1. Select a [Text editor](https://wiki.archlinux.org/index.php/List_of_applications#Text_editors)
1. Select a [Privilege elevation program](https://wiki.archlinux.org/index.php/List_of_applications#Privilege_elevation)

### Install the packages with pacstrap

Pacstrap is designed to create a new system installation from scratch. The specified packages will be installed into a given directory after setting up some basic mountpoints. By default, the host system’s pacman signing keys and mirrorlist will be used to seed the chroot.

```
pacstrap /mnt base base-devel linux-lts linux-firmware neovim man-db man-pages
```

**Note**: `base` package is mandatory. `linux-firmware` package is recommended. The other packages are based on my personal choices.
{: .fs-3}

### References
{: .text-delta .pt-4}

1. [ArchWiki - Kernel](https://wiki.archlinux.org/index.php/Kernel)
1. [ArchWiki - Installation guide](https://wiki.archlinux.org/index.php/Installation_guide)
1. [ManPage - Pacstrap](https://jlk.fjfi.cvut.cz/arch/manpages/man/extra/arch-install-scripts/pacstrap.8.en)
{: .fs-3}
