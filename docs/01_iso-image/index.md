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

---

## [Verification](/Andromeda/iso-image/verification/)

Integrity verification performed in the download section is not enough as it is not designed to be collision resistant. It is computationally trivial for an attacker to cause deliberate hash collisions, meaning that a malicious change in the file is not detected by this verification.

A collision or clash is a situation that occurs when two distinct pieces of data have the same hash value, checksum, fingerprint, or cryptographic digest.

However, if a message is digitally signed, any change in the message after signature invalidates the signature. Furthermore, there is no efficient way to modify a message and its signature to produce a new message with a valid signature, because this is still considered to be computationally infeasible by most cryptographic hash functions.

This page cover the authenticity verification of your downloaded ISO image with the signature provided by Arch Linux.

---

## References

### DOWNLOAD
{: .no_toc .text-delta .pt-2}

1. [Wikipedia - Download](https://en.wikipedia.org/wiki/Download)

### BITTORRENT
{: .no_toc .text-delta .pt-4}

1. [Wikipedia - BitTorrent](https://en.wikipedia.org/wiki/BitTorrent)

### MIRROR SITE
{: .no_toc .text-delta .pt-4}

1. [Wikipedia - Mirror site](https://en.wikipedia.org/wiki/Mirror_site)

### CRYPTOGRAPHY
{: .no_toc .text-delta .pt-4}

1. [Wikipedia - Cryptographic hash function](https://en.wikipedia.org/wiki/Cryptographic_hash_function)
1. [Wikipedia - File verification](https://en.wikipedia.org/wiki/File_verification)
1. [Wikipedia - Checksum](https://en.wikipedia.org/wiki/Checksum)
1. [Wikipedia - Collision](https://en.wikipedia.org/wiki/Collision_(computer_science))
1. [Wikipedia - Collision resistance](https://en.wikipedia.org/wiki/Collision_resistance)
1. [Wikipedia - Digital signature](https://en.wikipedia.org/wiki/Digital_signature)
