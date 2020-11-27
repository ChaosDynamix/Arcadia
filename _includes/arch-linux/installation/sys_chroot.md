## Enter the system

arch-chroot wraps the chroot command while ensuring that important functionality is available, e.g. mounting `/dev/`, `/proc` and other API filesystems, or exposing resolv.conf to the chroot. chroot is made for running command or interactive shell with special root directory. 

```
arch-chroot /mnt
```

### References
{: .text-delta .pt-4}

1. [ArchWiki - Chroot](https://wiki.archlinux.org/index.php/Chroot)
1. [ManPage - Arch-chroot](https://jlk.fjfi.cvut.cz/arch/manpages/man/extra/arch-install-scripts/arch-chroot.8.en)
{: .fs-3}
