## Install the essential packages

### Package types

- Base package
- Userspace utilities for the management of file systems that will be used on the system
- Utilities for accessing RAID or LVM partitions
- Specific firmware for other devices not included in `linux-firmware`
- A text editor
- Packages for accessing documentation in man and info pages

### Officially Arch Linux supported kernels

| Kernel     | Package        | Description                                                                                                       |
| :--------- | :------------- |:----------------------------------------------------------------------------------------------------------------- |
| Stable     | linux          | Vanilla Linux kernel and modules, with a few patches applied                                                      |
| Hardened   | linux-hardened | A security-focused Linux kernel applying a set of hardening patches to mitigate kernel and userspace exploits     |
| Longterm   | linux-lts      | Long-term support (LTS) Linux kernel and modules                                                                  |
| Zen Kernel | linux-zen      | Result of a collaborative effort of kernel hackers to provide the best Linux kernel possible for everyday systems |

### Launch the pacstrap script

pacstrap is designed to create a new system installation from scratch. The specified packages will be installed into a given directory after setting up some basic mountpoints. By default, the host system’s pacman signing keys and mirrorlist will be used to seed the chroot.

```
$ pacstrap /mnt base linux linux-firmware{% if scenario.pacstrap.has_needed_packages %} {{ scenario.pacstrap.needed_packages }}{% endif %} sudo vim man-db man-pages
```

### References
{: .text-delta .pt-4}

1. [ArchWiki - Kernel](https://wiki.archlinux.org/index.php/Kernel)
1. [ArchWiki - Installation guide](https://wiki.archlinux.org/index.php/Installation_guide)
1. [ManPage - Pacstrap](https://jlk.fjfi.cvut.cz/arch/manpages/man/extra/arch-install-scripts/pacstrap.8.en)
{: .fs-3}
