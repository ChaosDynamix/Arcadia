---
layout: default
title: BitTorrent
parent: 01 Download
nav_order: 1
permalink: /download/bittorrent/
---

Recommended
{: .label .label-green .mx-0}

No anonymity
{: .label .label-red}

# Download Arch Linux with BitTorrent
{: .no_toc .mt-0}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

## Install BitTorrent client

If you download your BitTorrent client from a website, it is important to verify (if possible) the integrity and the authenticity of your downloaded file.

1. Open your browser and go to the [Wikipedia BitTorrent clients comparison page](https://en.wikipedia.org/wiki/Comparison_of_BitTorrent_clients)
1. Select BitTorrent client with
  - Availability for your operating system
  - Open source software license
  - Web-seeding feature (Recommended)
1. Download the BitTorrent client
1. Install the BitTorrent client

### References
{: .no_toc .text-delta .pt-4}

1. [Wikipedia - Cryptographic hash function](https://en.wikipedia.org/wiki/Cryptographic_hash_function)
1. [Wikipedia - Comparison of file verification software](https://en.wikipedia.org/wiki/Comparison_of_file_verification_software)
1. [Wikipedia - Public key cryptography](https://en.wikipedia.org/wiki/Public-key_cryptography)
1. [Wikipedia - Digital signature](https://en.wikipedia.org/wiki/Digital_signature)
1. [Wikipedia - BitTorrent](https://en.wikipedia.org/wiki/BitTorrent)

---

## Download Arch Linux ISO image

After finishing the download, please consider sparing the bytes by leaving the client open so you can seed it back.

1. Open your browser and go to the [Arch Linux download page](https://www.archlinux.org/download/)
1. Under the BitTorrent Download section, click on the Torrent link.
1. Open the BitTorrent client previously installed
1. Add the torrent file
1. Wait until the Arch Linux ISO image is fully downloaded

### References
{: .no_toc .text-delta .pt-4}

1. [Wikipedia - BitTorrent](https://en.wikipedia.org/wiki/BitTorrent)

---

## Verify the authenticity of the downloaded file

### Download the signature file
{: .no_toc .mt-0 .d-inline-block}

Warning
{: .label .label-red .mx-2}

Signature must be downloaded from the Arch Linux download page. The signature could be manipulated if it is downloaded from a mirror site.
{: .text-red-200}

1. Open your browser and go to the [Arch Linux download page](https://www.archlinux.org/download/)
1. Under the HTTP Direct Downloads section, click on the PGP signature link.

### Verify ISO image with GnuPG
{: .no_toc .pt-4}

This part assume that you are in possession of this two files in the same folder. If your operating system is Windows, you can install [Gpg4win](https://en.wikipedia.org/wiki/Gpg4win) wich implement GnuPG.

| File                                    | Description    |
| :-------------------------------------- | :------------- |
| archlinux-year.day.month-x86_64.iso     | ISO Image      |
| archlinux-year.day.month-x86_64.iso.sig | Signature file |

```bash
# Replace the name of the file accordingly
$ gpg --keyserver-options auto-key-retrieve --verify archlinux-year.month.day-x86_64.iso.sig
```

### References
{: .no_toc .text-delta .pt-4}

1. [Wikipedia - Public key cryptography](https://en.wikipedia.org/wiki/Public-key_cryptography)
1. [Wikipedia - Digital signature](https://en.wikipedia.org/wiki/Digital_signature)
1. [Wikipedia - RSA](https://en.wikipedia.org/wiki/RSA_(cryptosystem))
1. [Wikipedia - GNU Privacy Guard](https://en.wikipedia.org/wiki/GNU_Privacy_Guard)
1. [ArchWiki - Installation guide - Verify signature](https://wiki.archlinux.org/index.php/Installation_guide#Verify_signature)
1. [ArchWiki - GnuPG](https://wiki.archlinux.org/index.php/GnuPG)
1. [Man pages - gpg](https://jlk.fjfi.cvut.cz/arch/manpages/man/core/gnupg/gpg.1.en)
