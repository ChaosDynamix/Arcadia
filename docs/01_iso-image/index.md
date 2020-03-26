---
layout: default
title: ISO image
permalink: /iso-image/
nav_order: 1
has_children: true
has_toc: false
---

# ISO image
{: .mb-4}

This part cover the download and verification of the Arch Linux ISO image.
{: .fs-5}

---


## [Download](/Andromeda/iso-image/download/)

Download means to receive data from a remote system, typically a server such as a web server, an FTP server, an email server, or other similar systems.

Arch Linux ISO image can be downloaded with multiple remote systems, this guide cover two of them

- BitTorrent
- Mirror site

Make sure that the system you are running is trusted, updated and work properly in order to reduce the propability of a corrupted downloaded file. The size of the ISO image is approximately 651.0 MB.

Remember that the guide only cover Linux.

---

## [Verification](/Andromeda/iso-image/verification/)

Integrity verification performed in the download section is not enough as it is not designed to be collision resistant. It is computationally trivial for an attacker to cause deliberate hash collisions, meaning that a malicious change in the file is not detected by this verification.

A collision or clash is a situation that occurs when two distinct pieces of data have the same hash value, checksum, fingerprint, or cryptographic digest.

However, if a message is digitally signed, any change in the message after signature invalidates the signature. Furthermore, there is no efficient way to modify a message and its signature to produce a new message with a valid signature, because this is still considered to be computationally infeasible by most cryptographic hash functions.

---

## References

### ISO IMAGE
{: .text-delta}

1. [Wikipedia - ISO image](https://en.wikipedia.org/wiki/ISO_image)


### DOWNLOAD
{: .text-delta .mt-5}

1. [Wikipedia - Download](https://en.wikipedia.org/wiki/Download)
1. [Wikipedia - BitTorrent](https://en.wikipedia.org/wiki/BitTorrent)
1. [Wikipedia - Mirror site](https://en.wikipedia.org/wiki/Mirror_site)

### CRYPTOGRAPHY
{: .text-delta .mt-5}

1. [Wikipedia - Cryptographic hash function](https://en.wikipedia.org/wiki/Cryptographic_hash_function)
1. [Wikipedia - File verification](https://en.wikipedia.org/wiki/File_verification)
1. [Wikipedia - Checksum](https://en.wikipedia.org/wiki/Checksum)
1. [Wikipedia - Collision](https://en.wikipedia.org/wiki/Collision_(computer_science))
1. [Wikipedia - Collision resistance](https://en.wikipedia.org/wiki/Collision_resistance)
1. [Wikipedia - Digital signature](https://en.wikipedia.org/wiki/Digital_signature)
