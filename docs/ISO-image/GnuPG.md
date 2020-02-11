---
layout: default
title: GnuPG
parent: Verification
grand_parent: ISO image
nav_order: 1
permalink: /iso-image/verification/gnupg/
---

# USB device preparation with GnuPG
{: .no_toc} 

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

## About

GnuPG is a complete and free implementation of the OpenPGP standard as defined by RFC4880 (also known as PGP). GnuPG allows you to encrypt and sign your data and communications. It also can be used for verify signatures.

GnuPG supports the RSA public key algorithm which is used to sign the Arch Linux ISO image.

### References
{: .no_toc .text-delta .pt-5}

- [Wikipedia - GNU Privacy Guard](https://en.wikipedia.org/wiki/GNU_Privacy_Guard)
- [Wikipedia - RSA](https://en.wikipedia.org/wiki/RSA_(cryptosystem))

---

## Download the signature file

**Warning** : Signature must be downloaded from the Arch Linux download page. The signature could be manipulated if it is downloaded from a mirror site instead of from the Arch Linux download page.

1. Open your browser and go to the [Arch Linux download page](https://www.archlinux.org/download/)
1. Under the HTTP Direct Downloads section, click on the PGP signature link.

---

## Verify ISO image with the signature file
 
This part assume that you are in possession of this two files in the same folder

| File                                    | Description    |
| --------------------------------------- | -------------- |
| archlinux-year.day.month-x86_64.iso     | ISO Image      |
| archlinux-year.day.month-x86_64.iso.sig | Signature file |

```bash
## Replace the name of the file accordingly
gpg --keyserver-options auto-key-retrieve --verify archlinux-year.month.day-x86_64.iso.sig
```

### References
{: .no_toc .text-delta .pt-5}

- [ArchWiki - Installation guide - Verify signature](https://wiki.archlinux.org/index.php/Installation_guide#Verify_signature)
