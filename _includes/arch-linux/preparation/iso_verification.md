## Verify the Arch Linux ISO image

| Required files in the same folder         | Description |
| :---------------------------------------- | :---------- |
| `archlinux-year.month.day-x86_64.iso`     | ISO image   |
| `archlinux-year.month.day-x86_64.iso.sig` | Signature   |

### Create the checksum and verify the integrity of the ISO image

The creation of the checksum file must be made in the same folder containing the ISO image and the Signature file.

```
echo "<CHECKSUM> archlinux-year.month.day-x86_64.iso" > archlinux-year.month.day-x86_64.iso.txt
sha1sum -c archlinux-year.month.day-x86_64.iso.txt
```

**Note**: Replace `<CHECKSUM>` with the SHA-1 checksum copied in the Arch Linux download page.
{: .fs-3}

### Verify the authenticity of the ISO image
```
gpg --keyserver-options auto-key-retrieve \
    --keyserver pool.sks-keyservers.net \
    --verify archlinux-year.month.day-x86_64.iso.sig
```

**Note**: Arch Linux users can run the following command instead : `pacman-key -v archlinux-year.month.day-x86_64.iso.sig`
{: .fs-3}


### References
{: .text-delta .pt-4}

1. [ArchWiki - Installation guide](https://wiki.archlinux.org/index.php/Installation_guide#Verify_signature)
1. [ArchWiki - GnuPG](https://wiki.archlinux.org/index.php/GnuPG#Use_a_keyserver)
1. [ManPage - Md5sum](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/coreutils/md5sum.1.en)
1. [ManPage - Sha1sum](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/coreutils/sha1sum.1.en)
1. [ManPage - Gpg](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/gnupg/gpg.1.en)
1. [SKS keyservers](https://sks-keyservers.net/)
{: .fs-3}
