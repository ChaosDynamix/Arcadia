## Generate the filesystem table

genfstab helps fill in an fstab file by autodetecting all the current mounts below a given mountpoint and printing them in fstab-compatible format to standard output.

It can be used to persist a manually mounted filesystem hierarchy and is often used during the initial install and configuration of an OS.

```
genfstab -U /mnt >> /mnt/etc/fstab
```

### References
{: .text-delta .pt-4}

1. [Wikipedia - Fstab](https://en.wikipedia.org/wiki/Fstab)
1. [ArchWiki - Fstab](https://wiki.archlinux.org/index.php/Fstab)
1. [ArchWiki - Installation guide](https://wiki.archlinux.org/index.php/Installation_guide)
1. [ManPage - Genfstab](https://jlk.fjfi.cvut.cz/arch/manpages/man/extra/arch-install-scripts/genfstab.8.en)
{: .fs-3}
