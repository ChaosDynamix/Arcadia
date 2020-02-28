---
layout: default
title: Mirror site
parent: 01 Download
nav_order: 2
permalink: /download/mirror-site/
---

# Download Arch Linux with a mirror site
{: .no_toc}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

## With a Mirror site

Mirror sites or mirrors are replicas of other websites or any network node. Such sites have different URLs than the original site, but host identical or near-identical content. Mirror sites are often located in a different geographic region than the original, or upstream site.

### Download the ISO image
{: .no_toc .pt-4}

1. Open your browser and go to the [Arch Linux download page](https://www.archlinux.org/download/)
1. Under the HTTP Direct Downloads section, click on a mirror server located in your country
1. Download the Arch Linux ISO image `archlinux-year.day.month-x86_64.iso`


### References
{: .no_toc .text-delta .pt-4}

- [Wikipedia - Mirror site](https://en.wikipedia.org/wiki/Mirror_site)

---

## Download the ISO image checksum
{: .d-inline-block}

Warning
{: .label .label-red .mx-2}

Checksum must be downloaded from the Arch Linux download page. The checksum could be manipulated if it is downloaded from a mirror site.
{: .text-red-200}

1. Open your browser and go to the [Arch Linux download page](https://www.archlinux.org/download/)
1. Under the HTTP Direct Downloads section, copy the checksum of your choice (MD5 or SHA-1)

---

## Create a text file for the checksum

Replace the checksum and the filename accordingly

```bash
archlinux-checksum-md5.txt
--------------------------------------------------------------------
00000000000000000000000000000000 archlinux-year.month.day-x86_64.iso

archlinux-checksum-sha1.txt
----------------------------------------------------------------------------
0000000000000000000000000000000000000000 archlinux-year.month.day-x86_64.iso
```

---

## Verify the ISO image integrity with the checksum file

The Arch Linux developers use two cryptographic hash functions for generate a checksum of their image, **MD5** and **SHA-1**.

For verify the integrity of the downloaded image, we need to generate a checksum with MD5 or SHA-1 and compare it with the appropriate checksum provided by Arch Linux.

```bash
# MD5 checksum
md5sum -c archlinux-checksum-md5.txt

# SHA-1 checksum
sha1sum -c archlinux-checksum-sha1.txt
```

The success of one of these commands confirms that your ISO image was properly downloaded and that your local file is an exact copy of the file present on the mirror server. An error during the download could result in a corrupted file and trigger random issues during the installation.

### References
{: .no_toc .text-delta .pt-5}

- [Wikipedia - MD5](https://en.wikipedia.org/wiki/MD5)
- [Wikipedia - SHA-1](https://en.wikipedia.org/wiki/SHA-1)
- [Manual - md5sum](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/coreutils/md5sum.1.en)
- [Manual - sha1sum](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/coreutils/sha1sum.1.en)

---

## About public key cryptography

Public-key cryptography, or asymmetric cryptography, is a cryptographic system that uses pairs of keys

- public keys which may be disseminated widely
- private keys which are known only to the owner

Effective security only requires keeping the private key private. The public key can be openly distributed without compromising security.

### Public key cryptography for digital signatures
{: .no_toc}

A message is signed with the sender's private key and can be verified by anyone who has access to the sender's public key. This verification proves that the sender had access to the private key, and therefore is likely to be the person associated with the public key.

This also ensures that the message has not been tampered with, as a signature is mathematically bound to the message it originally was made with, and verification will fail for practically any other message, no matter how similar to the original message.

### References
{: .no_toc .text-delta .pt-4}

- [Wikipedia - Public key cryptography](https://en.wikipedia.org/wiki/Public-key_cryptography)
- [Wikipedia - Digital signature](https://en.wikipedia.org/wiki/Digital_signature)

---

## About GnuPG

GnuPG is a complete and free implementation of the OpenPGP standard as defined by RFC4880 (also known as PGP). GnuPG allows you to encrypt and sign your data and communications. It also can be used for verify signatures.

GnuPG supports the RSA public key algorithm which is used to sign the Arch Linux ISO image.

### References
{: .no_toc .text-delta .pt-4}

- [Wikipedia - GNU Privacy Guard](https://en.wikipedia.org/wiki/GNU_Privacy_Guard)
- [Wikipedia - RSA](https://en.wikipedia.org/wiki/RSA_(cryptosystem))

---

## Download the signature file
{: .d-inline-block}

Warning
{: .label .label-red .mx-2}

Signature must be downloaded from the Arch Linux download page. The signature could be manipulated if it is downloaded from a mirror site.
{: .text-red-200}

1. Open your browser and go to the [Arch Linux download page](https://www.archlinux.org/download/)
1. Under the HTTP Direct Downloads section, click on the PGP signature link.

---

## Verify ISO image with the signature file

This part assume that you are in possession of this two files in the same folder

| File                                    | Description    |
| :-------------------------------------- | :------------- |
| archlinux-year.day.month-x86_64.iso     | ISO Image      |
| archlinux-year.day.month-x86_64.iso.sig | Signature file |

```bash
## Replace the name of the file accordingly
gpg --keyserver-options auto-key-retrieve --verify archlinux-year.month.day-x86_64.iso.sig
```

### References
{: .no_toc .text-delta .pt-4}

- [ArchWiki - Installation guide - Verify signature](https://wiki.archlinux.org/index.php/Installation_guide#Verify_signature)
