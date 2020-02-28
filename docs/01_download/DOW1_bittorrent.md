---
layout: default
title: BitTorrent
parent: 01 Download
nav_order: 1
permalink: /download/bittorrent/
---

# Download Arch Linux with BitTorrent
{: .no_toc}

## Table of contents
{: .no_toc .text-delta}

1. TOC
{:toc}

---

## With BitTorrent
{: .d-inline-block}

Recommended
{: .label .label-green .mx-2}

No anonymity
{: .label .label-red .mx-0}

BitTorrent  is a communication protocol for peer-to-peer file sharing (P2P). Rather than downloading a file from a single source server, the  BitTorrent protocol allows users to join a "swarm" of hosts to upload  to/download from each other simultaneously.

### Download the ISO image
{: .no_toc .pt-4}

1. Install a BitTorrent client
1. Open your browser and go to the [Arch Linux download page](https://www.archlinux.org/download/)
1. Under the BitTorrent Download section, click on the Torrent link.
1. Open the BitTorrent client of your choice
1. Add the torrent file
1. Wait until the Arch Linux ISO image is fully downloaded

After finishing the download, please consider sparing the bytes by leaving the client open so you can seed it back.

### Using Transmission
{: .no_toc .d-inline-block}

Linux
{: .label .mx-2}

This section show the Arch Linux download procedure using `transmission-cli` package.

```bash
# Launch the daemon
$ transmission-daemon

# Add and start the download of Arch Linux using the torrent file
# Replace the link accordingly (years.day.month)
$ transmission-remote -a https://www.archlinux.org/releng/releases/2020.01.01/torrent/

# Check the progress of the download
$ transmission-remote -l

# Stop the daemon after the image is fully downloaded
$ transmission-remote --exit
```

### References
{: .no_toc .text-delta .pt-4}

- [Wikipedia - BitTorrent](https://en.wikipedia.org/wiki/BitTorrent)
- [Wikipedia - Comparison of BitTorrent clients](https://en.wikipedia.org/wiki/Comparison_of_BitTorrent_clients)
- [Arch Linux - Download page](https://www.archlinux.org/download/)
- [ArchWiki - Transmission](https://wiki.archlinux.org/index.php/Transmission)
- [Manual - transmission-daemon](https://jlk.fjfi.cvut.cz/arch/manpages/man/extra/transmission-cli/transmission-daemon.1.en)
- [Manual - transmission-remote](https://jlk.fjfi.cvut.cz/arch/manpages/man/extra/transmission-cli/transmission-remote.1.en)

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
