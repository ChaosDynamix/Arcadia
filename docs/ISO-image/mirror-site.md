---
layout: default
title: Mirror site
parent: Download
grand_parent: ISO image
nav_order: 2 
permalink: /iso-image/download/mirror-site/
---

# ISO image download with a mirror site
{: .no_toc}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

## About

Mirror sites or mirrors are replicas of other websites or any network node. Such sites have different URLs than the original site, but host identical or near-identical content. Mirror sites are often located in a different geographic region than the original, or upstream site.

The purpose of mirrors is to reduce network traffic, improve access speed, ensure availability of the original site for technical or political reasons, or provide a real-time backup of the original site.

In our context, the mirror sites linked on the Arch Linux website provide packages and installation files for all the users.

### References 
{: .no_toc .text-delta .pt-5}

- [Wikipedia - Mirror site](https://en.wikipedia.org/wiki/Mirror_site)

---

## Download Arch Linux ISO image

1. Open your browser and go to the [Arch Linux download page](https://www.archlinux.org/download/)
1. Under the HTTP Direct Downloads section, click on a mirror server located in your country
1. Download the Arch Linux ISO image `archlinux-year.day.month-x86_64.iso`

---

## Verify the ISO image integrity

The Arch Linux developers use two cryptographic hash functions for generate a checksum of their image, **MD5** and **SHA-1**.

A cryptographic hash function is a hash function that is suitable for use in cryptography. It is a mathematical algorithm that maps data of arbitrary size (the "message") to a bit string of a fixed size (the "checksum" or "message digest").

**in our context, the "message" is the Arch Linux ISO image.**

For verify the integrity of the downloaded image, we need to generate a checksum with MD5 or SHA-1 and compare it with the appropriate checksum provided by Arch Linux.

### Download the checksum
{: .no_toc}

**Warning !** Checksums must be downloaded from the Arch Linux download page. The checksums could be manipulated if it is downloaded from a mirror site instead of from The Arch Linux website.

1. Open your browser and go to the [Arch Linux download page](https://www.archlinux.org/download/)
1. Under the HTTP Direct Downloads section, copy the checksum of your choice (MD5 or SHA-1)

### Create a text file
{: .no_toc}

```bash
## Replace the checksum and the filename accordingly

archlinux-checksum-md5.txt
--------------------------------------------------------------------
00000000000000000000000000000000 archlinux-year.month.day-x86_64.iso

archlinux-checksum-sha1.txt
----------------------------------------------------------------------------
0000000000000000000000000000000000000000 archlinux-year.month.day-x86_64.iso
```

### Use the appropriate tool to verify your image
{: .no_toc}

#### Using md5sum or sha1sum
{: .no_toc}

```bash
## MD5 checksum
md5sum -c archlinux-checksum-md5.txt

## SHA-1 checksum
sha1sum -c archlinux-checksum-sha1.txt
```

The success of one of these commands confirms that your ISO image was properly downloaded and that your local file is an exact copy of the file present on the mirror server. An error during the download could result in a corrupted file and trigger random issues during the installation.

### References
{: .no_toc .text-delta .pt-5}

- [Wikipedia - Checksum](https://en.wikipedia.org/wiki/Checksum)
- [Wikipedia - Cryptographic hash function](https://en.wikipedia.org/wiki/Cryptographic_hash_function)
- [Wikipedia - MD5](https://en.wikipedia.org/wiki/MD5)
- [Wikipedia - SHA-1](https://en.wikipedia.org/wiki/SHA-1)
- [Manual - md5sum](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/coreutils/md5sum.1.en)
- [Manual - sha1sum](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/coreutils/sha1sum.1.en)
