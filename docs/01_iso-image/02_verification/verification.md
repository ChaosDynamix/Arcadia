---
layout: default
title: Verification
permalink: /iso-image/verification/
parent: ISO image
nav_order: 2
has_children: true
has_toc: false
---

# Verification
{: .no_toc}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

## Download the signature file
{: .d-inline-block}

Warning
{: .label .label-red .mx-2}

Signature must be downloaded from the Arch Linux download page. The signature could be manipulated if it is downloaded from a mirror site.
{: .text-red-200}

1. Open your browser and go to the [Arch Linux download page](https://www.archlinux.org/download/)
1. Under the HTTP Direct Downloads section, download the PGP signature.

---

## Verify The Arch Linux ISO image with GnuPG

Replace the name of the file accordingly

```bash
$ gpg --keyserver-options auto-key-retrieve --verify archlinux-year.month.day-x86_64.iso.sig
```

---

## References
{: .no_toc}

### DIGITAL SIGNATURE
{: .no_toc .text-delta}

1. [Wikipedia - Public key cryptography](https://en.wikipedia.org/wiki/Public-key_cryptography)
1. [Wikipedia - Digital signature](https://en.wikipedia.org/wiki/Digital_signature)
1. [Wikipedia - RSA](https://en.wikipedia.org/wiki/RSA_(cryptosystem))

### GNU PRIVACY GUARD
{: .no_toc .text-delta .mt-5}

1. [GNU Privacy Guard website](https://www.gnupg.org/)
1. [Wikipedia - GNU Privacy Guard](https://en.wikipedia.org/wiki/GNU_Privacy_Guard)
1. [ArchWiki - Installation guide - Verify signature](https://wiki.archlinux.org/index.php/Installation_guide#Verify_signature)
1. [ArchWiki - GnuPG - Verify a signature](https://wiki.archlinux.org/index.php/GnuPG#Verify_a_signature)

### MANUALS
{: .no_toc .text-delta .mt-5}

1. [Man page - gpg](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/gnupg/gpg.1.en)
