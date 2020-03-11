---
layout: default
title: ISO image
permalink: /iso-image/
nav_order: 1
has_children: true
has_toc: false
---

# ISO image

---


## [Download](/Andromeda/iso-image/download/)

In computer networks, download means to receive data from a remote system. This contrasts with uploading, where data is sent to a remote server.

This page cover the Arch Linux ISO image download using two remote system

- BitTorrent
- Mirror site

File integrity can be compromised, usually referred to as the file becoming corrupted. In our case, the ISO image can be corrupted on the remote system or during the download.

### File integrity verification with BitTorrent
{: .no_toc .pt-4}

With BitTorrent, the file being distributed is divided into segments called pieces. Each piece is protected by a cryptographic hash contained in the torrent descriptor. This ensures that any modification of the piece can be reliably detected, and thus prevents both accidental and malicious modifications of any of the pieces received at other nodes.

### File integrity verification with a Mirror site
{: .no_toc .pt-4}

With a Mirror site, no integrity verification are done, we need to manually copy the cryptographic hash (checksum) provided by Arch Linux and test it againt the file we just downloaded.

---

## [Verification](/Andromeda/iso-image/verification/)

To verify the authenticity, a classical cryptographic hash function is not enough as they are not designed to be collision resistant. It is computationally trivial for an attacker to cause deliberate hash collisions, meaning that a malicious change in the file is not detected by a hash comparison (integrity verification).

### Collision
{: .no_toc .pt-4}

A collision or clash is a situation that occurs when two distinct pieces of data have the same hash value, checksum, fingerprint, or cryptographic digest.

However, if a message is digitally signed, any change in the message after signature invalidates the signature. Furthermore, there is no efficient way to modify a message and its signature to produce a new message with a valid signature, because this is still considered to be computationally infeasible by most cryptographic hash functions.

### Digital signature
{: .no_toc .pt-4}

A digital signature is a mathematical scheme for verifying the authenticity of digital messages or documents. A valid digital signature, where the prerequisites are satisfied, gives a recipient very strong reason to believe that the message was created by a known sender (authentication), and that the message was not altered in transit (integrity).

This page cover the authenticity verification of your downloaded ISO image with the signature provided by Arch Linux.

---

## REFERENCES
{: .no_toc .text-delta}

1. [Wikipedia - Download](https://en.wikipedia.org/wiki/Download)
1. [Wikipedia - Cryptographic hash function](https://en.wikipedia.org/wiki/Cryptographic_hash_function)
1. [Wikipedia - File verification](https://en.wikipedia.org/wiki/File_verification)
1. [Wikipedia - Checksum](https://en.wikipedia.org/wiki/Checksum)
1. [Wikipedia - BitTorrent](https://en.wikipedia.org/wiki/BitTorrent)
1. [Wikipedia - Collision](https://en.wikipedia.org/wiki/Collision_(computer_science))
1. [Wikipedia - Collision resistance](https://en.wikipedia.org/wiki/Collision_resistance)
1. [Wikipedia - Digital signature](https://en.wikipedia.org/wiki/Digital_signature)
