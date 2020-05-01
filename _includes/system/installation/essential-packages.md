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

##### Example
```
$ pacstrap /mnt base linux linux-firmware {{ scenario.pkg_list }} vim man-db man-pages
```

---

## Generate the fstab file

genfstab helps fill in an fstab file by autodetecting all the current mounts below a given mountpoint and printing them in fstab-compatible format to standard output.

It can be used to persist a manually mounted filesystem hierarchy and is often used during the initial install and configuration of an OS.

```
$ genfstab -U /mnt >> /mnt/etc/fstab
```

---

## Enter the system

```
$ arch-chroot /mnt
```
