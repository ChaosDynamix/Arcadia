---
layout: default
title: BitTorrent
parent: 01 Download
nav_order: 1
permalink: /download/bittorrent/
---

# Download Arch Linux with BitTorrent
{: .no_toc}

---

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

## Download Arch Linux ISO image with transmission-cli

### Download the torrent file
{: .no_toc .pt-2}

1. Open your browser and go to the [Arch Linux download page](https://www.archlinux.org/download/)
1. Under the BitTorrent Download section, download the Torrent file.

### Launch the transmission daemon
{: .no_toc .pt-4}

```bash
$ transmission-daemon
```

### Add the torrent file in transmission
{: .no_toc .pt-4}

```bash
$ transmission-remote -a archlinux-2020.03.01-x86_64.iso.torrent
```

### Check the progress of the download
{: .no_toc .pt-4}

After finishing the download, please consider sparing the bytes by leaving the client open so you can seed it back.

```bash
$ watch transmission-remote -i
```

### Stop the transmission daemon
{: .no_toc .pt-4}

```bash
$ transmission-remote --exit
```

### References
{: .no_toc .text-delta .pt-4}

1. [Wikipedia - BitTorrent](https://en.wikipedia.org/wiki/BitTorrent)

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
