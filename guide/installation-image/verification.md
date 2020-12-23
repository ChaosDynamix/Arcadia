---
title     : !!str Verification
nav_order : !!int 2
permalink : !!str /installation-image/verification
parent    : !!str Installation image
---

# {{ page.title }}
{: .no_toc }

This page describes how to verify the Arch Linux ISO image with the files needed to verify it's integrity and authenticity. This step is very important!
{: .fs-5 .fw-300}

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

## Arch Linux ISO image verification

The goal of this section is to verify if the previously downloaded ISO image is strictly identical and has the same signature as the ISO image created by the Arch Linux team. Although this is extremely rare, it is possible that a mirror provide a modified and therefore dangerous ISO image.

Before starting, verify that you have the 3 files below in the **same folder**. The commands displayed in this section must be running in this folder.

| Filename                                  | Description    |
| :---------------------------------------- | :------------- |
| `archlinux-year.day.month-x86_64.iso`     | ISO image      |
| `archlinux-year.day.month-x86_64.iso.txt` | SHA-1 checksum |
| `archlinux-year.day.month-x86_64.iso.sig` | Signature      |

### Verify the integrity of the Arch Linux ISO image

```
sha1sum -c archlinux-year.month.day-x86_64.iso.txt
```

### Verify the authenticity of the Arch Linux ISO image

Arch Linux users can skip the command displayed below and run the following command instead `pacman-key -v archlinux-year.month.day-x86_64.iso.sig`.

This command differ from the official Arch Linux installation guide. The keyserver is explicitly declared as we dont know the GnuPG default keyserver configured by your Linux distribution.

```
gpg --keyserver-options auto-key-retrieve \
    --keyserver pool.sks-keyservers.net \
    --verify archlinux-year.month.day-x86_64.iso.sig
```

### References
{: .text-delta .pt-4}

1. [ArchWiki - Installation guide](https://wiki.archlinux.org/index.php/Installation_guide#Verify_signature)
1. [ArchWiki - GnuPG](https://wiki.archlinux.org/index.php/GnuPG#Use_a_keyserver)
1. [ManPage - Md5sum](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/coreutils/md5sum.1.en)
1. [ManPage - Sha1sum](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/coreutils/sha1sum.1.en)
1. [ManPage - Gpg](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/gnupg/gpg.1.en)
1. [SKS keyservers](https://sks-keyservers.net/)
{: .fs-3}
