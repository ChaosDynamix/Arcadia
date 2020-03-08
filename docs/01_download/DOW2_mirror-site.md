---
layout: default
title: Mirror site
parent: 01 Download
nav_order: 2
permalink: /download/mirror-site/
---

# Download Arch Linux with a mirror site
{: .no_toc}

---

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

## Download the Arch Linux ISO image

1. Open your browser and go to the [Arch Linux download page](https://www.archlinux.org/download/)
1. Under the HTTP Direct Downloads section, click on a mirror server (close to your location)
1. Download the Arch Linux ISO image `archlinux-year.day.month-x86_64.iso`


### INFORMATIONS
{: .no_toc .text-delta .pt-4}

1. [Wikipedia - Mirror site](https://en.wikipedia.org/wiki/Mirror_site)

---

## Verify the integrity of the downloaded file

### Download the checksum
{: .no_toc .mt-0 .d-inline-block}

Warning
{: .label .label-red .mx-2}

Checksum must be downloaded from the Arch Linux download page. The checksum could be manipulated if it is downloaded from a mirror site.
{: .text-red-200}

1. Open your browser and go to the [Arch Linux download page](https://www.archlinux.org/download/)
1. Under the HTTP Direct Downloads section, copy the checksum of your choice (MD5 or SHA-1)

### Create a text file
{: .no_toc .pt-4}

archlinux-checksum-md5.txt
{: .fs-3 .mb-0}

```bash
# Replace the checksum and the filename accordingly
00000000000000000000000000000000 archlinux-year.month.day-x86_64.iso
```

archlinux-checksum-sha1.txt
{: .fs-3 .pt-2 .mb-0}

```bash
# Replace the checksum and the filename accordingly
0000000000000000000000000000000000000000 archlinux-year.month.day-x86_64.iso
```

### Verify the ISO image
{: .no_toc .pt-4}

The Arch Linux developers use two cryptographic hash functions for generate a checksum of their ISO images, **MD5** and **SHA-1**.

For verify the integrity of the downloaded image, we need to generate a checksum with MD5 or SHA-1 and compare it with the appropriate checksum provided by Arch Linux.

#### MD5
{: .no_toc .pt-2}

```bash
$ md5sum -c archlinux-checksum-md5.txt
```

#### SHA-1
{: .no_toc .pt-2}

```bash
$ sha1sum -c archlinux-checksum-sha1.txt
```

The success of one of these commands confirms that your ISO image was properly downloaded and that your local file is an exact copy of the file present on the mirror server. An error during the download could result in a corrupted file and trigger random issues during the installation.

### INFORMATIONS
{: .no_toc .text-delta .pt-4}

1. [Wikipedia - Cryptographic hash function](https://en.wikipedia.org/wiki/Cryptographic_hash_function)
1. [Wikipedia - MD5](https://en.wikipedia.org/wiki/MD5)
1. [Wikipedia - SHA-1](https://en.wikipedia.org/wiki/SHA-1)

### MANUALS
{: .no_toc .text-delta .pt-4}

1. [Man page - md5sum](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/coreutils/md5sum.1.en)
1. [Man page - sha1sum](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/coreutils/sha1sum.1.en)

---

## Verify the authenticity of the downloaded file with GnuPG

### Download the signature file
{: .no_toc .mt-2 .d-inline-block}

Warning
{: .label .label-red .mx-2}

Signature must be downloaded from the Arch Linux download page. The signature could be manipulated if it is downloaded from a mirror site.
{: .text-red-200}

1. Open your browser and go to the [Arch Linux download page](https://www.archlinux.org/download/)
1. Under the HTTP Direct Downloads section, download the PGP signature.

### Verify ISO image
{: .no_toc .pt-4}

This part assume that you are in possession of this two files in the same folder.

| File                                    | Description    |
| :-------------------------------------- | :------------- |
| archlinux-year.day.month-x86_64.iso     | ISO Image      |
| archlinux-year.day.month-x86_64.iso.sig | Signature file |

```bash
# Replace the name of the file accordingly
$ gpg --keyserver-options auto-key-retrieve --verify archlinux-year.month.day-x86_64.iso.sig
```

### INFORMATIONS
{: .no_toc .text-delta .pt-4}

1. [Wikipedia - Public key cryptography](https://en.wikipedia.org/wiki/Public-key_cryptography)
1. [Wikipedia - Digital signature](https://en.wikipedia.org/wiki/Digital_signature)
1. [Wikipedia - RSA](https://en.wikipedia.org/wiki/RSA_(cryptosystem))
1. [Wikipedia - GNU Privacy Guard](https://en.wikipedia.org/wiki/GNU_Privacy_Guard)

### GUIDES
{: .no_toc .text-delta .pt-4}

1. [ArchWiki - Installation guide - Verify signature](https://wiki.archlinux.org/index.php/Installation_guide#Verify_signature)
1. [ArchWiki - GnuPG - Verify a signature](https://wiki.archlinux.org/index.php/GnuPG#Verify_a_signature)

### MANUALS
{: .no_toc .text-delta .pt-4}

1. [Man page - gpg](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/gnupg/gpg.1.en)
